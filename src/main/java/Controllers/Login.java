package Controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.poi.util.SystemOutLogger;

import Models.DataBaseConnection;
import Models.Tools;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("fullname") != null) {
			getServletContext().getRequestDispatcher("/Doctor/index.jsp").forward(req, resp);
		} else {
			getServletContext().getRequestDispatcher("/Login/DoctorLogin.jsp").forward(req, resp);

		}
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String profil = request.getParameter("profil");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Connection connection = null;
		PreparedStatement statement = null;
		
		RequestDispatcher dispatcher = null;
		
			try {
				connection = DataBaseConnection.getConnection();
			  System.out.println("Database is Connected !");
			  
			  
			  	if(profil.equals("doctor")) {
			  		  statement = connection.prepareStatement("SELECT * FROM `doctor` WHERE Username = ? AND Password = ?");
					  statement.setString(1,username);
					  statement.setString(2,Tools.encryptPassword(password) );
					  ResultSet rs = statement.executeQuery();
					  if(rs.next()) {
						  HttpSession session =(HttpSession) request.getSession();
						  session.setAttribute("Id", rs.getInt("id"));
						  session.setAttribute("fullname", rs.getString("First_Name")+' '+rs.getString("Last_Name"));
						  session.setAttribute("username", username);
						  session.setAttribute("FisrtName", rs.getString("First_Name"));
						  session.setAttribute("LastName", rs.getString("Last_Name"));
						  session.setAttribute("Email", rs.getString("Email"));
						  session.setAttribute("Phone", rs.getString("Number_Phone"));
						  session.setAttribute("Speciality", rs.getString("Speciality"));
						  session.setAttribute("Adress", rs.getString("Address"));
						  session.setAttribute("Image", rs.getString("Image_Path"));
						  session.setAttribute("Password", Tools.decryptPassword(rs.getString("Password")));
						  session.setAttribute("WorkingDays", rs.getString("Work_Days"));
						  session.setAttribute("WorkingHours", rs.getString("Work_Hours"));
						  


						  dispatcher = (RequestDispatcher) request.getRequestDispatcher("/Doctor/index.jsp");
					  }else {
						  dispatcher = (RequestDispatcher) request.getRequestDispatcher("/Login/DoctorLogin.jsp?status=failed");
					  }
					  }else if(profil.equals("patient")) {
						  statement = connection.prepareStatement("SELECT * FROM `patient` WHERE Username = ? AND Password = ?");
						  statement.setString(1,username);
						  statement.setString(2,Tools.encryptPassword(password) );
						  ResultSet rs = statement.executeQuery();
						  String status = null;
						  if(rs.next()) {
							  status = "success";
							  HttpSession session =(HttpSession) request.getSession();
							  session.setAttribute("Id", rs.getInt("id"));
							  session.setAttribute("fullname", rs.getString("First_Name")+' '+rs.getString("Last_Name"));
							  session.setAttribute("username", username);
							  session.setAttribute("FisrtName", rs.getString("First_Name"));
							  session.setAttribute("LastName", rs.getString("Last_Name"));
							  session.setAttribute("Image", rs.getString("Image_Path"));
							  session.setAttribute("Email", rs.getString("Email"));
							  session.setAttribute("Phone", rs.getString("Number_Phone"));
							  session.setAttribute("birthday", rs.getString("BirthDay"));
							  session.setAttribute("Adress", rs.getString("Address"));
							  session.setAttribute("Sex", rs.getString("Sex"));
							  session.setAttribute("Password", Tools.decryptPassword(rs.getString("Password")));
							  session.setAttribute("Social_Account", rs.getString("Social_Account"));
							 
							  response.sendRedirect("/telemedicine/Patient/index.jsp");
						  }else {
							  response.sendRedirect("/telemedicine/Login/PatientLogin.jsp?status=failed");
						  }
						  
					  }
			  			if(dispatcher == null) {
			  				System.out.println("ok");
			  			}else {
			  				dispatcher.forward(request, response);
			  			}
					  
					  
					  
			  	
					  connection.close();
			  } catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
		
	}

}
