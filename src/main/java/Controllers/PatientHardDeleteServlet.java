package Controllers;

import java.io.IOException;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

import DAO.PatientDao;


public class PatientHardDeleteServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		if(PatientDao.hardDelete(id)) {
			response.sendRedirect("/telemedicine/TrachPatient?status=failed");
		}else {
			response.sendRedirect("/telemedicine/TrachPatient?status=success");
		}
		
	}

}
