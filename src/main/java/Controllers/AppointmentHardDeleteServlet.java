package Controllers;

import java.io.IOException;

import DAO.AppointmentDao;
import jakarta.servlet.http.*;
import jakarta.servlet.*;


public class AppointmentHardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		if(AppointmentDao.hardDelete(id)) {
			response.sendRedirect("/telemedicine/TrashAppointment?status=failed");
		}else {
			response.sendRedirect("/telemedicine/TrashAppointment?status=success");
		}
	}



}
