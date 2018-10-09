package uts.movie;

import java.util.Date;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.PROPERTY)
public class Movie {
    private String title;
    private String genre;
    private Date releaseDate;
    private double price;
    private int availableCopies;
    
    public Movie(){
        
    }
    
    public Movie(String title, String genre, Date releaseDate, double price, int availableCopies){
        this.title = title;
        this.genre = genre;
        this.releaseDate = releaseDate;
        this.price = price;
        this.availableCopies = availableCopies;
    }
    
    public void updateDetails(String title, String genre, Date releaseDate, double price, int availableCopies){
        this.title = title;
        this.genre = genre;
        this.releaseDate = releaseDate;
        this.price = price;
        this.availableCopies = availableCopies;
    }
    
    public Movie orderMovie(String movieTitle, Date movieReleaseDate, int orderedCopies){
        if(this.title.equals(movieTitle) && this.releaseDate.equals(movieReleaseDate) && isAvailable(orderedCopies)){
            return this;
        }
        return null;
    }
    
    // returns a true/false value as to whether or not there are any more copies available of this movie. 
    private boolean isAvailable(int orderedCopies){
        int AC = this.availableCopies;
        if(orderedCopies < AC){
            this.availableCopies = AC - orderedCopies;
            return true;
        }
        return false;
    }
    
    public boolean isAvailable(){
        return availableCopies > 0;
    }
    
    //getters and setters...
    
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getAvailableCopies() {
        return availableCopies;
    }

    public void setAvailableCopies(int availableCopies) {
        this.availableCopies = availableCopies;
    }
    
}
