package Controllers;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import DAO.AppointmentDao;


public class AppointmentCP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		if(AppointmentDao.updateStatus(id, "Cancelled") == 1) {
			response.sendRedirect("/telemedicine/Patient/appointment.jsp");
		}else {
			response.sendRedirect("/telemedicine/Patient/appointment.jsp");
		}
	}

	
}
