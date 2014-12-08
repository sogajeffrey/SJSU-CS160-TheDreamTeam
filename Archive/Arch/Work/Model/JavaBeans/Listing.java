
import Model.Users;
import java.io.Serializable;
import java.util.Date;

/**
 * Listing JavaBean to map our ListingInfo Database. 
 * @author Jay Patel
 */
public class Listing implements Serializable{
    
    private String userName;
    private int racquetID;
    private String newOrOld;
    private double price;
    private Date dateListed;
    private Date dateSold;
    private String buyer;
    private int sellerRating;
    private String description;
    private String picURL;
    private Users users;
    private Racquet racquet;
    
    //Listing Default constrctor. 
    public Listing() {
       
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
     * Getter for New or Old.
     * @return status of the racquet. 
     */
    public String getNewOrOld() {
        return newOrOld;
    }
    
    /**
     * Set status of the Tennis Racquet. 
     * @param newOrOld status of Racquet. 
     */
    public void setNewOrOld(String newOrOld) {
        this.newOrOld = newOrOld;
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
     * Getter for Date sold. 
     * @return the Date when Racquet was sold. 
     */
    public Date getDateSold() {
        return dateSold;
    }
    
    /**
     * Set Date when Racquet was sold 
     * @param dateSold Date when Racquet was sold. 
     */
    public void setDateSold(Date dateSold) {
        this.dateSold = dateSold;
    }
    
    /**
     * Getter for Buyer Name.
     * @return name of Buyer. 
     */
    public String getBuyer() {
        return buyer;
    }
    
    /**
     * Set User Name of Buyer.
     * @param buyer User Name of Buyer. 
     */
    public void setBuyer(String buyer) {
        this.buyer = buyer;
    }
    
    /**
     * Getter for Sellers name. 
     * @return Sellers name.
     */
    public int getSellerRating() {
        return sellerRating;
    }
    
    /**
     * Set Sellers Ratings. 
     * @param sellerRating sellers ratings. 
     */
    public void setSellerRating(int sellerRating) {
        this.sellerRating = sellerRating;
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
     * Get picture URL of Tennis Racquet. 
     * @return path to the Tennis Racquet URL. 
     */
    public String getPicURL() {
        return picURL;
    }
    
    /**
     * Set picture URL of Tennis Racquet. 
     * @param picURL picURL of Racquet. 
     */
    public void setPicURL(String picURL) {
        this.picURL = picURL;
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