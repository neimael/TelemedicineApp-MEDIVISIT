package Controllers;

import java.io.IOException;

import DAO.AppointmentDao;
import jakarta.servlet.http.*;
import jakarta.servlet.*;


/**
 * Servlet implementation class appointmentCancelled
 */
public class appointmentCancelled extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		if(AppointmentDao.updateStatus(id, "Cancelled") == 1) {
			response.sendRedirect("/telemedicine/Doctor/appointment.jsp");
		}else {
			response.sendRedirect("/telemedicine/Doctor/appointment.jsp");
		}
	}
}
