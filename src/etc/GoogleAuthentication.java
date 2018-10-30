package etc;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator{
	PasswordAuthentication passAuth;
	public GoogleAuthentication() {
		passAuth = new PasswordAuthentication("hkk9331","msg90a1a!");
	}
	public PasswordAuthentication getPasswordAuthentication() {
		return passAuth;
	}
}
