package Controllers;

import java.io.IOException;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

import DAO.DoctorDao;

public class DoctorHardDeleteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		if(DoctorDao.hardDelete(id)) {
			response.sendRedirect("/telemedicine/TrachDoctor?status=failed");
		}else {
			response.sendRedirect("/telemedicine/TrachDoctor?status=success");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
