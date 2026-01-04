package util;

import java.io.IOException;
import java.util.Map;

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

import dao.RememberTokenDao;
import dao.UserDao;
import model.User;
import model.UserSession;

/**
 * Servlet Filter implementation class rememberFilter
 */
@WebFilter("/*")
public class rememberFilter implements Filter {

    /**
     * Default constructor. 
     */
    public rememberFilter() {
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
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	        throws IOException, ServletException {
	    HttpServletRequest req = (HttpServletRequest) request;
	    HttpServletResponse resp = (HttpServletResponse) response;
	    HttpSession session = req.getSession();
	    String path = req.getServletPath();

	    // 1. Lấy user từ session
	    UserSession user = (UserSession) session.getAttribute("user");

	    // 2. Nếu chưa có session, thử Auto-login từ Cookie
	    if (user == null) {
	        Map<String, String> cookies = CookieUtil.getLoginCookie(req);
	        String userIDStr = cookies.get("user_id");
	        String token = cookies.get("token");

	        if (userIDStr != null && token != null) {
	            RememberTokenDao tokenDao = new RememberTokenDao();
	            Integer userID = tokenDao.checkToken(Integer.parseInt(userIDStr), token);
	            
	            if (userID != null) {
	                UserDao userDao = new UserDao();
	                User userFromDB = userDao.selectUserByUserID(userID);
	                if (userFromDB != null) {
	                    user = new UserSession(userFromDB);
	                    session.setAttribute("user", user);
	                }
	            }
	        }
	    }

	    // 3. Các trang công cộng (Không chặn)
	    boolean isPublicPath = path.equals("/signin") || path.equals("/signup") || 
	                           path.equals("/home") || path.equals("/shop") ||
	                           path.startsWith("/assets") || path.startsWith("/css");

	    if (user == null && !isPublicPath) {
	        req.setAttribute("msg", "Please login to continue!");
	        req.getRequestDispatcher("/WEB-INF/views/signin.jsp").forward(req, resp);
	        return;
	    }

	    chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
