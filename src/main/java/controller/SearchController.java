package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductsDao;
import model.Products;

@WebServlet(urlPatterns = { "/search" }, loadOnStartup = 1)
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String q = request.getParameter("q");

		// không nhập gì thì quay về shop
		if (q == null || q.trim().isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/shop");
			return;
		}

		ProductsDao dao = new ProductsDao();
		List<Products> list = dao.searchProducts(q.trim());

		// dùng chung shop.jsp bạn đang sửa
		request.setAttribute("q", q.trim());
		request.setAttribute("products", list);

		String url = "/WEB-INF/views/shop.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
