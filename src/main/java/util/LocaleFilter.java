package util;

import java.io.IOException;
import java.util.Locale;
import javax.servlet.*;
import javax.servlet.http.*;

public class LocaleFilter implements Filter {
    private static final String LANG_PARAM = "lang";
    private static final String LANG_COOKIE = "lang";

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String lang = req.getParameter(LANG_PARAM);

        if (lang == null || lang.isBlank()) {
            Cookie[] cookies = req.getCookies();
            if (cookies != null) {
                for (Cookie c : cookies) {
                    if (LANG_COOKIE.equals(c.getName())) {
                        lang = c.getValue();
                        break;
                    }
                }
            }
        }

        if (lang == null || lang.isBlank()) {
            Locale browser = req.getLocale();
            lang = (browser != null && browser.getLanguage().toLowerCase().startsWith("en")) ? "en" : "vi";
        }

        Locale locale = "en".equalsIgnoreCase(lang) ? Locale.ENGLISH : new Locale("vi", "VN");
        req.getSession(true).setAttribute("javax.servlet.jsp.jstl.fmt.locale.session", locale);

        Cookie cookie = new Cookie(LANG_COOKIE, lang);
        cookie.setPath("/");
        cookie.setMaxAge(60 * 60 * 24 * 365);
        resp.addCookie(cookie);

        chain.doFilter(request, response);
    }

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
}