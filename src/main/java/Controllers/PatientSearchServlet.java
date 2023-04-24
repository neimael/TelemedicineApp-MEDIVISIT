package Controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.google.gson.Gson;

import DAO.PatientDao;
import Models.Patient;
import jakarta.servlet.http.*;
import jakarta.servlet.*;


public class PatientSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String search = request.getParameter("id");
		System.out.println("id " + search);
		ArrayList<Patient> patients = new ArrayList<Patient>();
		Patient patient;

		if (search != null) {
			ResultSet rs = PatientDao.searchPatients("NULL", search);
			try {
				while (rs.next()) {
					
					patient = new Patient(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6),rs.getString(8), rs.getString(10), rs.getString(7), rs.getString(5), rs.getString(9));
					patients.add(patient);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		write(response, patients);
	}

	private void write(HttpServletResponse response, ArrayList<Patient> patients) throws IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(new Gson().toJson(patients)); // this is how simple GSON works
	}



}
