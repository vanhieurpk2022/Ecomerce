package util;
import java.lang.reflect.Type;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import model.Cart;



public class CookieUtil {
	   private static final String CART_NAME = "Cart";
	    private static final int COOKIE_AGE = 30 * 24 * 60 * 60;
	    private static final Gson gson = new Gson();

	    // Đọc Cart từ cookies
	    public static Cart getCart(HttpServletRequest request) {
	        Cookie[] cookies = request.getCookies();
	        if (cookies != null) {
	            for (Cookie c : cookies) {
	                if (CART_NAME.equals(c.getName())) {
	                    try {
	                        // Decode trước khi parse JSON
	                        String json = URLDecoder.decode(c.getValue(), StandardCharsets.UTF_8);
	                        Cart cart = gson.fromJson(json, Cart.class);
	                        return cart != null ? cart : new Cart();
	                    } catch (Exception e) {
	                        e.printStackTrace();
	                    }
	                }
	            }
	        }
	        return new Cart(); // Mặc định trả về cart mới rỗng
	    }

	    // Lưu Cart vào cookie
	    public static void saveCart(HttpServletResponse response, Cart cart) {
	        String json = gson.toJson(cart);
	        String encodedJson = URLEncoder.encode(json, StandardCharsets.UTF_8);
	        Cookie cookie = new Cookie(CART_NAME, encodedJson);

	        cookie.setMaxAge(COOKIE_AGE); // 30 ngày
	        cookie.setPath("/");           // dùng cho toàn web

	        response.addCookie(cookie);
	    }

	    // Xóa cookie cart
	    public static void clearCart(HttpServletResponse response) {
	        Cookie cookie = new Cookie(CART_NAME, "");
	        cookie.setMaxAge(0);  // xóa
	        cookie.setPath("/");
	        response.addCookie(cookie);
	    }
}
