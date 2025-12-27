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
	private static final String USER_COOKIE = "user_login";
	private static final String PASS_COOKIE = "pass_login";
	private static final String REMEMBER_COOKIE = "remember_me";
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
		cookie.setPath("/"); // dùng cho toàn web

		response.addCookie(cookie);
	}

	public static void saveLoginInfo(HttpServletResponse response, String username, String password, boolean remember) {
		if (remember) {
			// Nếu chọn checkbox: Lưu trong 30 ngày
			Cookie uCookie = new Cookie(USER_COOKIE, username);
			Cookie pCookie = new Cookie(PASS_COOKIE, password);
			Cookie rCookie = new Cookie(REMEMBER_COOKIE, "checked");

			int age = 30 * 24 * 60 * 60; // 30 ngày
			uCookie.setMaxAge(age);
			pCookie.setMaxAge(age);
			rCookie.setMaxAge(age);

			uCookie.setPath("/"); // set phạm vi
			pCookie.setPath("/");
			rCookie.setPath("/");

			response.addCookie(uCookie);
			response.addCookie(pCookie);
			response.addCookie(rCookie);
		} else {
			// Nếu không chọn: Xóa sạch cookie cũ
			clearLoginInfo(response);
		}
	}

	public static void clearLoginInfo(HttpServletResponse response) {
		Cookie uCookie = new Cookie(USER_COOKIE, "");
		Cookie pCookie = new Cookie(PASS_COOKIE, "");
		Cookie rCookie = new Cookie(REMEMBER_COOKIE, "");

		uCookie.setMaxAge(0);
		pCookie.setMaxAge(0);
		rCookie.setMaxAge(0);

		uCookie.setPath("/");
		pCookie.setPath("/");
		rCookie.setPath("/");

		response.addCookie(uCookie);
		response.addCookie(pCookie);
		response.addCookie(rCookie);
	}

	// Lấy thông tin cookie (Dùng để hiển thị lại lên Form)
	public static Map<String, String> getLoginCookie(HttpServletRequest request) {
		Map<String, String> loginInfo = new HashMap<>();
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (USER_COOKIE.equals(c.getName()))
					loginInfo.put("username", c.getValue());
				if (PASS_COOKIE.equals(c.getName()))
					loginInfo.put("password", c.getValue());
				if (REMEMBER_COOKIE.equals(c.getName()))
					loginInfo.put("remember", "checked");
			}
		}
		return loginInfo;
	}

	// Xóa cookie cart
	public static void clearCart(HttpServletResponse response) {
		Cookie cookie = new Cookie(CART_NAME, "");
		cookie.setMaxAge(0); // xóa
		cookie.setPath("/");
		response.addCookie(cookie);
	}
}
