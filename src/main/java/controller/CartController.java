package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.IDao;
import dao.ProductVariantsDao;
import model.Cart;
import util.CookieUtil;

/**
 * Servlet implementation class CartController
 */
@WebServlet("/cart")
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
		if (getCart.getSize() <= 0) {
			CookieUtil.clearCart(response);
		}
		response.sendRedirect("cart");

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
		doGet(request, response);
	}

}
