package eventos.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import eventos.models.Booking;
import eventos.models.EventReport;
import eventos.models.Events;
import eventos.models.TicketType;
import eventos.services.EventsDAOInterface;
import eventos.services.TicketTypeDAOInterface;
import eventos.services.impl.EventReportDAOImpl;
import eventos.services.impl.EventsDAOImpl;
import eventos.services.impl.TicketTypeDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/OrgEventDetailsServlet")
public class OrgEventDetailsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("EventDetailsServlet started ");
		// Get the event ID from the request parameter
		int eventId = Integer.parseInt(request.getParameter("eventId"));

		// Assuming you have a service class to handle business logic related to events
		// and tickets
		TicketTypeDAOInterface ticketTypeService = new TicketTypeDAOImpl();
		EventsDAOInterface eventService = new EventsDAOImpl();
		// Fetch details of the selected event by ID
		Events event = null;
		List<TicketType> ticketTypes = null;
		try {
			event = eventService.getEventDetailsByEventId(eventId);
			ticketTypes = ticketTypeService.getTicketTypesForEvent(eventId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// Fetch ticket types associated with the event

		// Set attributes in the request object to pass to the JSP
		request.setAttribute("event", event);
		request.setAttribute("ticketTypes", ticketTypes);
		System.out.println(event);
		System.out.println(ticketTypes);
		
		 EventReportDAOImpl reportdao= new EventReportDAOImpl();
	     
		List<Booking> eventReports=null;
		try {
			HttpSession session = request.getSession();
			eventReports = reportdao.getEventReports(eventId);
			System.out.println(eventReports);
			session.setAttribute("eventReports", eventReports);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		int[] SalesReports;
		try {
			HttpSession session = request.getSession();
			SalesReports=reportdao.getEventSales(eventId);
			System.out.println(SalesReports[0]);
			System.out.println(SalesReports[1]);
			System.out.println(SalesReports[2]);


		    session.setAttribute("SalesReports", SalesReports);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// Forward the request to eventDetails.jsp
		request.getRequestDispatcher("/OrganizerParticularEvents.jsp").forward(request, response);
		System.out.println("EventDetailsServlet Ended ");

	}
}