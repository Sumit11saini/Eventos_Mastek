
package eventos.services.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import eventos.utility.dbutil;



/**
 * 
 */
public class PaymentDAO {
	
	/**
	 * Default constructor
	 */
	public PaymentDAO() {

	}

	public void processPayment(int customerId, String paymentMethod, String paymentReference, double amount) {
		BookingDAO bookingDAO = new BookingDAO();
		
		int bookingId = bookingDAO.getBookingId(customerId);
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dbutil.provideConnection();

			String query = "INSERT INTO PAYMENT (BOOKING_ID, PAYMENT_METHOD, REFERENCE_ID, PRICE, PAYMENT_STATUS) VALUES (?, ?, ?, ?)";

			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setInt(1, bookingId);
			preparedStatement.setString(2, paymentMethod);
			preparedStatement.setString(3, paymentReference);
			preparedStatement.setDouble(4, amount);
			preparedStatement.setString(5, "P");

			int rows = preparedStatement.executeUpdate();

			if (rows > 0) {
				System.out.println("Payment processed successfully!");
			} else {
				System.out.println("Failed to process payment!");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void getPaymentDetails() {
		// Logic to get payment details
	}

	public void getPaymentHistory() {
		// Logic to get payment history
	}

	public void getPaymentStatus() {
		// Logic to get payment status
	}

	public void getPaymentSummary() {
		// Logic to get payment summary
	}

	public void getPaymentReport() {
		// Logic to get payment report
	}

	public void generatePaymentReceipt() {
		// Logic to generate payment receipt
	}

	public void sendPaymentReceipt() {
		// Logic to send payment receipt
	}

	public void generatePaymentInvoice() {
		// Logic to generate payment invoice
	}

	public void sendPaymentInvoice() {
		// Logic to send payment invoice
	}

	public void generatePaymentSlip() {
		// Logic to generate payment slip
	}

	public void sendPaymentSlip() {
		// Logic to send payment slip
	}

	public void generatePaymentConfirmation() {
		// Logic to generate payment confirmation
	}

	public void sendPaymentConfirmation() {
		// Logic to send payment confirmation
	}

	public void generatePaymentNotification() {
		// Logic to generate payment notification
	}

	public void sendPaymentNotification() {
		// Logic to send payment notification
	}

	public void generatePaymentAlert() {
		// Logic to generate payment alert
	}

	public void sendPaymentAlert() {
		// Logic to send payment alert
	}

	public void generatePaymentWarning() {
		// Logic to generate payment warning
	}

	public void sendPaymentWarning() {
		// Logic to send payment warning
	}

	public void generatePaymentError() {
		// Logic to generate payment error
	}

	public void sendPaymentError() {
		// Logic to send payment error
	}

}
