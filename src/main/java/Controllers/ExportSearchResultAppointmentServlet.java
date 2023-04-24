package Controllers;

import java.io.IOException;

import DAO.AppointmentDao;
import jakarta.servlet.http.*;
import jakarta.servlet.*;


public class ExportSearchResultAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String search = request.getParameter("search");
			AppointmentDao.exportSearchResult(response, "NULL", search);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}



}
