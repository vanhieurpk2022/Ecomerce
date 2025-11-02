package util;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.Properties;
import java.util.Random;



public class Mail {
	private final String password ="qvhe jipg dnjy ofha";
	private final String from = "ClotheStore.support@gmail.com";
	private Session session;
	private RandomCode rdc;
	// properties: khai báo các thuộc tính
	
	public Mail() {
		
		Properties props = new Properties();
		props.put("mail.smtp.host","smtp.gmail.com"); // SMTP HOST
		props.put("mail.smtp.port", "587"); // TLS 587, ssl 465
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable","true");
		
		// create auth
		Authenticator auth = new Authenticator() {
			 @Override
			    protected PasswordAuthentication getPasswordAuthentication() {
			        return new PasswordAuthentication(from, password);
			    }
		};	
		
		 session = Session.getInstance(props,auth);
		
	
	}
	
	public void SendVerifyMail(String To) {
		Message msg = new MimeMessage(session);
		try {
			msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
			// người gửi
			msg.setFrom(new InternetAddress(from));
			// người nhận
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(To));
			
			msg.setSubject("Your verification code");
			msg.setText("Hello,\n\nYour verification code is: "+rdc.getInstance().getCode()+"\nPlease enter this code to verify your account.\n\nBest regards,\nSupport Team");
			Transport.send(msg);
		} catch (Exception e) {
			System.out.println("lỗi gửi mail");
			e.printStackTrace();
		}
	}
	
}
