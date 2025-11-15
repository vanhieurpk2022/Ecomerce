package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.IDao;
import dao.ProductsDao;
import dao.UserDao;
import model.Products;
import model.User;
import util.Encode;
import util.RandomCode;

/**
 * Servlet implementation class controller
 */
@WebServlet("/controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		switch (action) {

		
		case "register":
			Register(request, response);
			break;

		case "login":
			Login(request, response);
			break;
		case "logout":
			Logout(request, response);
			break;

		default:
			throw new IllegalArgumentException("Unexpected value: " + action);
		}
	}




	private void Logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);

		if (session != null) {
			session.invalidate();
		}
		response.sendRedirect("index.jsp");

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

	public void Register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String verifyCode = request.getParameter("verifyCode");
		String password = request.getParameter("password");
		String msg = "";
		String url = "/signin.jsp";

		// lấy code hiện có
		String rdc = RandomCode.getInstance().getCode();
		IDao idao = new UserDao();

		System.out.println(idao.checkAccount(username));
		// kiểm tra account đó có tồn tại chưa
		if (idao.checkAccount(username)) {
			System.out.println("Đã vào đây 1");
			url = "/signup.jsp";
			msg = "Account is exits";
			request.setAttribute("error", msg);
			request.setAttribute("username", username);
			request.setAttribute("firstname", firstname);
			request.setAttribute("lastname", lastname);
			getServletContext().getRequestDispatcher(url).forward(request, response);
			return;
		}
		if (!rdc.equals(verifyCode)) {
			System.out.println("Đã vào đây 2 ");
			msg = "Code Verify not match";
			request.setAttribute("error", msg);
			request.setAttribute("username", username);
			request.setAttribute("firstname", firstname);
			request.setAttribute("lastname", lastname);

			url = "/signup.jsp";
			getServletContext().getRequestDispatcher(url).forward(request, response);
			return;
		} else {
			User user = new User(firstname, lastname, email, true, username, Encode.toSHA1(password), 1);
			System.out.println("Đã vào đây 3");

			idao.addUser(user);
			msg = "Susscess register";

			request.setAttribute("msg", msg);
			request.setAttribute("msgtype", "sus");
		}

		getServletContext().getRequestDispatcher(url).forward(request, response);

	}

	public void Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password_sigin");
		String url = "/signin.jsp";
		String msg = "";

		IDao dao = new UserDao();

		if (dao.checkAccount(username)) {
			User user = dao.getFullName(username);
			boolean checkPass = Encode.toSHA1(password).equals(user.getPassword());
			if (checkPass) {
				HttpSession session = request.getSession();

				session.setAttribute("user", user);
				url = "/index.jsp";
				getServletContext().getRequestDispatcher(url).forward(request, response);
			}

		} else {
			msg = "Wrong username or password";
			request.setAttribute("msg", msg);
			request.setAttribute("msgtype", "error");
			getServletContext().getRequestDispatcher(url).forward(request, response);
		}

	}

}
