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

import model.Cart;
import model.User;
import model.UserSession;

/**
 * Servlet Filter implementation class AuthoFilter
 */

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
	        String path = req.getServletPath();

	        // 1. Kiểm tra đăng nhập
	        UserSession user = (session != null) ? (UserSession) session.getAttribute("user") : null;

	        if (user == null) {
	            // Chưa đăng nhập -> Lưu URL cũ để quay lại
	            if ("GET".equalsIgnoreCase(req.getMethod())) {
	                String uri = req.getRequestURI();
	                String query = req.getQueryString();
	                String originalUrl = uri + (query != null ? "?" + query : "");
	                req.getSession(true).setAttribute("redirectAfterLogin", originalUrl);
	            }
	            
	            request.setAttribute("msgtype", "error");
	            request.setAttribute("msg", "Please login to continue!");
	            req.getRequestDispatcher("/WEB-INF/views/signin.jsp").forward(request, response);
	            return;
	        }

	        // 2. Lọc quyền (Role)
	        int role = user.getRole(); // Giả sử là "ADMIN" hoặc "USER"

	        if (path.startsWith("/admin")) {
	            // Nếu vào đường dẫn admin mà không phải role ADMIN
	            if (role != 0) {
	                resp.sendError(HttpServletResponse.SC_FORBIDDEN); 
	                return;
	            }
	        } 
	        
	        // Nếu đã pass qua các bước trên -> Cho phép đi tiếp
	        chain.doFilter(request, response);
	    }


	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
