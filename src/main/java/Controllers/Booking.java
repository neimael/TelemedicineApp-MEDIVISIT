package Controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;

import com.mysql.cj.Session;

import DAO.AppointmentDao;
import Models.Appointment;
import Models.DataBaseConnection;
import Models.Doctor;
import Models.HelperClass;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Booking
 */
public class Booking extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HelperClass help = new HelperClass();
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/Patient/booking.jsp?status=success").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int doctorId = Integer.parseInt(request.getParameter("Id"));
		int patientId = (Integer) session.getAttribute("Id");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String status = "Pending";

		RequestDispatcher dispatcher = null;
		Appointment ap = new Appointment(date, time, doctorId, patientId, status, 0, "");
		
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO `appointments`(`Date`, `Time`, `Patient_id`, `Doctor_id`, `Status`, `amount`, `Link`) "
							+ "VALUES (?,?,?,?,?,?,?)");

			ps.setString(1, ap.getDate());
			ps.setString(2, ap.getTime());
			ps.setInt(3, ap.getPatientId());
			ps.setInt(4, ap.getDoctorId());
			ps.setString(5, ap.getStatus());
			ps.setDouble(6, ap.getAmount());
			ps.setString(7, ap.getLink());
			
			if(ps.executeUpdate() > 0) {	
				response.sendRedirect("/telemedicine/Patient/index.jsp?status=success");
			} else {
				response.sendRedirect("/telemedicine/Patient/index.jsp?status=failed");
			}
			ps.close();
			con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		
	
		
	}
	
	 

}