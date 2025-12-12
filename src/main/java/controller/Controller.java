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
import util.Mail;
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
		// Quên mật khẩu: nhập lại mật khẩu (giống register, thêm kiểm tra mã)
        case "resetpassword":
            ResetPassword(request, response);
            break;
        // Gửi mã xác thực về email (AJAX/fetch)
        case "forgotpassword":
            ForgotPassword(request, response);
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

	    IDao idao = new UserDao();

	    HttpSession session = request.getSession();


	    // Kiểm tra nếu chưa gửi mã thì gửi code mới (ví dụ bạn có nút "Send" riêng)
	    if (verifyCode == null || verifyCode.isEmpty()) {
	        String randomCode = RandomCode.generateCode(6);
	        System.out.println(randomCode);
	        session.setAttribute("register_email", email);
	        session.setAttribute("register_code", randomCode);
	        Mail mail = new Mail();
	        mail.SendVerifyMail(email, randomCode);
	        msg = "Đã gửi mã xác thực, vui lòng kiểm tra email.";
	        request.setAttribute("msg", msg);
	        request.setAttribute("msgtype", "sus");
	        request.getRequestDispatcher("/signup.jsp").forward(request, response);
	        return;
	    }

	    // Xác thực tài khoản
	    String codeInSession = (String) session.getAttribute("register_code");
	    String emailInSession = (String) session.getAttribute("register_email");

	    if (idao.checkAccount(username)) {
	        url = "/signup.jsp";
	        msg = "Account is exits";
	        request.setAttribute("error", msg);
	        request.setAttribute("username", username);
	        request.setAttribute("firstname", firstname);
	        request.setAttribute("lastname", lastname);
	        request.getRequestDispatcher(url).forward(request, response);
	        return;
	    }
	    if (!verifyCode.equals(codeInSession) || !email.equals(emailInSession)) {
	        msg = "Code Verify not match";
	        request.setAttribute("error", msg);
	        request.setAttribute("username", username);
	        request.setAttribute("firstname", firstname);
	        request.setAttribute("lastname", lastname);
	        url = "/signup.jsp";
	        request.getRequestDispatcher(url).forward(request, response);
	        return;
	    } else {
	        User user = new User(firstname, lastname, email, true, username, Encode.toSHA1(password), 1);
	        idao.addUser(user);
	        msg = "Susscess register";
	        request.setAttribute("msg", msg);
	        request.setAttribute("msgtype", "sus");
	        // XÓA session đã dùng!
	        session.removeAttribute("register_email");
	        session.removeAttribute("register_code");
	    }

	    request.getRequestDispatcher(url).forward(request, response);
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



	private void ForgotPassword(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String email = request.getParameter("email");
	    String verifyCode = request.getParameter("verifyCode");
	    String act = request.getParameter("action");

	    HttpSession session = request.getSession();
	    UserDao userDao = new UserDao();
	    boolean exists = userDao.checkEmail(email);

	    // 1. Nếu bấm Send hoặc chưa nhập verifyCode -> gửi code mới và forward lại forgotpassword.jsp với message
	    if ((verifyCode == null || verifyCode.isEmpty()) || "sendcode".equals(act)) {
	        if (!exists) {
	        	request.setAttribute("email", email);
	            request.setAttribute("msg", "Email không tồn tại!");
	            request.setAttribute("msgtype", "error");
	            request.getRequestDispatcher("/forgotpassword.jsp").forward(request, response);
	        } else {
	        	request.setAttribute("email", email);
	        	
	            String randomCode = RandomCode.generateCode(6);
	            session.setAttribute("reset_email", email);
	            session.setAttribute("reset_code", randomCode);

	            Mail mail = new Mail();
	            mail.SendVerifyMail(email, randomCode);

	            request.setAttribute("msg", "Đã gửi mã xác thực, vui lòng kiểm tra email.");
	            request.setAttribute("msgtype", "sus");
	            request.getRequestDispatcher("/forgotpassword.jsp").forward(request, response);
	        }
	    } 
	    // 2. Nếu bấm Reset Password (form submit kèm verifyCode)
	    else {
	        String savedEmail = (String) session.getAttribute("reset_email");
	        String savedCode = (String) session.getAttribute("reset_code");

	        if (!email.equals(savedEmail) || !verifyCode.equals(savedCode)) {

	            request.setAttribute("msg", "Code xác thực không đúng hoặc email không khớp, vui lòng kiểm tra lại!");
	            request.setAttribute("msgtype", "error");
	            request.getRequestDispatcher("/forgotpassword.jsp").forward(request, response);
	        } else {
	            // Đúng code + email, đến trang reset mật khẩu
	            request.getRequestDispatcher("/resetpassword.jsp").forward(request, response);
	        }
	    }
	}
	

	private void ResetPassword(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    // Lấy email từ session (đã verified qua bước nhập code)
	    HttpSession session = request.getSession();
	    String email = (String) session.getAttribute("reset_email");
	    String newPwd = request.getParameter("password_new");
	    String confirmPwd = request.getParameter("password_confirm_new");
	    String msg = "";
	    String url = "/resetpassword.jsp";

	    // Kiểm tra session
	    if (email == null) {
	        msg = "Phiên làm việc đã hết hoặc email chưa được xác thực.";
	        request.setAttribute("msg", msg);
	        request.setAttribute("msgtype", "error");
	        request.getRequestDispatcher(url).forward(request, response);
	        return;
	    }
	    // Kiểm tra password
	    if (newPwd == null || confirmPwd == null || !newPwd.equals(confirmPwd)) {
	        msg = "Password xác nhận không trùng khớp!";
	        request.setAttribute("msg", msg);
	        request.setAttribute("msgtype", "error");
	        request.getRequestDispatcher(url).forward(request, response);
	        return;
	    }
	    if (newPwd.length() < 6) {
	        msg = "Password phải ít nhất 6 ký tự!";
	        request.setAttribute("msg", msg);
	        request.setAttribute("msgtype", "error");
	        request.getRequestDispatcher(url).forward(request, response);
	        return;
	    }
	    // Đổi mật khẩu trên database
	    UserDao userDao = new UserDao();
	    boolean updateOk = userDao.updatePasswordByEmail(email, Encode.toSHA1(newPwd));
	    if (updateOk) {
	        // Xóa session reset_email sau khi đổi xong
	        session.removeAttribute("reset_email");
	        msg = "Đổi mật khẩu thành công! Vui lòng đăng nhập lại.";
	        request.setAttribute("msg", msg);
	        request.setAttribute("msgtype", "sus");
	        // Chuyển về trang đăng nhập
	        request.getRequestDispatcher("/signin.jsp").forward(request, response);
	    } else {
	        msg = "Đổi mật khẩu thất bại! Vui lòng thử lại.";
	        request.setAttribute("msg", msg);
	        request.setAttribute("msgtype", "error");
	        request.getRequestDispatcher(url).forward(request, response);
	    }
	}


	

}
