package Controllers;

import java.io.IOException;

import DAO.AppointmentDao;
import DAO.DoctorDao;
import jakarta.servlet.http.*;
import jakarta.servlet.*;


public class RestoreAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		if(AppointmentDao.restore(id) == 1) {
			response.sendRedirect("/telemedicine/TrashAppointment?status=successRestore");
		}else {
			response.sendRedirect("/telemedicine/TrashAppointment?status=failed");
		}
	}


}
