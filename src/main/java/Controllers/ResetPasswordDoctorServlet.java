package Controllers;

import java.io.IOException;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

import DAO.DoctorDao;

public class ResetPasswordDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		if (DoctorDao.restePassword(id) == 1) {
			response.sendRedirect("/telemedicine/AllDoctors?status=successResetPassword");
		} else {
			response.sendRedirect("/telemedicine/AllDoctors?status=failed");
		}
	}

}
