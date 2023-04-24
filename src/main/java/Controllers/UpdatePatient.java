package Controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Models.DataBaseConnection;
import Models.HelperClass;
import Models.Tools;

/*
 * Notre serlvet permettant de récupérer les fichiers côté serveur.
 * Elle répondra à l'URL /upload dans l'application Web considérée.
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class UpdatePatient extends HttpServlet {

    private static final long serialVersionUID = 1273074928096412095L;
    public static final String UPLOAD_DIR = "images";
	public String dbFileName = "";
	RequestDispatcher dispatcher = null;
	Connection connection = null;
	PreparedStatement ps = null;
	
	
   @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   Part part = req.getPart("image");
		HttpSession session =(HttpSession) req.getSession();
		String applicationPath = getServletContext().getRealPath("");
		
		int id = (Integer) session.getAttribute("Id");
		String firstName = req.getParameter("fisrtname");
		String lastName = req.getParameter("lastname");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		String phoneNumber = req.getParameter("phone");
		String birth = req.getParameter("birthday");
		String social = req.getParameter("Social_Account");
		
		
		String password = Tools.encryptPassword(req.getParameter("passwordNew"));
		
		if(password.isEmpty()) {
			password = Tools.encryptPassword(req.getParameter("password"));
		}
		
		
		HelperClass save = new HelperClass();
		String img_url = save.SaveImage(applicationPath, part);
		if(part.getSize()==0) {
			img_url = (String) session.getAttribute("Image");
		}
		try {
		connection = DataBaseConnection.getConnection();
		  System.out.println("Database is Connected !");

		ps = connection.prepareStatement(
				"UPDATE `patient` SET`First_Name`=?,`Last_Name`=?,`Email`=?,`Number_Phone`=?,`Address`=?,`Social_Account`=?,"
				+ "`BirthDay`=?, `Image_Path`=? , `Password`=? WHERE id = ?");
		
			ps.setString(1, firstName);
			ps.setString(2, lastName);
			ps.setString(3, email);
			ps.setString(4, phoneNumber);
			ps.setString(5, address);
			ps.setString(6, social);
			ps.setString(7, birth);
			ps.setString(8, img_url);
			ps.setString(9, password);
			ps.setInt(10, id);
		
		int rowsCount = ps.executeUpdate();
		 
		if (rowsCount > 0) {
			
			  req.setAttribute("status", "success");
			  dispatcher = (RequestDispatcher) req.getRequestDispatcher("/Patient/profil.jsp");
			  session.setAttribute("Image", img_url);
			  session.setAttribute("fullname", firstName +" "+ lastName);
			  session.setAttribute("FisrtName", firstName);
			  session.setAttribute("LastName", lastName);
			  session.setAttribute("Email", email);
			  session.setAttribute("Phone", phoneNumber);
			  session.setAttribute("Adress", address);
			  session.setAttribute("Password", Tools.decryptPassword(password));
			  session.setAttribute("Social_Account", social);
			  session.setAttribute("birthday", birth);

		  } else { 
			  req.setAttribute("status", "failed");
		  }
		 } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

		  dispatcher = req.getRequestDispatcher("Patient/profil.jsp");
		  
		  dispatcher.forward(req, resp);
	}
   
  

}