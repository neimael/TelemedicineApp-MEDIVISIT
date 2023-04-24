package Controllers;

import java.io.IOException;

import DAO.AdminDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class AdminChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/Admin/UpdatePassword.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (request.getParameter("submit") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			String oldPassword = request.getParameter("oldPassword");
			String newPassword = request.getParameter("newPassword");
			String newPassword2 = request.getParameter("newPassword2");
			if (oldPassword.equals(session.getAttribute("PasswordAdmin"))) {
				if(newPassword.equals(newPassword2)) {
					if (AdminDao.updatePassword(newPassword, id) == 1) {
						session.setAttribute("PasswordAdmin", newPassword);
						response.sendRedirect("/telemedicine/AdminChangePassword?status=successUpdate");
					}
				}else {
					response.sendRedirect("/telemedicine/AdminChangePassword?status=passwordsNotMatch");

				}
			}else {
				response.sendRedirect("/telemedicine/AdminChangePassword?status=passwordIncorrect");
			}
			

			
		}
	}

}
