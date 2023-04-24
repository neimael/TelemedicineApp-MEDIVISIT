package Controllers;

import java.io.IOException;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

import DAO.AppointmentDao;
import Models.Appointment;

public class EditAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/Admin/EditAppointment.jsp").forward(request, response);

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("submit = " + request.getParameter("submit"));
		if (request.getParameter("submit") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			String date = request.getParameter("date");
			String time = request.getParameter("time");
			int patientId = Integer.parseInt(request.getParameter("Patient"));
			int doctorId = Integer.parseInt(request.getParameter("Doctor"));
			double amount = Double.parseDouble(request.getParameter("amount"));
			String link = request.getParameter("link");
			String status = request.getParameter("status");
			Appointment appointment = new Appointment(date, time, doctorId, patientId, status, amount, link);
			
			if (AppointmentDao.updateAppointment(appointment, id) == 1) {
				response.sendRedirect("/telemedicine/AllAppointments?status=successUpdate");
			} else {
				response.sendRedirect("/telemedicine/EditAppointment?status=failed");
			}
		}
	}

}
