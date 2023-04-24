package Controllers;

import java.io.IOException;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

import DAO.DoctorDao;
import DAO.PatientDao;


public class PatientSoftDeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		if(PatientDao.softDelete(id) == 1) {
			response.sendRedirect("/telemedicine/AllPatients?status=successSoftDelete");
		}else {
			response.sendRedirect("/telemedicine/AllPatients?status=failed");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
