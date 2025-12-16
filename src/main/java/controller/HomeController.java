package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.IDao;
import dao.ProductsDao;
import model.Cart;
import model.Products;
import util.CookieUtil;

/**
 * Servlet implementation class HomeController
 */
@WebServlet(urlPatterns = { "/home", "" }, loadOnStartup = 1)
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		IDao dao = new ProductsDao();
		List<Products> pro1 = dao.SelectAll(0, 16);
		
		HttpSession session = request.getSession();
		Cart cart = CookieUtil.getCart(request);
		if(cart !=null) {
		    session.setAttribute("Cart", cart);

		}
		
		request.setAttribute("active", "index");
		request.setAttribute("Product1", pro1);

		request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);

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
