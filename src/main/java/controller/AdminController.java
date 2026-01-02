package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/admin/*")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminController() {
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

		if (path == null || path.equals("/")) {
			request.setAttribute("choose", 1);
			request.getRequestDispatcher("/WEB-INF/admin/adminindex.jsp").forward(request, response);
			return;
		} 
			switch (path) {
			case "/order":
				request.setAttribute("choose", 2);
				request.getRequestDispatcher("/WEB-INF/admin/adminorder.jsp").forward(request, response);
				break;
			case "/details":
				request.getRequestDispatcher("/WEB-INF/admin/adminorderdetails.jsp").forward(request, response);
				break;
			case "/products":
				request.setAttribute("choose", 3);

				request.getRequestDispatcher("/WEB-INF/admin/adminproducts.jsp").forward(request, response);
				break;
			case "/user":
				request.setAttribute("choose", 4);

				request.getRequestDispatcher("/WEB-INF/admin/adminuser.jsp").forward(request, response);

				break;
			default:
				throw new IllegalArgumentException("Unexpected value: " + path);
			}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
