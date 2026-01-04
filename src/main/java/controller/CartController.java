package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AddressDao;
import dao.OrdersDao;
import dao.ProductVariantsDao;
import dao.ProductsDao;
import dao.ServicesTaxDao;
import model.Address;
import model.Cart;
import model.CartItems;
import model.Order;
import model.OrderDetail;
import model.ProductVariants;
import model.Products;
import model.UserSession;
import util.CookieUtil;

/**
 * Servlet implementation class CartController
 */
@WebServlet("/cart/*")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartController() {
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
		
		HttpSession session = request.getSession(false);
		UserSession userSession = (UserSession) session.getAttribute("user");

		if (path != null) {
			switch (path) {
			case "/checkout":
				AddressDao address = new AddressDao();
				List<Address> getAddress = address.selectAddressByUserID(userSession.getIdUser());
				request.setAttribute("getAddress", getAddress);
				request.getRequestDispatcher("/WEB-INF/views/checkout_user.jsp").forward(request, response);
				break;
			default:
				throw new IllegalArgumentException("Unexpected value: " + path);
			}
		} else {
			Cart cart = (Cart) session.getAttribute("Cart");
			// load products và productsVariant	
			ProductVariantsDao variantDao = new ProductVariantsDao();
			ProductsDao productDao = new ProductsDao();

			for (CartItems item : cart.getItems()) {
			    ProductVariants var = variantDao.selectById(item.getVariantID());
			    Products prod = productDao.selectByVariantId(item.getVariantID());

			    item.setVariant(var);
			    item.setProducts(prod);
			}
			CookieUtil.saveCart(response, cart);
			request.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(request, response);
			

		}

	}

	private void changeQuanity(HttpServletRequest request, HttpServletResponse response) {
		int getProductsId = Integer.parseInt(request.getParameter("id"));
		int getQuanity = Integer.parseInt(request.getParameter("quanity"));
		HttpSession session = request.getSession(false);
		
		Cart getCart = (Cart) session.getAttribute("Cart");

		getCart.changeQuanity(getProductsId, getQuanity);
		CookieUtil.saveCart(response, getCart);
	}

	private void removeProducts(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int getVariantID = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession(false);

		Cart getCart = (Cart) session.getAttribute("Cart");

		getCart.removeItems(getVariantID);
		CookieUtil.saveCart(response, getCart);
		if (getCart.getSize() <= 0) {
			CookieUtil.clearCart(response);
		}

		// Trong Controller, trả về dạng JSON
		response.setContentType("application/json");
		response.getWriter()
				.write("{\"totalPrice\": " + getCart.getPrice() + ", \"cartCount\": " + getCart.getSize() + "}");

	}

	private void AddProductToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		int getVariantID = Integer.parseInt(request.getParameter("variantID"));
		int getQuanity = Integer.parseInt(request.getParameter("quanity"));
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("Cart");

		if (cart == null) {
			cart = (Cart) CookieUtil.getCart(request);

		}

		cart.addItem(getVariantID, getQuanity);
		session.setAttribute("Cart", cart);
		CookieUtil.saveCart(response, cart);

		int cartSize = cart.getSize();
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(String.valueOf(cartSize));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if (action != null) {
			switch (action) {
			case "AddProduct":
				AddProductToCart(request, response);
				break;
			case "RemoveProducts":
				removeProducts(request, response);
				break;
			case "OnchangeQuanity":
				changeQuanity(request, response);
				break;
			case "getShippingPrice":
				getShippingPrice(request, response);
				break;
			case "applyVouchers":
				ApplyVouchers(request, response);
				break;
			case "orders":
				getOrders(request, response);
				break;
			case "changeStatusOrder":
				changeStatusOrder(request, response);
				break;
			default:
				throw new IllegalArgumentException("Unexpected value: " + action);
			}
		} else {
			
			request.setAttribute("active", "cart");
			request.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(request, response);

		}
	}

	private void changeStatusOrder(HttpServletRequest request, HttpServletResponse response) {
		String orderID = request.getParameter("orderID");
		try {
			int id = Integer.parseInt(orderID);
			OrdersDao dao = new OrdersDao();
			if(dao.updateStatusOrderByID(id)) {
				response.setStatus(HttpServletResponse.SC_OK);
			}
			;
		} catch (Exception e) {
			// TODO: handle exception
		}
	
		
	}

	private void getOrders(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		OrdersDao dao = new OrdersDao();
		HttpSession session = request.getSession(false);
		UserSession userSession = (UserSession) session.getAttribute("user");
		Cart cart = (Cart) session.getAttribute("Cart");
		String getAddressId = request.getParameter("address");
		String shipping_fee = request.getParameter("shipping");
		String getNote = request.getParameter("note");
		String getSubTotal = request.getParameter("subtotal");
		String getPaymentMethod = request.getParameter("payment");
		String getDiscount = request.getParameter("discount_fee");
		String getTotalAmount = request.getParameter("finalTotal");

		try {
			
			// các giá trị bị dính prefix đồng tiền ở cuối ví dụ: 78 đ
			
			int addID = Integer.parseInt(getAddressId);
			BigDecimal shipping =pareString(shipping_fee);
			BigDecimal subtotal = pareString(getSubTotal);
			
				BigDecimal discount = pareString(getDiscount);

			BigDecimal total = pareString(getTotalAmount);

			Order or = new Order(userSession.getIdUser(), addID, shipping, getNote, subtotal, getPaymentMethod,
					discount, total);

			int key = dao.insertOrders(or);
			if (key >= 0) {
				for (int i = 0; i < cart.getSize(); i++) {
					OrderDetail od = new OrderDetail(key, cart.getItems().get(i).getProducts().getProductID(), cart.getItems().get(i).getVariantID(),
							cart.getItems().get(i).getQuanity(), cart.getItems().get(i).getSubtotal());
					dao.insertOrdersDetails(od);
				}
			}
				CookieUtil.clearCart(response);
				response.sendRedirect(request.getContextPath() + "/user/orders_his");
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		request.getRequestDispatcher("/WEB-INF/views/checkout_user.jsp").forward(request, response);

	}
	private BigDecimal pareString(String str) {
		if(str.isEmpty()) {
			return BigDecimal.ZERO;
		}else {
			return new BigDecimal(str);
		}
	}

	private void ApplyVouchers(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String getVouchersCode = request.getParameter("voucher_name");
		ServicesTaxDao dao = new ServicesTaxDao();
		BigDecimal getDiscount = dao.isCodeValid(getVouchersCode);

		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().write("{\"price\":" + getDiscount.toPlainString() + "}");
	}

	private void getShippingPrice(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String getCity = request.getParameter("city");

		ServicesTaxDao dao = new ServicesTaxDao();
		BigDecimal price = dao.getPriceByCity(getCity);

		response.setContentType("application/json;charset=UTF-8");

		response.getWriter().write("{\"price\":" + price.toPlainString() + "}");
	}

}
