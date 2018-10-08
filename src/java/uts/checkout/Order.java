package uts.checkout;

import java.util.Date;
import java.util.Random;
import javax.xml.bind.annotation.XmlElement;
import uts.controller.Validator;

public class Order {
    @XmlElement(name = "orderID")
    private String orderID;
    @XmlElement(name = "movieTitle")
    private String movieTitle;
    @XmlElement(name = "genre")
    private String genre;
    @XmlElement(name = "price")
    private double price;
    @XmlElement(name = "releaseDate")
    private Date releaseDate;
    @XmlElement(name = "copysPurchased")
    private int copysPurchased;
    @XmlElement(name = "userName")
    private String userName ;
    @XmlElement(name = "method")
    private String method;
    @XmlElement(name = "status")
    private String status;
    private Validator validator = new Validator();
    public Order(){
        
    }

    public Order(String movieTitle, String genre, double price, Date releaseDate, int copysPurchased, String userName, String method, String status) {
        String randNum = null;
        while(randNum==null){
            randNum = generateRandID();
        }
        this.orderID = randNum;
        this.movieTitle = movieTitle;
        this.genre = genre;
        this.price = price;
        this.releaseDate = releaseDate;
        this.copysPurchased = copysPurchased;
        this.userName = userName;
        this.method = method;
        this.status = status;
    }
    
    private String validateID(String orderID){
        if(validator.validateOrderID(orderID)){
            return orderID;
        }else{
            generateRandID();
        }
        return null;
    }
    //note that once there are more then 999 orders, this will break, and will endlessly loop. 
    private String generateRandID(){
        Random rand = new Random();
        int randomNum = 0;
        randomNum = rand.nextInt((999 - 0) + 1) + 100;
        if(randomNum < 100){
            if(randomNum < 10){
                return validateID("00"+randomNum);
            } else{
                return validateID("0"+randomNum);
            }
        }else{
            return validateID(randomNum+"");
        }
    }
    
    public void generateNewOrderID(){
        String newOrderID = null;
        while(newOrderID==null){
            newOrderID = generateRandID();
        }
        this.orderID = newOrderID;
    }

    public String getOrderID() {
        return orderID;
    }

    public String getMovieTitle() {
        return movieTitle;
    }

    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getCopysPurchased() {
        return copysPurchased;
    }

    public void setCopysPurchased(int copysPurchased) {
        this.copysPurchased = copysPurchased;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public boolean verifyStatus(){
        return status.equalsIgnoreCase("active");
    }   
        
}

