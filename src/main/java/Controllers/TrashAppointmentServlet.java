package Controllers;

import java.io.IOException;

import jakarta.servlet.http.*;
import jakarta.servlet.*;

public class TrashAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.getRequestDispatcher("/Admin/TrashAppointment.jsp").forward(request, response);
	}



}
