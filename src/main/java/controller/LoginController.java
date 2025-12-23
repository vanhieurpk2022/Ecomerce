package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import model.UserSession;
import util.CookieUtil;
import util.Encode;
import util.Mail;
import util.RandomCode;

/**
 * Servlet implementation class controller
 */
@WebServlet("/login/*")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
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
		String path = request.getPathInfo();

	    if (path == null || "/".equals(path)) {
	        request.getRequestDispatcher("/WEB-INF/views/signin.jsp")
	               .forward(request, response);
	        return;
	    }

	    switch (path) {
	        case "/signin":
		        request.setAttribute("AccountCookies", CookieUtil.getLoginCookie(request));
	            request.getRequestDispatcher("/WEB-INF/views/signin.jsp").forward(request, response);
	            break;

	        case "/signup":
	            request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
	            break;

	        case "/forgot":
	            request.getRequestDispatcher("/WEB-INF/views/forgotpassword.jsp").forward(request, response);
	            break;

	        case "/logout":
	            Logout(request, response);
	            break;

	        default:
	            response.sendError(404);
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getPathInfo();

	    switch (path) {
	        case "/login":
	            Login(request, response);
	            break;

	        case "/register":
	            Register(request, response);
	            break;

	        case "/forgotpassword":
	            ForgotPassword(request, response);
	            break;

	        case "/resetpassword":
	            ResetPassword(request, response);
	            break;

	        default:
	            response.sendError(404);
	    }
	}


	private void Logout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);

		if (session != null) {
			session.invalidate();
		}
		request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);

	}

	

	public void Register(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		  request.setCharacterEncoding("UTF-8");
		    response.setCharacterEncoding("UTF-8");
	    String firstname = request.getParameter("firstname");
	    String lastname = request.getParameter("lastname");
	    String username = request.getParameter("username");
	    String email = request.getParameter("email");
	    String verifyCode = request.getParameter("verifyCode");
	    String password = request.getParameter("password");
	    String msg = "";
	    String url = "/WEB-INF/views/signin.jsp";

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
	        request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
	        return;
	    }

	    // Xác thực tài khoản
	    String codeInSession = (String) session.getAttribute("register_code");
	    String emailInSession = (String) session.getAttribute("register_email");

	    if (idao.checkAccount(username)) {
	        url = "/WEB-INF/views/signup.jsp";
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
	        url = "/WEB-INF/views/signup.jsp";
	        request.getRequestDispatcher(url).forward(request, response);
	        return;
	    } else {
	        User user = new User(firstname, lastname, email, true, username, Encode.hash(password), 1);
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
		String checked = request.getParameter("checkbox_re") ;
		String url = "/WEB-INF/views/signin.jsp";
		String msg = "";

		IDao dao = new UserDao();

		if (dao.checkAccount(username)) {
			User user = dao.getFullName(username);
			UserSession userSession = new UserSession(user.getIdUser(), user.getUsername(), user.getFirstName()+" "+user.getLastName(), user.getRole());
		
			boolean checkPass = Encode.verify(password, user.getPassword());;
			if (checkPass) {
				HttpSession session = request.getSession();
				
				CookieUtil.saveLoginInfo(response, username, password, (checked !=null)?true:false);
				
				session.setAttribute("user", userSession);
				
				url = "/WEB-INF/views/index.jsp";
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
	            request.getRequestDispatcher("/WEB-INF/views/forgotpassword.jsp").forward(request, response);
	        } else {
	        	request.setAttribute("email", email);
	        	
	            String randomCode = RandomCode.generateCode(6);
	            session.setAttribute("reset_email", email);
	            session.setAttribute("reset_code", randomCode);

	            Mail mail = new Mail();
	            mail.SendVerifyMail(email, randomCode);

	            request.setAttribute("msg", "Đã gửi mã xác thực, vui lòng kiểm tra email.");
	            request.setAttribute("msgtype", "sus");
	            request.getRequestDispatcher("/WEB-INF/views/forgotpassword.jsp").forward(request, response);
	        }
	    } 
	    // 2. Nếu bấm Reset Password (form submit kèm verifyCode)
	    else {
	        String savedEmail = (String) session.getAttribute("reset_email");
	        String savedCode = (String) session.getAttribute("reset_code");

	        if (!email.equals(savedEmail) || !verifyCode.equals(savedCode)) {

	            request.setAttribute("msg", "Code xác thực không đúng hoặc email không khớp, vui lòng kiểm tra lại!");
	            request.setAttribute("msgtype", "error");
	            request.getRequestDispatcher("/WEB-INF/views/forgotpassword.jsp").forward(request, response);
	        } else {
	            // Đúng code + email, đến trang reset mật khẩu
	            request.getRequestDispatcher("/WEB-INF/views/resetpassword.jsp").forward(request, response);
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
	    String url = "/WEB-INF/views/resetpassword.jsp";

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
	    boolean updateOk = userDao.updatePasswordByEmail(email, Encode.hash(newPwd));
	    if (updateOk) {
	        // Xóa session reset_email sau khi đổi xong
	        session.removeAttribute("reset_email");
	        msg = "Đổi mật khẩu thành công! Vui lòng đăng nhập lại.";
	        request.setAttribute("msg", msg);
	        request.setAttribute("msgtype", "sus");
	        // Chuyển về trang đăng nhập
	        request.getRequestDispatcher("/WEB-INF/views/signin.jsp").forward(request, response);
	    } else {
	        msg = "Đổi mật khẩu thất bại! Vui lòng thử lại.";
	        request.setAttribute("msg", msg);
	        request.setAttribute("msgtype", "error");
	        request.getRequestDispatcher(url).forward(request, response);
	    }
	}


	

}
