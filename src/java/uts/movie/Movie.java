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
    
    // returns a true/false value as to whether or not there are any more copies available of this movie. 
    public boolean isAvailable(){
        return this.availableCopies > 0;
    }
    
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
