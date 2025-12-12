package util;

import java.util.Random;


import java.util.Random;

public class RandomCode {
    public static String generateCode(int length) {
        Random rd = new Random();
        StringBuilder str = new StringBuilder();
        for (int i = 0; i < length; i++) {
            str.append(rd.nextInt(10));
        }
        return str.toString();
    }

	
//	public String getCode() {
//		System.out.println(str.toString());
//		return str.toString();
//	}
}
