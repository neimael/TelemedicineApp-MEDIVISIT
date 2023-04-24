package Models;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import DAO.DoctorDao;
import DAO.PatientDao;

public class Tools {

	public static String generatePassword(int length) {
		String capitalCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
		String numbers = "1234567890";
		String combinedChars = capitalCaseLetters + lowerCaseLetters + numbers;
		Random random = new Random();
		char[] password = new char[length];

		password[0] = lowerCaseLetters.charAt(random.nextInt(lowerCaseLetters.length()));
		password[1] = capitalCaseLetters.charAt(random.nextInt(capitalCaseLetters.length()));
		password[2] = numbers.charAt(random.nextInt(numbers.length()));

		for (int i = 3; i < length; i++) {
			password[i] = combinedChars.charAt(random.nextInt(combinedChars.length()));
		}
		String pass = "";
		for (char c : password) {
			pass += c;
		}
		return pass;
	}

	public static String generateNumber(int length) {
		String numbers = "1234567890";
		String combinedChars = numbers;
		Random random = new Random();
		char[] password = new char[length];

		password[0] = numbers.charAt(random.nextInt(numbers.length()));

		for (int i = 1; i < length; i++) {
			password[i] = combinedChars.charAt(random.nextInt(combinedChars.length()));
		}
		String pass = "";
		for (char c : password) {
			pass += c;
		}
		return pass;
	}

	public static boolean checkField(String table, String column, String value)
			throws ClassNotFoundException, SQLException {
		Connection con = DataBaseConnection.getConnection();
		PreparedStatement st = con
				.prepareStatement("Select * From " + table + " Where " + column + " = '" + value + "'");
		ResultSet rs = st.executeQuery();
		System.out.println("rs " + rs.next());
		if (!rs.next()) {
			return false;
		} else {
			return true;
		}
	}
	
	public static boolean checkFieldOnUpdate(String table, String column, String value, int id)
			throws ClassNotFoundException, SQLException {
		Connection con = DataBaseConnection.getConnection();
		PreparedStatement st = con
				.prepareStatement("Select * From " + table + " Where " + column + " = '" + value + "'" + "' AND id != " + id);
		ResultSet rs = st.executeQuery();
		System.out.println("rs " + rs.next());
		if (!rs.next()) {
			return false;
		} else {
			return true;
		}
	}
	
	public static boolean checkInternetConnection() {
        try {
            final URL url = new URL("http://www.google.com");
            final URLConnection conn = url.openConnection();
            conn.connect();
            conn.getInputStream().close();
            return true;
        } catch (MalformedURLException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            return false;
        }
    }
	
	public static void sendEmail(String recipient, String nom, String prenom, String username, String password, String emailType) throws Exception {
        if (checkInternetConnection()) {
            System.out.println("Praparing sent email");
            Properties properties = new Properties();
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.port", "587");

            final String myEmail = "app.medivisit@gmail.com";
            final String myPassword = "gqwukfuxlufpjuxb";


            Session session = Session.getInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(myEmail, myPassword);
                }
            });
            Message message = preapareMessage(session, myEmail, recipient, nom, prenom, username, password, emailType);
            Transport.send(message);
            System.out.println("message sent!");
        }


    }

    private static Message preapareMessage(Session session, String MyEmail, String recipient, String nom, String prenom, String username, String password, String emailType) throws SQLException {
        try {
           
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(MyEmail));
            if ("New Account".equals(emailType)) {
                message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

                message.setSubject("Welcom to Medivist");
                message.setText("Hello Dr." + prenom + " " + nom + ", \n\n" + "Congratulations! \nYou have been added to become a member of the medical staff" + "\n\nYour login information: " + "\nEmail: " + recipient + "\n" + "Username: " + username + "\n\n" + "Password: " + password + "\n" + "Noticed: You can change your username and password from your account.");
            }
            if ("New Account Patient".equals(emailType)) {
                message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

                message.setSubject("Welcom to Medivist");
                message.setText("Hello " + prenom + " " + nom + ", \n\n" + "Congratulations! \nYou account has been created. " + "\n\nYour login information: " + "\nEmail: " + recipient + "\n" + "Username: " + username + "\n" + "Password: " + password + "\n\n" + "Noticed: You can change your username and password from your account.");
            }
            if ("Update Account".equals(emailType)) {
                message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

                message.setSubject("Your username and password has been reset.");
                message.setText("Hello " + prenom + " " + nom + ", \n\n" + "We reset your login information for you.\n\nYour login information:" + "\nEmail: " + recipient + "\n" + "Username: " + username + "\n" + "Mot de passe: " + password + "\n\n" + "Noticed: You can change your username and password from your account.");
            }
            if ("Delete Account".equals(emailType)) {
                message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

                message.setSubject("Your account has been deleted!");
                message.setText("Hello " + prenom + " " + nom + ", \n\n" + "Unfortunately your account has been deleted, you will no longer be able to log in to your account.\n" + "If you believe an error has been made, please contact us.");
            } if ("New Appointment".equals(emailType)) {
            	ResultSet rs = PatientDao.getPatient(Integer.parseInt(nom));
                ResultSet rs2 = DoctorDao.getDoctor(Integer.parseInt(prenom));
                rs.next();
                rs2.next();
                message.setRecipient(Message.RecipientType.TO, new InternetAddress(rs.getString(6)));
                message.setSubject("New Appointment");
                message.setText("Hello " + rs.getString(3) + " " + rs.getString(4) + ", \n\n" + "Congratulations! \nYou have booked an appointment with Dr." + rs2.getString(3) + " " + rs2.getString(4) + ".\n\nYour Appointment informations: " + "\nDate: " + recipient + "\n" + "Time: " + username + "\n" + "Appointment Link: " + password + "\n\n" + "Noticed: You can change or cancel your appointment before 2 days.");
            }

            return message;
        } catch (MessagingException ex) {
        }
        return null;
    }
    
    public static String encryptPassword(String password) {
        Encoder encoder = Base64.getEncoder();
        String originalString = password;
        String encodedString = encoder.encodeToString(originalString.getBytes());
//        System.out.println("Encrypted Value :: " + encodedString);
        return encodedString;
    }

    public static String decryptPassword(String Password) {
        System.out.println("Password " + Password);
        Decoder decoder = Base64.getDecoder();
        byte[] bytes = decoder.decode(Password);
//        System.out.println("Decrypted Value :: " +new String(bytes));
        return new String(bytes);
    }

    
    public static String generateGoogleMeetLink() {
        String baseUrl = "https://meet.google.com/";
        String randomString1 = getRandomString(3);
        String randomString2 = getRandomString(4);
        String randomString3 = getRandomString(3);
        return baseUrl + randomString1 + "-" + randomString2 +"-"+randomString3;
    }

    private static String getRandomString(int length) {
        String characters = "abcdefghijklmnopqrstuvwxyz";
        StringBuilder sb = new StringBuilder(length);
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            sb.append(characters.charAt(random.nextInt(characters.length())));
        }
        return sb.toString();
    }
}