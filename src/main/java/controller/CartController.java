package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductVariantsDao;
import model.Cart;
import util.CookieUtil;

/**
 * Servlet implementation class CartController
 */
@WebServlet("/cart/*")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getPathInfo();
		HttpSession session = request.getSession();

		if(path != null) {
			switch (path) {
			case "/checkout": 
				if(session.getAttribute("user" )!=null) {
					request.getRequestDispatcher("/WEB-INF/views/checkout_user.jsp").forward(request, response);;
					return;
				}
				request.getRequestDispatcher("/WEB-INF/views/checkout_guest.jsp").forward(request, response);;
				return;
			case "/order_guest": 
				if(session.getAttribute("user" )!=null) {
					response.sendRedirect(request.getContextPath() +"/user/orders_his");
					return;
				}
				request.getRequestDispatcher("/WEB-INF/views/order_history.jsp").forward(request, response);;
				return;
					
				
			default:
				throw new IllegalArgumentException("Unexpected value: " + path);
			}
		}
		
		request.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(request, response);;

	}




	private void changeQuanity(HttpServletRequest request, HttpServletResponse response) {
		int getProductsId = Integer.parseInt(request.getParameter("id"));
		int getQuanity = Integer.parseInt(request.getParameter("quanity"));
		HttpSession session = request.getSession();

		Cart getCart = (Cart) session.getAttribute("Cart");

		getCart.changeQuanity(getProductsId, getQuanity);
	}

	private void removeProducts(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int getVariantID = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();

		Cart getCart = (Cart) session.getAttribute("Cart");

		getCart.removeItems(getVariantID);
		CookieUtil.saveCart(response, getCart);
		if (getCart.getSize() <= 0) {
			CookieUtil.clearCart(response);
		}
		
		
     // Trong Controller, trả về dạng JSON
        response.setContentType("application/json");
        response.getWriter().write("{\"totalPrice\": " + getCart.getPrice() + ", \"cartCount\": " + getCart.getSize() + "}");

	}

	private void AddProductToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		int getVariantID = Integer.parseInt(request.getParameter("variantID"));
		int getQuanity = Integer.parseInt(request.getParameter("quanity"));
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("Cart");	

		if (cart == null) {
			cart = (Cart) CookieUtil.getCart(request);

		}
	
		cart.addItem(getVariantID, getQuanity);
		session.setAttribute("Cart", cart);
		CookieUtil.saveCart(response, cart);
		
		int cartSize = cart.getSize();
		response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
		response.getWriter().write(String.valueOf(cartSize));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if (action != null) {
			switch (action) {
			case "AddProduct":
				AddProductToCart(request, response);
				break;
			case "RemoveProducts":
				removeProducts(request, response);
				break;
			case "OnchangeQuanity":
				changeQuanity(request, response);
				break;
		
			default:
				throw new IllegalArgumentException("Unexpected value: " + action);
			}
		} else {
			request.setAttribute("active", "cart");
			request.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(request, response);

		}
	}

}
