package eventos.services.impl;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import eventos.constants.IUserConstants;
import eventos.models.Customers;
//import eventos.constants.IUserConstants;
import eventos.services.CustomerDAOInterface;
import eventos.utility.PasswordDecryption;
import eventos.utility.dbutil;




public class CustomerDAOImpl implements CustomerDAOInterface {

	@Override
	public String registerUser(String customerName,String customerMobileNumber,String customerEmail,Date customerDob,String customerPasswordHash,String customerPasswordSalt) {

		Customers customer = new Customers(customerName,customerMobileNumber,customerEmail,customerDob,customerPasswordHash,customerPasswordSalt);

		String status = registerUser(customer);

		return status;
	}

	@Override
	public String registerUser(Customers customer) {

		String status = "Customer Registration Failed!";

		boolean isRegtd = isRegistered(customer.getCustomerEmail());

		if (isRegtd) {
			status = "Email Id Already Registered!";
			return status;
		}
		Connection conn = dbutil.provideConnection();
		PreparedStatement ps = null;
		if (conn != null) {
			System.out.println("Connected Successfully!");
		}

		try {

			ps = conn.prepareStatement("insert into tbl_customers(customer_name, customer_mobile_number, customer_email, customer_dob, customer_password_hash, customer_password_salt) values(?,?,?,?,?,?)");
			
			ps.setString(1, customer.getCustomerName());
			ps.setString(2, customer.getCustomerMobileNumber());
			ps.setString(3, customer.getCustomerEmail());
			ps.setDate(4, customer.getCustomerDob());
			ps.setString(5, customer.getCustomerPasswordHash());
			ps.setString(6, customer.getCustomerPasswordSalt());

			
			int k = ps.executeUpdate();

			if (k > 0) {
				status = "Customer Registered Successfully!";
				System.out.println(status);
//				MailMessage.registrationSuccess(user.getEmail(), user.getName().split(" ")[0]);
			}

		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}

		dbutil.closeConnection(ps);
		dbutil.closeConnection(ps);

		return status;
	}

	@Override
	public boolean isRegistered(String emailId) {
		boolean flag = false;

		Connection con = dbutil.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select * from tbl_customers where email=?");

			ps.setString(1, emailId);

			rs = ps.executeQuery();

			if (rs.next())
				flag = true;     

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		dbutil.closeConnection(con);
		dbutil.closeConnection(ps);
		dbutil.closeConnection(rs);

		return flag;
	}

	@Override
	public String isValidCredential(String customer_email, String customer_password) {
		String status = "Login Denied! Incorrect Username or Password";
		System.out.println("hello");
		boolean valid = false;

		Connection con = dbutil.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("select * from tbl_customers where customer_email=?");

			ps.setString(1, customer_email);
	

			rs = ps.executeQuery();

			if(rs.next()) {
                String passwordHash = rs.getString("customerPasswordHash");
                String passwordSalt = rs.getString("customerPasswordSalt");
                
                System.out.println("Password Hash: " + passwordHash);
                System.out.println("Password Salt: " + passwordSalt);
                
                valid = PasswordDecryption.decryption(customer_password,passwordHash, passwordSalt);
                
                if(valid) {
                    status = "valid";
                }
            }
		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}

		dbutil.closeConnection(con);
		dbutil.closeConnection(ps);
		dbutil.closeConnection(rs);
		return status;
	}

	@Override
	public Customers getCustomerDetails(String emailId, String password) {
		// TODO Auto-generated method stub
		return null;
	}
}