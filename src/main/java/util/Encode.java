package util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class Encode {
	public static String toSHA1(String str) throws UnsupportedEncodingException {
		String salt = "jahsjhdjaj@1312512adsjadhsabdbadagavbahsdj";
		String result = null;
		
		str =str+salt;
		
		try {
			byte[] dataBytes = str.getBytes("UTF-8");
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			
			result = Base64.getEncoder().encodeToString(md.digest(dataBytes));
			
		} catch (NoSuchAlgorithmException  e) {
			System.out.println("Lỗi: SHA-1 không được hỗ trợ");
			e.printStackTrace();
		} catch (UnsupportedEncodingException  e) {
			System.out.println("Unsupport");
		}
		return result;
	}
}
