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
			System.out.println("Entered into System");
			int organizerId=organizerDAOImpl.getOrganizerIdByEmail(email);
			String organizerName=organizerDAOImpl.getOrganizerNameByEmail(email);
			EventsDAOImpl eventsDAOImpl=new EventsDAOImpl();
			List<Events> events =eventsDAOImpl.getEventDetailsByOrganizerId(organizerId);
			for(Events e:events)
			{
				System.out.println("e name "+e.getEventName());
			}
			HttpSession session = request.getSession();
			session.setAttribute("organizerId", organizerId);
			session.setAttribute("organizerName", organizerName);
//			session.setAttribute("eventList",events);
			request.setAttribute("eventList", events);
			System.out.println(session.getAttribute("organizerName"));
//			request.getRequestDispatcher("OrganizerEvents.jsp").forward(request, response);
//;			response.sendRedirect("OrganizerEvents.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("OrganizerHome.jsp");
            rd.forward(request, response);
		} else {
			response.sendRedirect("Error.jsp");
		}
	}

}
