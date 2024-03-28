package eventos.services.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import eventos.models.Events;
import eventos.models.TicketType;
import eventos.services.EventsDAOInterface;
import eventos.utility.dbutil;
import jakarta.servlet.http.HttpSession;

public class EventsDAOImpl implements EventsDAOInterface {

    @Override
    public String createEvent(Events event, List<TicketType> ticketTypes) {
        String status = "not valid";
        Connection conn = null;
        PreparedStatement psEvent = null;
        PreparedStatement psTicketType = null;
        ResultSet rs = null;

        try {
            conn = dbutil.provideConnection();
            conn.setAutoCommit(false); // Start transaction

            // Insert event data
            String insertEventSQL = "INSERT INTO tbl_events(event_name, event_venue, event_category, event_city, event_date_time, event_description, event_banner, organizer_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            psEvent = conn.prepareStatement(insertEventSQL);
            psEvent.setString(1, event.getEventName());
            psEvent.setString(2, event.getEventVenue());
            psEvent.setString(3, event.getEventCategory());
            psEvent.setString(4, event.getEventCity());
            psEvent.setTimestamp(5, event.getEventDateTime());
            psEvent.setString(6, event.getEventDescription());
            psEvent.setString(7, event.getEventBanner());
            psEvent.setInt(8, event.getOrganizerId());

            int eventInserted = psEvent.executeUpdate();

            if (eventInserted > 0) {
                System.out.println("Insertion Successful");
                int eventId=getGeneratedEventId(event.getOrganizerId());
                    System.out.println(eventId);

                    // Insert ticket types for this event
                    String insertTicketTypeSQL = "INSERT INTO tbl_ticket_types(event_id, ticket_type, ticket_price, ticket_quantity) VALUES (?, ?, ?, ?)";
                    psTicketType = conn.prepareStatement(insertTicketTypeSQL);

                    for (TicketType ticketType : ticketTypes) {
                        psTicketType.setInt(1, eventId);
                        psTicketType.setString(2, ticketType.getTicketType());
                        System.out.println(ticketType.getTicketType());
                        psTicketType.setInt(3, ticketType.getTicketPrice());
                        System.out.println(ticketType.getTicketPrice());
                        psTicketType.setInt(4, ticketType.getTicketQuantity());
                        System.out.println(ticketType.getTicketQuantity());
                        psTicketType.addBatch();
                    }
                    psTicketType.executeBatch(); // Execute batch insert for ticket types

                    conn.commit(); // Commit the transaction
                    status = "Event Registered Successfully";
                }
            
        } catch (SQLException e) {
            status = "Error: " + e.getMessage();
            e.printStackTrace();
        } 

        return status;
    }

    @Override
    public int getGeneratedEventId(int organizerId) {
        int eventId = 0;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = dbutil.provideConnection();

            // Write your SQL query to get the greatest event ID for the given organizer ID
            String sql = "SELECT MAX(event_id) FROM tbl_events WHERE organizer_id = ?";

            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, organizerId); // Set the parameter for organizer ID
            rs = stmt.executeQuery();

            if (rs.next()) {
                eventId = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQL exceptions
        } 
        
        return eventId;
    }

    // Implement other methods as necessary...
    
    
    
    @Override
	public List<Events> getEventDetailsByOrganizerId(int OrganizerId) {
		List<Events> events = new ArrayList<Events>();
		int organizerId=OrganizerId;
        System.out.println("in main block");


		Connection con = dbutil.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select * from tbl_events where organizer_id=?");
			ps.setInt(1,organizerId);
			
			rs = ps.executeQuery();

			while (rs.next()) {

				Events event = new Events();

				event.setEventId(rs.getInt(1));
				event.setEventName(rs.getString(2));
				event.setEventVenue(rs.getString(3));
				event.setEventCategory(rs.getString(4));
				event.setEventCity(rs.getString(5));
				event.setEventDateTime(rs.getTimestamp(6));
				event.setEventDescription(rs.getString(7));
				event.setEventBanner(rs.getString(8));

				events.add(event);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		dbutil.closeConnection(con);
		dbutil.closeConnection(ps);
		dbutil.closeConnection(rs);

		return events;
	}


    @Override
    public String updateEvent(int eventId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public String getEventDetails(String eventName, String eventVenue, String eventCategory, String eventCity, Timestamp eventDateTime, String eventDescription, String eventBanner, int organizerId) {
        // TODO Auto-generated method stub
        return null;
    }

}
