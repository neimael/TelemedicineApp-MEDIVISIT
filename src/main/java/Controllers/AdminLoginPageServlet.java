package Controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import DAO.AdminDao;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

public class AdminLoginPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.getRequestDispatcher("/Admin/Login.jsp").forward(request, response);

//		if (session != null) {
//			if (session.getAttribute("EmailAdmin") != null) {
//				System.out.println(session.getAttribute("EmailAdmin"));
//				request.getRequestDispatcher("/Admin/AdminIndex.jsp").forward(request, response);
//			}
//		} else {
//			response.sendRedirect("/telemedicine/AdminLoginPage");
	//		}
//		request.getRequestDispatcher("/Admin/Login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("submit") != null) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			ResultSet rs = AdminDao.login(email, password);
			try {
				if (rs.next()) {
					HttpSession session =request.getSession();
					session.setAttribute("IdAdmin", rs.getInt(1));
					session.setAttribute("First_NameAdmin", rs.getString(2));
					session.setAttribute("Last_NameAdmin", rs.getString(3));
					session.setAttribute("BirthDayAdmin", rs.getString(4));
					session.setAttribute("EmailAdmin", rs.getString(5));
					session.setAttribute("PasswordAdmin", password);
					session.setAttribute("Phone_NumberAdmin", rs.getString(6));
					session.setAttribute("UsernameAdmin", rs.getString(7));
					session.setMaxInactiveInterval(30*60);
					response.sendRedirect("/telemedicine/adminDashboard");

				} else {
					response.sendRedirect("/telemedicine/AdminLoginPage?status=failed");

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
