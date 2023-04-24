package Controllers;

import java.io.IOException;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

public class DoctorShowAllInfosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/Admin/DoctorShowAllInfos.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
