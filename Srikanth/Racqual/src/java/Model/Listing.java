package Model;

import java.io.Serializable;
import java.util.Date;

/**
 * Listing JavaBean to map our ListingInfo Database. 
 * @author Jay Patel
 */
public class Listing implements Serializable{
    
    private int listingID;
    private String userName;
    private int racquetID;
    private String newOrUsed;
    private double price;
    private Date dateListed;
    private String description;
    private Users users;
    private Racquet racquet;
    
    //Listing Default constrctor. 
    public Listing() {
       
    }
    
    /**
     * Getter for listing ID.
     * @return listing ID 
     */
    public int getListingID() {
        return listingID;
    }
    
    /**
     * Setter for listing ID.
     * @param listingID listing ID 
     */
    public void setListingID(int listingID) {
        this.listingID = listingID;
    }
    
    /**
     * Getter for User Name.
     * @return name of User. 
     */
    public String getUserName() {
        return userName;
    }
    
    /**
     * Setter for User Name. 
     * @param userName name of user. 
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    /**
     * Getter for Racquet ID.
     * @return id of the racquet. 
     */
    public int getRacquetID() {
        return racquetID;
    }
    
    /**
     * Set Racquet ID of Tennis Racquet. 
     * @param racquetID sets Racquet ID of Tennis Racquet. 
     */
    public void setRacquetID(int racquetID) {
        this.racquetID = racquetID;
    }
    
    /**
     * Getter for New or Used.
     * @return New or Used
     */
    public String getNewOrUsed() {
        return newOrUsed;
    }
    
    /**
     * Setter for New or Used.
     * @param newOrUsed New or Used
     */
    public void setNewOrUsed(String newOrUsed) {
        this.newOrUsed = newOrUsed;
    }
    
    /**
     * Getter for Racquet Price.
     * @return price of racquet. 
     */
    public double getPrice() {
        return price;
    }
    
    /**
     * Set Price of Racquet.
     * @param price the price of Racquet.
     */
    public void setPrice(double price) {
        this.price = price;
    }
    
    /**
     * Getter for Racquet Listing Date.
     * @return the date when Racquet was listed. 
     */
    public Date getDateListed() {
        return dateListed;
    }
    
    /**
     * Set Date when Racquet was listed.
     * @param dateListed the Date when the Racquet was listed. 
     */
    public void setDateListed(Date dateListed) {
        this.dateListed = dateListed;
    }
    
    /**
     * Get description of Tennis Racquet. 
     * @return the description of Tennis Racquet.
     */
    public String getDescription() {
        return description;
    }
    
    /**
     * Description for Tennis Racquet. 
     * @param description the description for Tennis Racquet. 
     */
    public void setDescription(String description) {
        this.description = description;
    }
    
    /**
     * Set Users.
     * @param u the user. 
     */
    public void setUsers(Users u) {
        this.users = u;
    } 
    
    /**
     * Gets the Users.
     * @return the users.
     */
    public Users getUsers() {
        return this.users;
    }
    
     /**
     * Set Racket.
     * @param r the racket. 
     */
    public void setRacket(Racquet r) {
        this.racquet = r;
    }
    
    /**
     * Gets the Racket.
     * @return the racket.
     */
    public Racquet getRacket() {
        return this.racquet;
    }
}