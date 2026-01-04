package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductVariantsDao;
import dao.ProductsDao;
import dao.ShopDao;
import model.Category;
import model.ProductVariants;
import model.Products;

/**
 * Servlet implementation class ShopController
 */
@WebServlet("/shop")
public class ShopController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action= request.getParameter("action");
		request.setAttribute("active", "shop");
		switch (action) {
		case "showCard":
			int getOffSet = Integer.parseInt(request.getParameter("page"));
			ShopDao dao = new ShopDao();
			List<Category> listCate = dao.selectAllCategory();
			request.setAttribute("cate", listCate);
			ShopShowCard(request, response, getOffSet);
			break;
		case "SProduct":
			ShowSProduct(request,response);
			break;
		case "FilterProducts":
			filterProducts(request, response);
			break;
		
	
		}
	}
	


	private void ShowSProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			int getID = Integer.parseInt( request.getParameter("productID"));
			int getType = Integer.parseInt(request.getParameter("type"));
			ProductsDao dao= new ProductsDao();
			ProductVariantsDao product_variantsDao = new ProductVariantsDao();
			
		List<ProductVariants> productVariant = product_variantsDao.SelectByProductIDInProductVariants(getID);
		Products product=	dao.SelectByProductID(getID);
		List<Products> rq = dao.SelectByCategory(getType);
		request.setAttribute("getVariants", productVariant);
		request.setAttribute("TypeClothe", rq);
		request.setAttribute("sproduct", product);
		getServletContext().getRequestDispatcher("/WEB-INF/views/sproduct.jsp").forward(request, response);
	}


	public void ShopShowCard(HttpServletRequest request, HttpServletResponse response, int offset)
			throws ServletException, IOException {
		String url = "/WEB-INF/views/shop.jsp";
		ProductsDao dao = new ProductsDao();
		List<Products> products = dao.SelectAll(offset,20);

		request.setAttribute("ListProducts", products);

		getServletContext().getRequestDispatcher(url).forward(request, response);
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	private void filterProducts(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

		 // 1. Lấy tham số
	    String keyword = request.getParameter("keyword");
	    String cateRaw = request.getParameter("categoryID");
	    String minRaw = request.getParameter("minPrice");
	    String maxRaw = request.getParameter("maxPrice");
	    String[] sizes = request.getParameterValues("size");
	    String sort = request.getParameter("sort");

	    // 2. Chuyển đổi kiểu dữ liệu (giữ nguyên logic của bạn nhưng thêm keyword)
	    Integer categoryID = (cateRaw != null && !cateRaw.isEmpty()) ? Integer.parseInt(cateRaw) : null;
	    BigDecimal minPrice = (minRaw != null && !minRaw.isEmpty()) ? new BigDecimal(minRaw) : null;
	    BigDecimal maxPrice = (maxRaw != null && !maxRaw.isEmpty()) ? new BigDecimal(maxRaw) : null;

	    // 3. Gọi DAO (Cần bổ sung keyword vào hàm filter trong DAO)
	    ShopDao dao = new ShopDao();
	    List<Products> products = dao.filterProducts(keyword, categoryID, minPrice, maxPrice, sizes, sort);
	    
	    // Lấy lại danh sách Category để hiển thị lên Sidebar/Offcanvas
	    List<Category> listCate = dao.selectAllCategory();

	    // 4. Đẩy dữ liệu ngược lại JSP để giữ trạng thái bộ lọc
	    request.setAttribute("ListProducts", products);
	    request.setAttribute("cate", listCate);
	    request.setAttribute("selectedCate", categoryID);
	    request.setAttribute("selectedSizes", sizes != null ? Arrays.asList(sizes) : null);
	    request.setAttribute("selectedSort", sort);
	    request.setAttribute("minPrice", minPrice);
	    request.setAttribute("maxPrice", maxPrice);
	    request.setAttribute("keyword", keyword);

	    request.getRequestDispatcher("/WEB-INF/views/shop.jsp").forward(request, response);
	}

}
