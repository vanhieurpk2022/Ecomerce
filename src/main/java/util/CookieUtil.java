package util;

import java.lang.reflect.Type;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.reflect.TypeToken;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonParseException;
import java.lang.reflect.Type;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import model.Cart;

public class CookieUtil {
	private static final String USER_ID = "user_id";
	private static final String TOKEN = "token_user";

	private static final String REMEMBER_COOKIE = "remember_me";
	private static final String CART_NAME = "Cart";
	private static final int COOKIE_AGE = 30 * 24 * 60 * 60;
	 private static final Gson gson = new GsonBuilder()
		        .registerTypeAdapter(LocalDate.class, new JsonSerializer<LocalDate>() {
		            @Override
		            public JsonElement serialize(LocalDate src, Type typeOfSrc, JsonSerializationContext context) {
		                return new JsonPrimitive(src.format(DateTimeFormatter.ISO_LOCAL_DATE)); // format: yyyy-MM-dd
		            }
		        })
		        .registerTypeAdapter(LocalDate.class, new JsonDeserializer<LocalDate>() {
		            @Override
		            public LocalDate deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
		                    throws JsonParseException {
		                return LocalDate.parse(json.getAsString(), DateTimeFormatter.ISO_LOCAL_DATE);
		            }
		        })
		        .create();

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

	public static void saveLoginInfo(HttpServletResponse response, String ID, String Token, boolean remember) {
		if (remember) {
			// Nếu chọn checkbox: Lưu trong 30 ngày
			Cookie uCookie = new Cookie(USER_ID, ID);
			Cookie pCookie = new Cookie(TOKEN, Token	);
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
		Cookie uCookie = new Cookie(USER_ID, "");
		Cookie pCookie = new Cookie(TOKEN, "");
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

	public static Map<String, String> getLoginCookie(HttpServletRequest request) {
	    Map<String, String> loginInfo = new HashMap<>();
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie c : cookies) {
	            if (USER_ID.equals(c.getName())) loginInfo.put("user_id", c.getValue());
	            if (TOKEN.equals(c.getName())) loginInfo.put("token", c.getValue());
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
