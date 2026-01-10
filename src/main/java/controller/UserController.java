package controller;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpResponse;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.AddressDao;
import dao.OrdersDao;
import dao.ServicesTaxDao;
import dao.UserDao;
import model.Address;
import model.Cart;
import model.Order;
import model.OrderDetail;
import model.User;
import model.UserSession;
import model.reviews;
import util.Encode;

/**
 * Servlet implementation class UserController
 */
@MultipartConfig(
	    fileSizeThreshold = 1024 * 512,     // 512KB
	    maxFileSize = 1024 * 1024 * 3,      // 3MB
	    maxRequestSize = 1024 * 1024 * 6    // 6MB
	)

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
     	HttpSession session = request.getSession();
    	UserSession userSession = (UserSession) session.getAttribute("user");
    	OrdersDao orDao = new OrdersDao();
    	String selected ="";
    	String condition=null;
    	List<Order> listOrder =null;
	        switch (path) {
	       
	    
	        case "/review":
	        	List<OrderDetail> odList = orDao.selectProductsUsedBuy(userSession.getIdUser());
            	request.setAttribute("account",8);
            	request.setAttribute("od", odList);
            	request.getRequestDispatcher("/WEB-INF/views/reviews.jsp")
                   .forward(request, response);
                break;
	        case "/order_history":
       
            	request.getRequestDispatcher("/WEB-INF/views/order_history.jsp")
                   .forward(request, response);
                break;
	            case "/orders_his":
	            
	            	 condition = request.getParameter("search");
	            	if(condition != null) {
	            		switch (condition) {
						case "today":
							selected = "today";
							listOrder = orDao.selectOrdersByToday(userSession.getIdUser());
							break;
						case "week":
							selected = "week";

							listOrder = orDao.selectOrdersByWeek(userSession.getIdUser());
							break;
						case "month":
							selected = "month";
							listOrder = orDao.selectOrdersByMonth(userSession.getIdUser());
							break;
						case "all":
							selected = "all";
		            		listOrder = orDao.selectOrderByUserID(userSession.getIdUser());
							break;
						default:
							throw new IllegalArgumentException("Unexpected value: " + condition);
						}
	            	}else {
	            		selected = "all";
	            		listOrder = orDao.selectOrderByUserID(userSession.getIdUser());
	            	}
	            	request.setAttribute("choose", selected);
	            	request.setAttribute("orders", listOrder);
	            	request.setAttribute("account",4);
	            	request.getRequestDispatcher("/WEB-INF/views/orders_his.jsp")
	                   .forward(request, response);
	                break;
	            case "/orders_shipping":
	            	condition = request.getParameter("search");
	            	if(condition != null) {
	            		switch (condition) {
						case "today":
							selected = "today";
							listOrder = orDao.selectOrdersByTodayShipping(userSession.getIdUser());
							break;
						case "week":
							selected = "week";

							listOrder = orDao.selectOrdersByWeekShipping(userSession.getIdUser());
							break;
						case "month":
							selected = "month";
							listOrder = orDao.selectOrdersByMonthShipping(userSession.getIdUser());
							break;
						case "all":
							selected = "all";
		            		listOrder = orDao.selectOrderByUserIDShipping(userSession.getIdUser());
							break;
						default:
							throw new IllegalArgumentException("Unexpected value: " + condition);
						}
	            	}else {
	            		selected = "all";
		            	listOrder = orDao.selectOrderByUserIDShipping(userSession.getIdUser());
	            	}
	            	request.setAttribute("choose", selected);
	            	request.setAttribute("orders", listOrder);
	            	request.setAttribute("account",5);

	            	request.getRequestDispatcher("/WEB-INF/views/orders_shipping2.jsp")
	                   .forward(request, response);
	                break;
	            case "/orders_delivered":
	         
	            	condition = request.getParameter("search");
	            	if(condition != null) {
	            		switch (condition) {
						case "today":
							selected = "today";
							listOrder = orDao.selectOrdersByTodayDelivered(userSession.getIdUser());
							break;
						case "week":
							selected = "week";

							listOrder = orDao.selectOrdersByWeekDelivered(userSession.getIdUser());
							break;
						case "month":
							selected = "month";
							listOrder = orDao.selectOrdersByMonthDelivered(userSession.getIdUser());
							break;
						case "all":
							selected = "all";
		            		listOrder = orDao.selectOrdersByDelivered(userSession.getIdUser());
							break;
						default:
							throw new IllegalArgumentException("Unexpected value: " + condition);
						}
	            	}else {
	            		selected = "all";
		            	listOrder = orDao.selectOrdersByDelivered(userSession.getIdUser());
	            	}
	            	request.setAttribute("choose", selected);
	            	request.setAttribute("orders", listOrder);
	            	request.setAttribute("account",6);

	            	request.getRequestDispatcher("/WEB-INF/views/orders_delivered2.jsp")
	                   .forward(request, response);
	                break;
	            case "/settings":

	            	UserDao user = new UserDao();
	            	User selectUser = user.selectUserByUserID(userSession.getIdUser());
	            	String getMsgType = (String) session.getAttribute("msg_type");
	            	String getMsg = (String) session.getAttribute("msg");
	            	
	            	if(getMsgType !=null && getMsg !=null) {
	            		request.setAttribute("msg_type", getMsgType);
	            		request.setAttribute("msg", getMsg);
	            		session.removeAttribute("msg_type");
	            		session.removeAttribute("msg");

	            	}
	            	
	            	request.setAttribute("getProfile", selectUser);
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
	            	AddressDao dao = new AddressDao();
	            	List<Address> list = dao.selectAddressByUserID(userSession.getIdUser()); 
	            	
	            	request.setAttribute("address", list);
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
		String path = request.getPathInfo();
		
        switch (path) {
            case "/addressUpdate":
            	addAddress(request,response);
                break;
            case "/removeAddress":
            	removeAddress(request,response);
            	break;
            case "/updateCurrentAddress":
            	updateCurrentAddress(request,response);
            	break;
            case "/updateAccountInfo":
            	updateAccountInfo(request,response);
                break;
            case "/reviews":
    			reviewProducts(request,response);
    			break;
            case "/uploadAvatar": 
            	uploadAvatar(request, response); 
            	break; // NEW
            default:
            	response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
	}
	private void reviewProducts(HttpServletRequest request, HttpServletResponse response) {
		String getProductsID = request.getParameter("proid");
		String getOrderDetailsID = request.getParameter("orderDetailID");
		String getRating = request.getParameter("rating");
		ServicesTaxDao dao = new ServicesTaxDao();
		HttpSession session = request.getSession(false);
		UserSession userSession = (UserSession) session.getAttribute("user");
		try {
			int rate = Integer.parseInt(getRating);
			int pid = Integer.parseInt(getProductsID);
			int odid = Integer.parseInt(getOrderDetailsID);
			reviews re = new reviews(odid,userSession.getIdUser(),pid,rate);
			if(dao.insertReviewProducts(re)) {
				response.setStatus(HttpServletResponse.SC_OK);

			};
		} catch (Exception e) {
			// TODO: handle exception
		}
			
	}

	private void updateAccountInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String url ="/user/settings";
		
		HttpSession session = request.getSession();
		UserSession userSession = (UserSession) session.getAttribute("user");
		UserDao user = new UserDao();
	
		String getFirstname = request.getParameter("firstname");
		String getLastname = request.getParameter("lastname");
		String getBirthday = request.getParameter("birthday");
		String getGender = request.getParameter("gender");


		if(getGender !=null && getBirthday != null ){
			LocalDate getDate = LocalDate.parse(getBirthday);
			int gender = Integer.parseInt(getGender);
			if(user.updateBirthdayOrGender(userSession.getIdUser(), getDate, gender,getFirstname,getLastname)) {
				session.setAttribute("msg_type", "sus");
				session.setAttribute("msg", "Update Success");
			
			}else {
				session.setAttribute("msg_type", "error");
				session.setAttribute("msg", "Update Failed");
			}
		}
		
		response.sendRedirect(request.getContextPath() +url);
		
	}
	private void updateCurrentAddress(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		if(id !=null) {
			HttpSession session = request.getSession(false);
			UserSession user = (UserSession) session.getAttribute("user");
			int getAddressId = Integer.parseInt(id);
			AddressDao addressDao = new AddressDao();
			addressDao.updateCurrentAddressByID(getAddressId,user.getIdUser());
			response.setStatus(HttpServletResponse.SC_OK);
		}		
	}

	private void removeAddress(HttpServletRequest request, HttpServletResponse response)  {
		String id = request.getParameter("id");
		if(id !=null) {
			int getAddressId = Integer.parseInt(id);
			AddressDao addressDao = new AddressDao();
			addressDao.deleteAddressByID(getAddressId);
			response.setStatus(HttpServletResponse.SC_OK);
		}
		

	}

	private void addAddress(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		// TODO Auto-generated method stub
		  request.setCharacterEncoding("UTF-8");
		  response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		String getAddressLine = request.getParameter("fulladdress");
		String getWard = request.getParameter("district");
		String getCity = request.getParameter("city");
		String getCountry = request.getParameter("country");
		String phone = request.getParameter("phone");
		
		AddressDao dao = new AddressDao();
		UserSession userSession = (UserSession) session.getAttribute("user");
		int count = dao.isFirstAddress(userSession.getIdUser());
		Address addr = new Address(getAddressLine,getCity,getWard,phone,userSession.getIdUser(),getCountry,(count == 0 ?true:false));
		int getId =dao.addAddressByUserID(addr);
		
	    response.setContentType("application/json");
	    response.getWriter().write("{\"addressID\":" + getId +","+"\"count\":"+count + "}");

	}
	 private void uploadAvatar(HttpServletRequest request, HttpServletResponse response)
	            throws IOException, ServletException {
	        HttpSession session = request.getSession(false);
	        UserSession userSession = (UserSession) session.getAttribute("user");
	        if (userSession == null) {
	            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
	            return;
	        }

	        Part part = request.getPart("avatar");
	        if (part == null || part.getSize() == 0) {
	            session.setAttribute("msg_type", "error");
	            session.setAttribute("msg", "Vui lòng chọn ảnh!");
	            response.sendRedirect(request.getContextPath() + "/user/settings");
	            return;
	        }

	        String contentType = part.getContentType();
	        if (contentType == null || !(contentType.equals("image/png")
	                || contentType.equals("image/jpeg")
	                || contentType.equals("image/webp"))) {
	            session.setAttribute("msg_type", "error");
	            session.setAttribute("msg", "Chỉ hỗ trợ PNG/JPEG/WEBP!");
	            response.sendRedirect(request.getContextPath() + "/user/settings");
	            return;
	        }

	        String original = Paths.get(part.getSubmittedFileName()).getFileName().toString();
	        String safe = original.replaceAll("[^a-zA-Z0-9._-]", "_");
	        String fileName = System.currentTimeMillis() + "_" + safe;

	        String uploadDirPath = request.getServletContext().getRealPath("/assert/upload/avatars");
	        File uploadDir = new File(uploadDirPath);
	        if (!uploadDir.exists()) uploadDir.mkdirs();

	        part.write(uploadDirPath + File.separator + fileName);

	        String avatarUrl = "/assert/upload/avatars/" + fileName;

	        UserDao userDao = new UserDao();
	        boolean ok = userDao.updateAvatar(userSession.getIdUser(), avatarUrl);

	        // cập nhật vào session để header hiển thị ngay
	        if (ok) {
	            userSession.setAvatar(avatarUrl);
	            session.setAttribute("user", userSession);
	            session.setAttribute("msg_type", "sus");
	            session.setAttribute("msg", "Cập nhật ảnh thành công!");
	        } else {
	            session.setAttribute("msg_type", "error");
	            session.setAttribute("msg", "Cập nhật ảnh thất bại!");
	        }

	        response.sendRedirect(request.getContextPath() + "/user/settings");
	    }
	

}
