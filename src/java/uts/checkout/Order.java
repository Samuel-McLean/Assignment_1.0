package uts.checkout;

import java.util.ArrayList;
import java.util.Random;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import uts.controller.Validator;
import uts.movie.Movie;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="order")
public class Order {
    @XmlElement(name = "orderID")
    private String orderID;
    @XmlElement(name = "purchasedMovies")
    private ArrayList<Movie> purchasedMovies = new ArrayList<Movie>();
    @XmlElement(name = "copysPurchased")
    private int copysPurchased;
    @XmlElement(name = "email")
    private String email;
    @XmlElement(name = "userName")
    private String userName ;
    @XmlElement(name = "method")
    private String method;
    @XmlElement(name = "status")
    private String status;
    @XmlElement(name = "saleTotal")
    private double saleTotal;
    private Validator validator = new Validator();
    public Order(){
        
    }

    public Order(ArrayList<Movie> moviesOrdered, int copysPurchased, String email, String userName, String method, String status, double saleTotal) {
        String randNum = null;
        while(randNum==null){
            randNum = generateRandID();
        }
        this.orderID = randNum;
        //list of movies ordered
        this.purchasedMovies = moviesOrdered;
        this.copysPurchased = copysPurchased;
        this.email = email;
        this.userName = userName;
        this.method = method;
        this.status = status;
        this.saleTotal = saleTotal;
    }
    
    public Movie getPurchasedMovie(Movie movie){
        for(Movie m: purchasedMovies){
            if(m.equals(movie)){
                return movie;
            }
        }
        return null;
    }
    
    public void removePurchasedMovie(Movie movie){
        purchasedMovies.remove(movie);
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
    
    public void editOrder(ArrayList<Movie> orderedMovies){
        
        
        this.purchasedMovies = orderedMovies;
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

    public ArrayList<Movie> getPurchasedMovies() {
        return purchasedMovies;
    }

    public void setPurchasedMovies(ArrayList<Movie> purchasedMovies) {
        this.purchasedMovies = purchasedMovies;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getCopysPurchased() {
        return copysPurchased;
    }

    public void setCopysPurchased(int copysPurchased) {
        this.copysPurchased = copysPurchased;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
    
    public double getSaleTotal(){
        return saleTotal;
    }
    
    public void setSaleTotal(double total){
        this.saleTotal = total;
    }
    
    public boolean verifyStatus(){
        return status.equalsIgnoreCase("active");
    }   
        
}

