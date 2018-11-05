package etc;

import java.io.IOException;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	public int sendMail(Map<String, String> map) throws IOException {
		Properties properties = System.getProperties();
		properties.put("mail.smtp.startis.enable", "true");
		properties.put("mail.smtp.host","smtp.gmail.com");
		properties.put("mail.smtp.auth","true");
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.starttls.enable","true");
		Authenticator auth = new GoogleAuthentication();
		Session s = Session.getDefaultInstance(properties, auth);
		MimeMessage message = new MimeMessage(s);
		
		try {
			Address sender_address = new InternetAddress(map.get("sender"));
			Address receiver_address = new InternetAddress(map.get("receiver"));
			message.setHeader("content-type", "UTF-8");
			message.setFrom(sender_address);
			message.addRecipient(Message.RecipientType.TO, receiver_address);
			message.setSubject(map.get("subject"),"UTF-8");
			message.setText(map.get("content"),"UTF-8");
			message.setSentDate(new java.util.Date());
			Transport.send(message);
			return 1; //email transfer success
		} catch (Exception e) {
			// Failed Email transfer
			e.printStackTrace();
			return 0;
		}
		
	}
}
