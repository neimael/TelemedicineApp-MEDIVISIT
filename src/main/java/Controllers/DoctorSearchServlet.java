package Controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jakarta.servlet.http.*;
import jakarta.servlet.*;

import com.google.gson.Gson;

import DAO.DoctorDao;
import Models.Doctor;


public class DoctorSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("id");
		System.out.println("id " + search);
		ArrayList<Doctor> doctors = new ArrayList<Doctor>();
		Doctor doctor;

		if (search != null) {
			ResultSet rs = DoctorDao.searchDoctors("NULL", search);
			try {
				while (rs.next()) {
					String workingDays[] = rs.getString(11).split("-");
					String workingHours[] = rs.getString(12).split("-");
					doctor = new Doctor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6),rs.getString(8), rs.getString(9), rs.getString(7), rs.getString(5), rs.getString(10), workingDays, workingHours);
					doctors.add(doctor);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		write(response, doctors);
	}

	private void write(HttpServletResponse response, ArrayList<Doctor> doctors) throws IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(new Gson().toJson(doctors)); // this is how simple GSON works
	}


}
