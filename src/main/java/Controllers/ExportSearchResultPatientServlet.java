package Controllers;

import java.io.IOException;

import DAO.PatientDao;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

public class ExportSearchResultPatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String search = request.getParameter("search");
			PatientDao.exportSearchResult(response, "NULL", search);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
