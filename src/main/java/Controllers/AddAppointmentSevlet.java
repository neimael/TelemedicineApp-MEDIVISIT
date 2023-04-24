package Controllers;

import java.io.IOException;

import DAO.AppointmentDao;
import Models.Appointment;
import jakarta.servlet.http.*;
import jakarta.servlet.*;


public class AddAppointmentSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/Admin/AddAppointment.jsp").forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getParameter("submit") != null) {

			String date = request.getParameter("date");
			String time = request.getParameter("time");
			int patientId = Integer.parseInt(request.getParameter("Patient"));
			int doctorId = Integer.parseInt(request.getParameter("Doctor"));
			double amount = Double.parseDouble(request.getParameter("amount"));
			String link = request.getParameter("link");
			String status = "Pending";
			Appointment appointment = new Appointment(date, time, doctorId, patientId, status, amount, link);
			
			if (AppointmentDao.addAppointment(appointment) == 1) {
				response.sendRedirect("/telemedicine/AddAppointment?status=success");
			} else {
				response.sendRedirect("/telemedicine/AddAppointment?status=failed");
			}
		}
	}

}
