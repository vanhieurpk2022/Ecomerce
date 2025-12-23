	package util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import org.mindrot.jbcrypt.BCrypt;

public class Encode {
	
	// tạo salt, mỗi salt khác nhau cho user
	public static String hash(String plainPassword) {
		return BCrypt.hashpw(plainPassword,BCrypt.gensalt(10));
	}
	
	public static boolean verify(String plainPassword,String hashedPassword) {
		return BCrypt.checkpw(plainPassword, hashedPassword);
	}
}
