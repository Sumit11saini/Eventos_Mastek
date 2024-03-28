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
/**
 * Servlet implementation class OrganizerEventsServlet
 */
@WebServlet("/OrganizerEventsServlet")
public class OrganizerEventsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private EventsDAOImpl eventDAO=new EventsDAOImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("servlet called");
        List<Events> events = null;
		try {
			HttpSession session = request.getSession();
			int organizerId = (int)session.getAttribute("organizerId");
			System.out.println(organizerId);
			events =eventDAO.getEventDetailsByOrganizerId(organizerId);
	        
	        for (Events e:events) {
	        	System.out.println(e.getEventVenue());
	        }

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("eventsList", events);
        request.getRequestDispatcher("OrganizerEvents.jsp").forward(request, response);
    System.out.println("servlet ended");
    }


}
