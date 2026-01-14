package controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.AdminDao;
import dao.OrdersDao;
import dao.ProductVariantsDao;
import model.Category;
import model.Order;
import model.OrderDetail;
import model.ProductVariants;
import model.Products;
import model.User;

/**
 * Servlet implementation class AdminController
 */
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,      // 1MB
	    maxFileSize = 1024 * 1024 * 5,         // 5MB
	    maxRequestSize = 1024 * 1024 * 10      // 10MB
	)
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
		AdminDao dao = new AdminDao();
		String id;
		
		if (path == null || path.equals("/")) {
			List<Order> listOr = dao.selectOrdersRecent();
			int totalUsers = dao.selectTotalUser();
			int revenue = dao.selectSumRevenue();
			int orders = dao.selectCountOrders();
			int products = dao.selectTotalProducts();
			request.setAttribute("ttu", totalUsers);
			request.setAttribute("rev", revenue);
			request.setAttribute("tto", orders);
			request.setAttribute("ttp", products);
			request.setAttribute("oor", listOr);

			request.setAttribute("choose", 1);
			request.getRequestDispatcher("/WEB-INF/admin/adminindex.jsp").forward(request, response);
			return;
		}
		switch (path) {
		case "/order":
			List<Order> orderList = dao.getOrders();
			request.setAttribute("orderList", orderList);
			request.setAttribute("choose", 2);
			request.getRequestDispatcher("/WEB-INF/admin/adminorder.jsp").forward(request, response);
			break;
		case "/details":
			id = request.getParameter("id");
			try {
				int getId = Integer.parseInt(id);
				List<OrderDetail> listOD = dao.getOrdersDetailsByOrderID(getId);
				Order order = dao.getOrdersFromOrderIDToOrderDetails(getId);
				request.setAttribute("odList", listOD);
				request.setAttribute("o2", order);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("choose", 2);
			request.getRequestDispatcher("/WEB-INF/admin/adminorderdetails.jsp").forward(request, response);
			break;
		case "/variant":
			id = request.getParameter("id");
			try {
				int getId = Integer.parseInt(id);
				List<ProductVariants> listPv = dao.selectProductVariantsByProductsID(getId);
				Products p = dao.selectProductsById(getId);
				request.setAttribute("pvList", listPv);
				request.setAttribute("pp", p);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("choose", 3);
			request.getRequestDispatcher("/WEB-INF/admin/adminVariant.jsp").forward(request, response);
			break;
		case "/products":
			List<Products> listProducts = dao.selectListProducts();
			List<Category> categoryList = dao.selectAllCategory();
			request.setAttribute("productsList", listProducts);
			request.setAttribute("categoryList", categoryList);
			request.setAttribute("choose", 3);

			request.getRequestDispatcher("/WEB-INF/admin/adminproducts.jsp").forward(request, response);
			break;
		case "/user":

			List<User> userList = dao.selectListUser();
			request.setAttribute("userList", userList);
			request.setAttribute("choose", 4);

			request.getRequestDispatcher("/WEB-INF/admin/adminuser.jsp").forward(request, response);

			break;
		case "/ban":
			id = request.getParameter("id");
			try {
				int getId = Integer.parseInt(id);
				dao.bannedAccount(getId);
			} catch (Exception e) {
				// TODO: handle exception
			}
			response.sendRedirect(request.getContextPath() + "/admin/user");

			break;
		case "/unBan":
			id = request.getParameter("id");
			try {
				int getId = Integer.parseInt(id);
				dao.unBannedAccount(getId);
			} catch (Exception e) {
				// TODO: handle exception
			}
			response.sendRedirect(request.getContextPath() + "/admin/user");

			break;
		case "/delete":
			id = request.getParameter("id");
			try {
				int getId = Integer.parseInt(id);
				dao.deleteAccount(getId);
			} catch (Exception e) {
				// TODO: handle exception
			}
			response.sendRedirect(request.getContextPath() + "/admin/user");

			break;
		case "/resetpassword":
			id = request.getParameter("id");
			try {
				int getId = Integer.parseInt(id);
				dao.resetPassword(getId);
			} catch (Exception e) {
				// TODO: handle exception
			}
			response.sendRedirect(request.getContextPath() + "/admin/user");

			break;
		case "/lock":
			id = request.getParameter("id");
			try {
				int getId = Integer.parseInt(id);
				dao.lockProductsByProductsID(getId);
			} catch (Exception e) {
				// TODO: handle exception
			}
			response.sendRedirect(request.getContextPath() + "/admin/products");

			break;
		case "/unLock":
			id = request.getParameter("id");
			try {
				int getId = Integer.parseInt(id);
				dao.unLockProductsByProductsID(getId);
			} catch (Exception e) {
				// TODO: handle exception
			}
			response.sendRedirect(request.getContextPath() + "/admin/products");

			break;
		case "/lockVariant":
			int getId =-1 ;

			id = request.getParameter("id");
			try {
				 getId = Integer.parseInt(id);
				dao.lockProductsByVariantID(getId);
			} catch (Exception e) {
				// TODO: handle exception
			}
			if(getId !=-1) {
				response.sendRedirect(request.getContextPath()+"/admin/variant?id="+getId);

			}
			break;
		case "/unLockVariant":
			int getIdd =-1 ;
			id = request.getParameter("id");
			try {
				 getIdd = Integer.parseInt(id);
				dao.unLockProductsByVariantID(getIdd);
			} catch (Exception e) {
				// TODO: handle exception
			}
			if(getIdd !=-1) {
				response.sendRedirect(request.getContextPath()+"/admin/variant?id="+getIdd);

			}

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
		String path = request.getPathInfo();
		switch (path) {
		case "/addvariant":
			addVariant(request,response);
			break;
		case "/addproducts":
			addProducts(request,response);
			break;
		case "/updateStatusOrders":
			updateStatusOrders(request,response);
			break;
		case "/getVariantModify":
			getVariantModify(request,response);
			break;
		case "/modifyVariant":
			modifyVariantAddmin(request,response);
			break;
		case "/getProductModify":
			getProductModify(request,response);
			break;
		case "/modifyProducts":
			modifyProducts(request,response);
			break;
		}
	}

	private void modifyProducts(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		 request.setCharacterEncoding("UTF-8");
		  AdminDao dao = new AdminDao();
		  int pid = Integer.parseInt(request.getParameter("pid"));
		    String name = request.getParameter("productName");
		    int categoryID = Integer.parseInt(request.getParameter("categoryID"));
		    BigDecimal price =  new BigDecimal(request.getParameter("price"));
		    String status = request.getParameter("status");
		    String description = request.getParameter("description");
		    String fileUrl ="";
		    Part image = request.getPart("image");
		    if (image != null && image.getSize() > 0) {
		    	 String fileName = System.currentTimeMillis() + "_" + 
		                  Paths.get(image.getSubmittedFileName())
		                       .getFileName()
		                       .toString();
			    
			    String getUploadFolder = request.getServletContext().getInitParameter("upload");
			    
			    String uploadPath = request.getServletContext()
	                   .getRealPath(getUploadFolder);
			    
			     fileUrl = getUploadFolder+"/" + fileName;		
			    System.out.println(uploadPath);
			    File uploadDir = new File(uploadPath);
			    if (!uploadDir.exists()) {
			        uploadDir.mkdirs();
			    }
			    image.write(uploadPath + File.separator + fileName);
		    } 
		   

		    
		    Products p = new Products();	
		    p.setProductName(name);
		    p.setCategoryID(categoryID);
		    p.setPrice(price);
		    p.setStatus(status);
		    p.setDescription(description);
		    p.setImg(fileUrl);
		    if(dao.updateModifyProducts(p,pid)) {
		    	   response.sendRedirect(request.getContextPath() +"/admin/products");
		    }
		     
		  
		
	}

	private void getProductModify(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		int getProductsId = Integer.parseInt(request.getParameter("productID"));
		AdminDao dao = new AdminDao();
		Products p = dao.selectProductsByID(getProductsId);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		response.getWriter().write(
		    "{"
		    + "\"productName\":\"" + p.getProductName() + "\","
		    + "\"categoryID\":" + p.getCategoryID() + ","
		    + "\"price\":" + p.getPrice() + ","
		    + "\"status\":\"" + p.getStatus() + "\","
		    + "\"description\":\"" + p.getDescription() + "\","
		    + "\"img\":\"" + p.getImg() + "\""
		    + "}"
		);
	}

	private void modifyVariantAddmin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");	
		AdminDao dao = new AdminDao();
		int variantID = Integer.parseInt(request.getParameter("variantID"));
		int productID = Integer.parseInt(request.getParameter("productID"));
		String size = request.getParameter("size");
		int stock = Integer.parseInt(request.getParameter("stock"));
		BigDecimal priceAdjustment =
		    new BigDecimal(request.getParameter("priceAdjustment"));
		String status = request.getParameter("status");
		
		ProductVariants pv = new ProductVariants();
			pv.setSize(size);
			pv.setPriceAdjustment(priceAdjustment);
			pv.setStock(stock);
			pv.setStatus(status);
		
			if(dao.updateProductsVariant(pv,productID,variantID)) {
				response.sendRedirect(
					    request.getContextPath() + "/admin/variant?id=" + productID
					);			}

	}

	private void getVariantModify(HttpServletRequest request, HttpServletResponse response) throws IOException {
		  request.setCharacterEncoding("UTF-8");
		  response.setCharacterEncoding("UTF-8");
		int getvariantID = Integer.parseInt(request.getParameter("variantID"));
		int productID = Integer.parseInt(request.getParameter("productID"));
		
		ProductVariantsDao dao = new ProductVariantsDao();
		ProductVariants pv = dao.selectToModify(getvariantID, productID);
		
		 response.setContentType("application/json");
		 response.getWriter().write(
				    "{"
				    + "\"size\":\"" + pv.getSize() + "\","
				    + "\"stock\":" + pv.getStock() + ","
				    + "\"price\":" + pv.getPriceAdjustment() + ","
				    + "\"status\":\"" + pv.getStatus() + "\""
				    + "}"
				);
	}

	private void updateStatusOrders(HttpServletRequest request, HttpServletResponse response) {
		AdminDao dao = new AdminDao();
		String status = request.getParameter("status").toUpperCase();
		int orderID = Integer.parseInt(request.getParameter("orderID"));

		if(dao.updateNewStatusOrder(orderID, status)) {
			response.setStatus(HttpServletResponse.SC_OK);
		}
		
		
	}

	private void addProducts(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		  request.setCharacterEncoding("UTF-8");
		  AdminDao dao = new AdminDao();
		    String name = request.getParameter("productName");
		    int categoryID = Integer.parseInt(request.getParameter("categoryID"));
		    BigDecimal price =  new BigDecimal(request.getParameter("price"));
		    String status = request.getParameter("status");
		    String description = request.getParameter("description");

		    Part image = request.getPart("image");
		    String fileName = System.currentTimeMillis() + "_" + 
	                  Paths.get(image.getSubmittedFileName())
	                       .getFileName()
	                       .toString();
		    
		    String getUploadFolder = request.getServletContext().getInitParameter("upload");
		    
		    String uploadPath = request.getServletContext()
                    .getRealPath(getUploadFolder);
		    
		    String fileUrl = getUploadFolder+"/" + fileName;		
		    System.out.println(uploadPath);
		    File uploadDir = new File(uploadPath);
		    if (!uploadDir.exists()) {
		        uploadDir.mkdirs();
		    }
		    image.write(uploadPath + File.separator + fileName);

		    
		    Products p = new Products();	
		    p.setProductName(name);
		    p.setCategoryID(categoryID);
		    p.setPrice(price);
		    p.setStatus(status);
		    p.setDescription(description);
		    p.setImg(fileUrl);
		     dao.insertProduct(p);
		     
		     response.sendRedirect(request.getContextPath() +"/admin/products");
		    	
	}

	private void addVariant(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		AdminDao dao = new AdminDao();
		int productID = Integer.parseInt(request.getParameter("productID"));
		String size = request.getParameter("size");
		int stock = Integer.parseInt(request.getParameter("stock"));
		BigDecimal priceAdjustment =
		    new BigDecimal(request.getParameter("priceAdjustment"));
		String status = request.getParameter("status");
		
		ProductVariants pv = new ProductVariants(productID,size,priceAdjustment,stock,status);
		if(dao.insertVariant(pv)) {
			response.sendRedirect(request.getContextPath() +"/admin/variant?id="+productID);
		}
		
		
	}

}
