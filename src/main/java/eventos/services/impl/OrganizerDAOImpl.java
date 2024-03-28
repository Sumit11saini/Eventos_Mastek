/**
 * 
 * @author: Sumit
 */
package eventos.services.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import eventos.models.Organizer;
import eventos.services.OrganizerDAOInterface;

import jakarta.servlet.http.HttpSession;
import eventos.utility.PasswordDecryption;
import eventos.utility.dbutil;

public class OrganizerDAOImpl implements OrganizerDAOInterface {

	/**
	 * 
	 */
	public OrganizerDAOImpl() {
		// TODO Auto-generated constructor stub
	}
	
	
	@Override
	public boolean isRegistered(String email) {
	    boolean registered = false;
	    Connection conn = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;

	    try {
	        conn = dbutil.provideConnection();
	        if (conn != null) {
	            ps = conn.prepareStatement("SELECT COUNT(*) AS count FROM tbl_organizers WHERE organizer_email = ?");
	            ps.setString(1, email);
	            rs = ps.executeQuery();
	            if (rs.next()) {
	                int count = rs.getInt("count");
	                if (count > 0) {
	                    registered = true; // Organizer with the given email is already registered
	                }
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return registered;
	}




	@Override
	public String registerOrganizer(String organizerName, String organizerMobileNumber, String organizerEmail,
			String organizerPasswordHash, String organizerPasswordSalt) {
		Organizer organizer = new Organizer(organizerName, organizerMobileNumber, organizerEmail, organizerPasswordHash,
				organizerPasswordSalt);
		String status = registerOrganizer(organizer);
		return status;
	}

	@Override
	public String registerOrganizer(Organizer organizer) {
		String status = "Organizer Registration Failed!";
		boolean isRegistered = isRegistered(organizer.getOrganizerEmail());

		if (isRegistered) {
			status = "Email Id Already Registered!";
			return status;
		}

		Connection conn = dbutil.provideConnection();
		PreparedStatement ps = null;

		if (conn != null) {
			System.out.println("Connected Successfully!");
		}

		try {
			ps = conn.prepareStatement(
					"INSERT INTO tbl_organizers(organizer_name, organizer_mobile_number, organizer_email, organizer_password_hash, organizer_password_salt) VALUES (?, ?, ?, ?, ?)");
			ps.setString(1, organizer.getOrganizerName());
			ps.setString(2, organizer.getOrganizerMobile());
			ps.setString(3, organizer.getOrganizerEmail());
			ps.setString(4, organizer.getOrganizerPasswordHash());
			ps.setString(5, organizer.getOrganizerPasswordSalt());

			int rowsInserted = ps.executeUpdate();

			if (rowsInserted > 0) {
				status = "Organizer Registered Successfully!";
				System.out.println(status);
				// Additional actions can be taken upon successful registration, like sending an
				// email notification.
			}
		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		} finally {
			dbutil.closeConnection(ps);
		}

		return status;
	}

	@Override
	public String loginOrganizer(String email, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean checkEmail(String email) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Organizer getOrganizer(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updateOrganizer(Organizer organizer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean verifyOrganizer(String email, String password) {
		
		String status = "Login Denied! Incorrect Username or Password";
		boolean valid = false;
		
		System.out.println("Email: " + email);
		System.out.println("Password: " + password);
		
		// Get the organizer from the database
		
		PreparedStatement ps = null;
		
		ResultSet rs = null;
		
		try {
			System.out.println("Connecting to the database...");
			Connection db = dbutil.provideConnection();
			
			System.out.println("Connected to the database!");
			
			ps = db.prepareStatement("SELECT * FROM tbl_organizers WHERE organizer_email = ?");
			
			ps.setString(1, email);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
                String passwordHash = rs.getString("organizer_password_hash");
                String passwordSalt = rs.getString("organizer_password_salt");
                
                System.out.println("Password Hash: " + passwordHash);
                System.out.println("Password Salt: " + passwordSalt);
                
                valid = PasswordDecryption.decryption(password,passwordHash, passwordSalt);
                
                if(valid) {
                    status = "Login Successful!";
                }
            }
			db.close();
		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}
		
		System.out.println("Status: " + status);
		return valid;
	}
	
	public int getOrganizerIdByEmail(String email) {
        int organizerId = -1; // Default value if organizer is not found
        String organizerName=null;
        System.out.println("getOrganizerIdByEmail");

        try (Connection db = dbutil.provideConnection();
             PreparedStatement statement = db.prepareStatement("SELECT ORGANIZER_ID from tbl_organizers where organizer_email=?")) {

            // Set email parameter in the prepared statement
            statement.setString(1, email);
            

            // Execute the query
            try (ResultSet resultSet = statement.executeQuery()) {
                // If a record is found, retrieve organizer_id
                if (resultSet.next()) {
                    organizerId = resultSet.getInt("ORGANIZER_ID");
                    System.out.println(organizerId);
                }
            }
        } catch (SQLException e) {
            // Handle any SQL errors
            e.printStackTrace();
        }

        return organizerId;
    }
	
	public String getOrganizerNameByEmail(String email) {
	    String organizerName = null; // Default value if organizer is not found

	    try (Connection db = dbutil.provideConnection();
	         PreparedStatement statement = db.prepareStatement("SELECT ORGANIZER_NAME FROM tbl_organizers WHERE organizer_email=?")) {

	        // Set email parameter in the prepared statement
	        statement.setString(1, email);

	        // Execute the query
	        try (ResultSet resultSet = statement.executeQuery()) {
	            // If a record is found, retrieve organizer_name
	            if (resultSet.next()) {
	                organizerName = resultSet.getString("ORGANIZER_NAME");
	              
	            }
	        }
	    } catch (SQLException e) {
	        // Handle any SQL errors
	        e.printStackTrace();
	    }

	    return organizerName;
	}



}
