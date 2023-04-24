package Controllers;

import java.io.IOException;

import jakarta.servlet.http.*;
import jakarta.servlet.*;


public class BookAppointmentPatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		response.sendRedirect("/telemedicine/AddAppointment?id=" + id);
	}



}
