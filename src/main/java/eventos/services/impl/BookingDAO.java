
package eventos.services.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import eventos.models.Booking;
import eventos.utility.dbutil;


public class BookingDAO {
	
	
	
	/**
     * Default constructor
     */
    public BookingDAO() {
    	
    }
    
    
	public void createBooking(Booking booking) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        
        
        try {
			connection = dbutil.provideConnection();
			
			String query = "INSERT INTO BOOKING (CUSTOMER_ID, EVENT_ID, TICKET_TYPE_ID, BOOKING_QUANTITY, BOOKING_PRICE) VALUES (?, ?, ?, ?, ?)";
			
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, booking.getCustomerId());
			preparedStatement.setInt(2, booking.getEventId());
			preparedStatement.setInt(3, booking.getTicketTypeId());
			preparedStatement.setInt(4, booking.getBookingQuantity());
			preparedStatement.setDouble(5, booking.getBookingPrice());
			
			int rows = preparedStatement.executeUpdate();
			
			if(rows > 0) {
				System.out.println("Booking created successfully!");
            } else {
                System.out.println("Failed to create booking!");
			}
		
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
        
    }
    
	public int getBookingId(int customerId) {
		
		try {
            // Establishing the database connection
            Connection connection = dbutil.provideConnection();

            // SQL query to fetch the last booking ID for the specified customer
            String sql = "SELECT booking_id FROM bookings WHERE customer_id = ? ORDER BY booking_id DESC LIMIT 1";

            // Preparing the statement to avoid SQL injection
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, customerId);

            // Executing the query
            ResultSet resultSet = statement.executeQuery();
            
            // Closing the connection
            connection.close();

            // Checking if a booking ID was found and displaying it
            if (resultSet.next()) {
                int lastBookingId = resultSet.getInt("booking_id");
                System.out.println("Last Booking ID for customer " + customerId + ": " + lastBookingId);
                return lastBookingId;
            } else {
                System.out.println("No bookings found for customer " + customerId);
                return -1;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
       return -1;
	}
	
	

}
