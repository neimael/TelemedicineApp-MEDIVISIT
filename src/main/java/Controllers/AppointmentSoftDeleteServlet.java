package Controllers;

import java.io.IOException;

import DAO.AppointmentDao;
import jakarta.servlet.http.*;


public class AppointmentSoftDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		if(AppointmentDao.softDelete(id) == 1) {
			response.sendRedirect("/telemedicine/AllAppointments?status=successSoftDelete");
		}else {
			response.sendRedirect("/telemedicine/AllAppointments?status=failed");
		}
	}



}
