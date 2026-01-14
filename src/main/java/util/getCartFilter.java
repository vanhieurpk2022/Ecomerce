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

/**
 * Servlet Filter implementation class getCartFilter
 */
public class getCartFilter implements Filter {

    /**
     * Default constructor. 
     */
    public getCartFilter() {
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
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		 HttpServletRequest req = (HttpServletRequest) request;
		 HttpServletResponse resp = (HttpServletResponse) response;

		 // không tự tạo session
		 HttpSession session = req.getSession(false);
		 
		
		 /* ================== LOAD CART ================== */
		 Cart cart = CookieUtil.getCart(req);
		 if (cart != null) {
		     // chỉ tạo session khi thực sự cần
		     req.getSession(true).setAttribute("Cart", cart);
		 }
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
