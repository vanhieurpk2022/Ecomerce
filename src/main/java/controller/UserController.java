package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

	        if (action == null) {
	        	response.sendError(HttpServletResponse.SC_BAD_REQUEST);
	            return;
	        }

	        switch (action) {
	            case "orders":
	            	request.getRequestDispatcher("/WEB-INF/views/order_history.jsp")
	                   .forward(request, response);
	                break;

	            case "settings":
	            	request.getRequestDispatcher("/WEB-INF/views/settings.jsp")
	                   .forward(request, response);
	                break;

	            case "help":
	            	request.getRequestDispatcher("/WEB-INF/views/help.jsp")
	                   .forward(request, response);
	                break;

	            case "logout":
	            	request.getSession().invalidate();
	            	response.sendRedirect(request.getContextPath() + "/index.jsp");
	                break;

	            default:
	            	response.sendError(HttpServletResponse.SC_NOT_FOUND);
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
