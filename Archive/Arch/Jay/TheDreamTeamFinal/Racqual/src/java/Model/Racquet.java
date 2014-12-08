package Model;

import java.io.Serializable;


/**
 * This JavaBean is used to represent a tennis racquet in the session data.
 *
 * @author The Dream Team
 * @version 2014/12/5
 */
public class Racquet implements Serializable {
    
    private String userName;
    private String modelName;
    private String brand;
    private double mass;
    private double length;
    private int swingWeight;
    private double balancePoint;
    private double qualityIndex;
    
    //Racquet Default constrctor. 
    public Racquet() {
    }
    
    /**
     * Gets a User Name of the Racquet Owner. 
     * @return user Name of the Racquet Owner. 
     */
    public String getUserName() {
        return userName;
    }
    
    /**
     * Sets a User Name of the Racquet Owner.
     * @param userName user Name of the Racquet Owner. 
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    /**
     * Gets a Model Name of the Racquet.
     * @return model Name of the Racquet.
     */
    public String getModelName() {
        return modelName;
    }
    
    /**
     * Sets a Model Name of the Racquet.
     * @param modelName model name of the Racquet.
     */
    public void setModelName(String modelName) {
        this.modelName = modelName;
    }
    
    /**
     * Gets a Brand of the Racquet. 
     * @return brand of the Racquet. 
     */
    public String getBrand() {
        return brand;
    }
    
    /**
     * Sets a brand of the Racquet
     * @param brand brand of the Racquet.
     */
    public void setBrand(String brand) {
        this.brand = brand;
    }
    
    /**
     * Gets a Mass of Racquet.
     * @return Mass of the Racquet. 
     */
    public double getMass() {
        return mass;
    }
    
    /**
     * Sets a Mass of the Racquet. 
     * @param mass mass of the Racquet. 
     */
    public void setMass(double mass) {
        this.mass = mass;
    }
    
    /**
     * Gets a length of Racquet.
     * @return length of Racquet.
     */
    public double getLength() {
        return length;
    }
    
    /**
     * Sets a Lenght of Racquet.
     * @param length of Racquet. 
     */
    public void setLength(double length) {
        this.length = length;
    }
    
    /**
     * Gets a Swing Weight of Racquet.
     * @return Swing Weight of Racquet. 
     */
    public int getSwingWeight() {
        return swingWeight;
    }
    
    /**
     * Sets a Swing Weight of Racquet.
     * @param swingWeight swing weight of Racquet. 
     */
    public void setSwingWeight(int swingWeight) {
        this.swingWeight = swingWeight;
    }
    
    /**
     * Gets Balance Point Racquet
     * @return balance point of Racquet. 
     */
    public double getBalancePoint() {
        return balancePoint;
    }
    
    /**
     * Sets a balance point of Racquet. 
     * @param balancePoint of Racquet.
     */
    public void setBalancePoint(double balancePoint) {
        this.balancePoint = balancePoint;
    }

    /**
     * Gets a Quality Index of Racquet.
     * @return QualityIndex of Racquet.
     */
    public double getQualityIndex() {
        return qualityIndex;
    }
    
    /**
     * Sets a Quality Index of Racquet
     * @param qualityIndex quality Index of Racquet.
     */
    public void setQualityIndex(double qualityIndex) {
        this.qualityIndex = qualityIndex;
    }
}