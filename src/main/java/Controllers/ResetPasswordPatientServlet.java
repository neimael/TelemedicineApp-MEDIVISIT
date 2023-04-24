package Controllers;

import java.io.IOException;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

import DAO.PatientDao;


public class ResetPasswordPatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		if(PatientDao.restePassword(id) == 1) {
			response.sendRedirect("/telemedicine/AllPatients?status=successResetPassword");
		}else {
			response.sendRedirect("/telemedicine/AllPatients?status=failed");
		}
	}

}

