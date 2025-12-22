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
@WebServlet("/user/*")
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
		String path = request.getPathInfo();

	        switch (path) {
	            case "/orders":
	            	request.getRequestDispatcher("/WEB-INF/views/order_history.jsp")
	                   .forward(request, response);
	                break;
	            case "/orders_his":
	            	request.setAttribute("account",4);

	            	request.getRequestDispatcher("/WEB-INF/views/orders_his.jsp")
	                   .forward(request, response);
	                break;
	            case "/orders_shipping":
	            	request.setAttribute("account",5);

	            	request.getRequestDispatcher("/WEB-INF/views/orders_his.jsp")
	                   .forward(request, response);
	                break;
	            case "/orders_delivered":
	            	request.setAttribute("account",6);

	            	request.getRequestDispatcher("/WEB-INF/views/orders_his.jsp")
	                   .forward(request, response);
	                break;
	            case "/settings":
	            	
	            	request.setAttribute("account", 1);
	            	request.getRequestDispatcher("/WEB-INF/views/settings.jsp")
	                   .forward(request, response);
	                break;
	            case "/security":
	            	request.setAttribute("account", 2);
	            	request.getRequestDispatcher("/WEB-INF/views/settings_security.jsp")
	                   .forward(request, response);
	                break;
	            case "/address":
	            	request.setAttribute("account", 3);
	            	request.getRequestDispatcher("/WEB-INF/views/settings_address.jsp")
	                   .forward(request, response);
	                break;
	            case "/help":
	            	request.getRequestDispatcher("/WEB-INF/views/help.jsp")
	                   .forward(request, response);
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
