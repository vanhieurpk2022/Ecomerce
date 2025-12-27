package util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AuthoFilter
 */
@WebFilter(urlPatterns = {
        "/profile/*",
        "/order/*",
        "/user/*"
})
public class AuthoFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AuthoFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	 @Override
	    public void doFilter(ServletRequest request, ServletResponse response,
	                         FilterChain chain)
	            throws IOException, ServletException {

	        HttpServletRequest req = (HttpServletRequest) request;
	        HttpServletResponse resp = (HttpServletResponse) response;

	        HttpSession session = req.getSession(false);

	        boolean loggedIn = (session != null &&
	                session.getAttribute("user") != null);

	        if (loggedIn) {
	            // đã đăng nhập → cho đi tiếp
	            chain.doFilter(request, response);
	        } else {
	            // chưa đăng nhập → đá về login
	            resp.sendRedirect(req.getContextPath() + "/login/signin");
	        }
	    }

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
