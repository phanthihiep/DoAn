package model.bean;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class CreateEmail {
/*	public MimeMessage createEmail(String to,
            String from,
            String subject,
            String bodyText)throws MessagingException {
			Properties props = new Properties();
			Session session = Session.getDefaultInstance(props, null);
			
			MimeMessage email = new MimeMessage(session);
			
			email.setFrom(new InternetAddress(from));
			email.addRecipient(javax.mail.Message.RecipientType.TO,
			new InternetAddress(to));
			email.setSubject(subject);
			email.setText(bodyText);
			return email;
		}*/
	
	public static void sendEmail(String to) {
		/* String to = "phanhiepcit@gmail.com";*/
		 String from = "hiepcotcit@gmail.com";
		 String host = "localhost";
		 Properties props = System.getProperties();
		 props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
		 Session session = Session.getInstance(props,
				  new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(from, "15061969");
					}
				  });
		 MimeMessage message = new MimeMessage(session);
		 try {
			message.setFrom(new InternetAddress(from));
			 message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			 message.setSubject("THÔNG BÁO ĐẶT BÀN!");
			 message.setText("Chào bạn, bạn đã đặt bàn thành công tại nhà hàng của chúng tôi, cảm ơn bạn");
			 Transport.send(message);
	         System.out.println("Sent message successfully....");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 } 
}
