package Controllers;

import java.awt.event.PaintEvent;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import DAO.AppointmentDao;
import DAO.DoctorDao;
import DAO.PatientDao;
import Models.Appointment;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

public class AppointmentSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String search = request.getParameter("id");
		System.out.println("id " + search);
		ArrayList<Appointment> appointments = new ArrayList<Appointment>();
		Appointment appointment;

		if (search != null) {
			ResultSet rs = AppointmentDao.searchAppointments("NULL", search);
			try {
				while (rs.next()) {
					ResultSet rs2 = PatientDao.getPatient(rs.getInt(4));
					ResultSet rs3 = DoctorDao.getDoctor(rs.getInt(5));
					rs2.next();
					rs3.next();
					appointment = new Appointment(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
							rs.getString(6), rs.getDouble(7), rs.getString(8), rs2.getString(3) + " " + rs2.getString(4), rs3.getString(3) + " " + rs3.getString(4), rs3.getString(10));
					appointments.add(appointment);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		write(response, appointments);
	}

	private void write(HttpServletResponse response, ArrayList<Appointment> appointments) throws IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(new Gson().toJson(appointments)); // this is how simple GSON works
	}
}
