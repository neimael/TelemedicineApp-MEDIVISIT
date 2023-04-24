package Controllers;

import java.io.IOException;

import DAO.AdminDao;
import Models.Admin;
import jakarta.servlet.*;
import jakarta.servlet.http.*;


public class AdminShowProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/Admin/Profile.jsp").forward(request, response);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session =request.getSession();
		if (request.getParameter("submit") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String usernmae = request.getParameter("username");
			String phoneNumber = request.getParameter("phoneNumber");
			String BirthDay = request.getParameter("BirthDay");
			String password = request.getParameter("password");
			
			if(password.equals(session.getAttribute("PasswordAdmin"))) {
				Admin admin = new Admin(firstName, lastName, email, phoneNumber, BirthDay, usernmae);

				if (AdminDao.updateAdmin(admin, id) == 1) {
					session.setAttribute("IdAdmin", id);
					session.setAttribute("First_NameAdmin", firstName);
					session.setAttribute("Last_NameAdmin", lastName);
					session.setAttribute("BirthDayAdmin", BirthDay);
					session.setAttribute("EmailAdmin", email);
					session.setAttribute("PasswordAdmin", password);
					session.setAttribute("Phone_NumberAdmin", phoneNumber);
					session.setAttribute("UsernameAdmin", usernmae);
					session.setMaxInactiveInterval(30*60);
					response.sendRedirect("/telemedicine/AdminShowProfile?status=successUpdate");
				} else {
					response.sendRedirect("/telemedicine/AdminShowProfile?status=failed");
				}
			}else {
				response.sendRedirect("/telemedicine/AdminShowProfile?status=passwordIncorrect");

			}
		}
	}


}
