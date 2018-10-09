package uts.user;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import javax.xml.bind.annotation.*;
import uts.movie.Movie;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="user")
public class User {
    @XmlElement(name = "email")
    private String email;
    @XmlElement(name = "fullName")
    private String fullName;
    @XmlElement(name = "password")
    private String password;
    @XmlElement(name = "phoneNum")
    private String phoneNum;
    @XmlElement(name = "address")
    private String address;
    @XmlElement(name = "dateOfBirth")
    private Date dateOfBirth;

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    
    @XmlElement(name="movie")
    private LinkedList<Movie> list = new LinkedList<Movie>();
    //MoL is Movies on Loan.
    public LinkedList<Movie> getMoL() {
        return list;
    }
    
    // you may also what to add a reserve list that means when the movie is returned, the user with a reservation will get
    // proirty access to the movie. 
    
    public User(){}
    
    public User(String fullName, String email, String password, String phoneNum, String address){
    
    this.fullName = fullName;
    this.email = email;
    this.password = password;
    this.phoneNum = phoneNum;
    this.address = address;
    }
    
    public void updateDetails(String fullName, String email, String password, String phoneNum, String address){
    this.email = email;
    this.fullName = fullName;
    this.password = password;
    this.phoneNum = phoneNum;
    this.address = address; 
    }
    
    
    //Takes a string and converts it into a date.
    public Date stringToDate(String dateString) throws ParseException{
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);
        return date; 
    }
    
    //Takes a date and converts it into a string.
    public String dateToString(Date date){
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        String dateString = df.format(date);
        return dateString;
    }
    
    public String getEmail(){
        return this.email;
    }
    public void setEmail(String email){
        this.email = email;
    }
    
    public String getName(){
        return this.fullName;
    }
    public void setName(String fullName){
        this.fullName = fullName;
    }
    
    public String getPassword(){
        return this.password;
    }
    public void setPassword(String password){
        this.password = password;
    } 
    
    public String getPhoneNumber(){
        return this.phoneNum;
    }
    public void setPhoneNumber(String phoneNum){
        this.phoneNum = phoneNum;
    }
    
    public String getAddress(){
        return this.address;
    }
    public void setAddress(String address){
        this.address = address;
    }
   
}
