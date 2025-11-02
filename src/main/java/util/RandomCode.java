package util;

import java.util.Random;

public class RandomCode {
	private final Random rd;
	private static RandomCode instance ;
	
	private RandomCode() {
		rd = new Random();
		
	}
	  public static synchronized RandomCode getInstance() {
	        if (instance == null) {
	            instance = new RandomCode();
	        }
	        return instance;
	    }
	
	public String getCode() {
		StringBuilder str = new StringBuilder();
		for(int i=0;i<6;i++) {
			str.append(rd.nextInt());
		}
		return str.toString();
	}
}
