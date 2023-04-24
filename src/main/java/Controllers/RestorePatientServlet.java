package Controllers;

import java.io.IOException;
import jakarta.servlet.http.*;
import jakarta.servlet.*;


import DAO.PatientDao;


public class RestorePatientServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		if(PatientDao.restore(id) == 1) {
			response.sendRedirect("/telemedicine/TrachPatient?status=successRestore");
		}else {
			response.sendRedirect("/telemedicine/TrachPatient?status=failed");
		}
	}
}
