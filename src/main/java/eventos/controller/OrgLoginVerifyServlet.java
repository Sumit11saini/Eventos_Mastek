package eventos.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import eventos.models.Events;
import eventos.services.OrganizerDAOInterface;
import eventos.services.impl.EventsDAOImpl;
import eventos.services.impl.OrganizerDAOImpl;

@WebServlet("/organizerLogin")
public class OrgLoginVerifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private OrganizerDAOImpl organizerDAOImpl=new OrganizerDAOImpl();
    public OrgLoginVerifyServlet() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        OrganizerDAOImpl organizerDAO = new OrganizerDAOImpl();
		if (organizerDAO.verifyOrganizer(email, password)) {
			
			int organizerId=organizerDAOImpl.getOrganizerIdByEmail(email);
			String organizerName=organizerDAOImpl.getOrganizerNameByEmail(email);
			
			HttpSession session = request.getSession();
			session.setAttribute("organizerId", organizerId);
			session.setAttribute("organizerName", organizerName);
			System.out.println(session.getAttribute("organizerName"));

			RequestDispatcher rd = request.getRequestDispatcher("OrganizerHome.jsp");
            rd.forward(request, response);
		} else {
			response.sendRedirect("Error.jsp");
		}
	}

}
