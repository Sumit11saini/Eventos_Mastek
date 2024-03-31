package eventos.services.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import eventos.models.Booking;
import eventos.models.EventReport;
import eventos.utility.dbutil;

public class EventReportDAOImpl {

    private final Connection conn = dbutil.provideConnection();

    // Method to fetch event reports from the database based on the provided SQL query
    public List<Booking> getEventReports(int eventId) throws SQLException {
        List<Booking> eventReports = new ArrayList<>();
        String query = "SELECT * from tbl_bookings where event_id=?";
        PreparedStatement statement = conn.prepareStatement(query);
        statement.setInt(1, eventId);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
                    int bookingId = resultSet.getInt("booking_id");
                    int customerId = resultSet.getInt("customer_Id");
                    int eventID = resultSet.getInt("event_Id");
                    int ticketTypeId = resultSet.getInt("ticket_Type_Id");
                    Timestamp bookingTimestamp = resultSet.getTimestamp("booking_Timestamp");
                    int bookingQuantity = resultSet.getInt("booking_Quantity");
                    double bookingPrice = resultSet.getDouble("booking_Price");
                    Booking booking = new Booking(bookingId,customerId,eventID,ticketTypeId,bookingTimestamp,bookingQuantity,bookingPrice);
                    eventReports.add(booking);
                }
            
        return eventReports;
    }
    
    
    public int[] getEventSales(int eventId) throws SQLException {
        List<Booking> eventReports = new ArrayList<>();
        String query = "SELECT " +
                "(SELECT sum(booking_quantity) FROM tbl_Bookings WHERE event_id = ?) AS total_attendees, " +
                "(SELECT SUM(ticket_quantity) FROM tbl_ticket_types WHERE event_id = ?) AS total_tickets_available, " +
                "(SELECT SUM(booking_quantity*booking_price) FROM tbl_Bookings WHERE event_id = ?) AS total_revenue " +
                "FROM dual";
        PreparedStatement statement = conn.prepareStatement(query);
        statement.setInt(1, eventId);
        statement.setInt(2, eventId);
        statement.setInt(3, eventId);
        ResultSet resultSet = statement.executeQuery();
        int TotalAttendees = 0;
        int AvailableTickets = 0;
        int TotalRevenue = 0;
        while (resultSet.next()) {
        	
        	 TotalAttendees = resultSet.getInt("total_attendees");
        	 AvailableTickets = resultSet.getInt("total_tickets_available");
        	 TotalRevenue = resultSet.getInt("total_revenue");
        } 
        
       int[] EventSales = {TotalAttendees,AvailableTickets,TotalRevenue};
       System.out.println(EventSales[0]);
       System.out.println(EventSales[1]);
       System.out.println(EventSales[2]);
       return EventSales;
    }
    
    
}
