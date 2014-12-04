package Model;

import java.io.Serializable;

/**
 * User JavaBean to map our UserInfo Database. 
 * @author Jay Patel
 */
public class Users implements Serializable {
    
    private String userName;
    private String passwordMD5;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private String city;
    private String state;
    
    //Racquet Default constrctor. 
    public Users() {
    }
    
    /**
     * Get User Name. 
     * @return name of the User. 
     */
    public String getUserName() {
        return userName;
    }
    
    /**
     * Set User Name. 
     * @param userName name of User. 
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    /**
     * Gets the md5 hash of the User's password. 
     * @return the md5 hash
     */
    public String getPasswordMD5() {
        return passwordMD5;
    }
    
    /**
     * Sets the md5 hash of the User's password.
     * @param passwordMD5 the md5 hash
     */
    public void setPasswordMD5(String passwordMD5) {
        this.passwordMD5 = passwordMD5;
    }
    
    /**
     * Gets a First Name of User.
     * @return name of the User.
     */
    public String getFirstName() {
        return firstName;
    }
    
    /**
     * Sets a First Name of User.
     * @param firstName name of the User. 
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    /**
     * Sets a Last Name of User.
     * @return last name of the User. 
     */
    public String getLastName() {
        return lastName;
    }
    
    /**
     * Sets a Last Name of User. 
     * @param lastName last name of the User. 
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    /**
     * Gets an Email address of the User.
     * @return Email address of the User. 
     */
    public String getEmail() {
        return email;
    }
    
    /**
     * Sets an Email address of the User. 
     * @param email an Email address of the User. 
     */
    public void setEmail(String email) {
        this.email = email;
    }
    
    /**
     * Gets Phone Number of User.
     * @return phone number of User. 
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * Sets Phone Number of User.
     * @param phoneNumber phone number of User.
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    
    /**
     * Gets City that User resides in. 
     * @return City that User resides in. 
     */
    public String getCity() {
        return city;
    }
    
    /**
     * Sets City that User resides in. 
     * @param city User's city. 
     */
    public void setCity(String city) {
        this.city = city;
    }
    
    /**
     * Gets State of the User.
     * @return State of the User. 
     */
    public String getState() {
        return state;
    }
    
    /**
     * Sets the State of the User.
     * @param state the State of the User.
     */
    public void setState(String state) {
        this.state = state;
    }
}