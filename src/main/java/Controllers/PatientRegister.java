package Controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Models.DataBaseConnection;
import Models.Tools;

import java.sql.*;




public class PatientRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String sex = request.getParameter("sex");
		String address = request.getParameter("address");
		String phoneNumber = request.getParameter("phoneNumber");
		String BirthDay = request.getParameter("BirthDay");
		String socialAccount = request.getParameter("socialAccount");
		
		String username = "";
		String password = Tools.generatePassword(10);
		boolean exist = false;
		do {
			username = lastName + Tools.generateNumber(5);
			try {
				exist = Tools.checkField("patient", "Username", username);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} while (exist == true);
		
		Connection connection = null;
				
		
		try {
				connection = DataBaseConnection.getConnection();
			  if(connection!=null) {
			  System.out.println("Database is Connected !");
			  }else {
				  System.out.println("ERROR!");
			  }
			  
			  PreparedStatement statement = connection.prepareStatement("INSERT INTO patient (First_Name,Last_Name,BirthDay,Email,Number_Phone,Sex,Social_Account,Address,Username,Password) "
			  		+ "VALUES (?,?,?,?,?,?,?,?,?,?)");
			  statement.setString(1,firstName);
			  statement.setString(2,lastName );
			  statement.setString(3,BirthDay);
			  statement.setString(4, email);
			  statement.setString(5, phoneNumber);
			  statement.setString(6, sex);
			  statement.setString(7, socialAccount);
			  statement.setString(8, address);
			  statement.setString(9, username);
			  statement.setString(10, Tools.encryptPassword(password));


			  int rowsCount = statement.executeUpdate();
			  
			  dispatcher = request.getRequestDispatcher("Login/PatientRegister.jsp");
			  statement.close();
			  
			  if (rowsCount > 0) {
				  request.setAttribute("status", "success");
			  } else { 
				  request.setAttribute("status", "failed");
			  }
			  
			  dispatcher.forward(request, response);
			  
			  
			  connection.close();
			  
			  Tools.sendEmail(email, lastName, firstName, username, password,
						"New Account Patient");
		} catch (ClassNotFoundException ee) {
			ee.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
		} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 		
	}

}
