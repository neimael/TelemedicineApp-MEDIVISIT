package Controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Models.DataBaseConnection;
import Models.HelperClass;
import Models.Tools;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class UpdateDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static final String UPLOAD_DIR = "images";
	public String dbFileName = "";
	

	Connection connection = null;
	PreparedStatement ps = null;
	RequestDispatcher dispatcher = null;
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		getServletContext().getRequestDispatcher("/Doctor/profil.jsp").forward(req, resp);

	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("Submit") != null) {
			   

			
			
			Part part = req.getPart("image");

			HttpSession session =(HttpSession) req.getSession();
			
			String applicationPath = getServletContext().getRealPath("");
			
			
			int id = (Integer) session.getAttribute("Id");
			String firstName = req.getParameter("fisrtname");
			String lastName = req.getParameter("lastname");
			String email = req.getParameter("email");
			String address = req.getParameter("address");
			String phoneNumber = req.getParameter("phone");
			String workingDays[] = req.getParameterValues("workingDays");
			String workingHours[] = req.getParameterValues("workingHours");
			
			
			String password = Tools.encryptPassword(req.getParameter("passwordNew"));
			
			if(password.isEmpty()) {
				password = Tools.encryptPassword(req.getParameter("password"));
			}
			
			String days = "";
			String hours = "";
			
			for (String s : workingDays) {
				days += s + "-";
			}

			for (String s : workingHours) {
				hours += s + "-";
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
						"UPDATE `doctor` SET `Image_Path` = ? ,`First_Name`=?,`Last_Name`=?,`Email`=?,`Number_Phone`=?,"
						+ "`Address`=?,`Work_Days`=?,`Work_Hours`=?,`Password`=? WHERE id = ?");
				
				ps.setString(1, img_url);
				ps.setString(2, firstName);
				ps.setString(3, lastName);
				ps.setString(4, email);
				ps.setString(5, phoneNumber);
				ps.setString(6, address);
				ps.setString(7, days);
				ps.setString(8, hours);
				ps.setString(9, password);
				ps.setInt(10, id);
			
				int rowsCount = ps.executeUpdate();
				  
				if (rowsCount > 0) {
					  req.setAttribute("status", "success");
					  dispatcher = (RequestDispatcher) req.getRequestDispatcher("/Doctor/profil.jsp");
					  session.setAttribute("fullname", firstName +" "+ lastName);
					  session.setAttribute("FisrtName", firstName);
					  session.setAttribute("LastName", lastName);
					  session.setAttribute("Email", email);
					  session.setAttribute("Phone", phoneNumber);
					  session.setAttribute("Adress", address);
					  session.setAttribute("Password", Tools.decryptPassword(password));
					  session.setAttribute("WorkingDays", days);
					  session.setAttribute("WorkingHours", hours);
					  session.setAttribute("Image",img_url);

				  } else { 
					  req.setAttribute("status", "failed");
				  }
				  
				  
				ps.close();
				dispatcher.forward(req, resp);

				connection.close();

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
