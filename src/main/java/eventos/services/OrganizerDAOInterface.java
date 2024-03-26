/**
 * This is the DAO interface for the Organizer
 * 
 * @author: Vidit Pujara
 * @version: 1.0
 * @since: 10 March 2024
 * @lastUpdated: 18 March 2024
 */
package eventos.services;

import eventos.models.Organizer;

public interface OrganizerDAOInterface {

	/**
	 * This method is used to register the organizer
	 * 
	 * @param name
	 * @param email
	 * @param password
	 * @param contact
	 * @param address
	 * @return
	 */
	
	boolean isRegistered(String email);
	
	
	public String registerOrganizer(String organizerName, String organizerMobileNumber, String organizerEmail,
			String organizerPasswordHash, String organizerPasswordSalt);

	/**
	 * This method is used to register the organizer
	 * 
	 * @param organizer
	 * @return String
	 */
	public String registerOrganizer(Organizer organizer);
	
	/**
	 * This method is used to login the organizer
	 * 
	 * @param email
	 * @param password
	 * @return String
	 */
	public String loginOrganizer(String email, String password);
	
	/**
	 * This method is used to check the email
	 * 
	 * @param email
	 * @return boolean
	 */
	public boolean checkEmail(String email);
	
	/**
	 * This method is used to get the organizer
	 * 
	 * @param email
	 * @return Organizer
	 */
	public Organizer getOrganizer(String email);
	
	/**
	 * This method is used to update the organizer
	 * 
	 * @param organizer
	 * @return String
	 */
	public String updateOrganizer(Organizer organizer);
	
	/**
	 * This method is used to verify the organizer
	 * 
	 * @param email
	 * @param password
	 * @return boolean
	 */
	public boolean verifyOrganizer(String email, String password);
}
