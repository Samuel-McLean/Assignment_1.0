package uts.user;
 
import uts.user.User;
import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="users")
public class Users implements Serializable {
    
    @XmlElement(name="user")
    private ArrayList<User> list = new ArrayList<User>();
    public ArrayList<User> getList() {
        return list;
    }
    public void addUser(User user) {
        list.add(user);
    }
    public void removeUser(User user) {
        list.remove(user);
    }
    
    public boolean emailUsed(String email){
        for(User user : list){
            if(user.getEmail().equals(email)){
                return true;
            }
        }
        return false;
    }
    
    public User getUser(String email){
        for(User user : list){
            if(user.getEmail().equals(email)){
                return user;
            }
        }
        return null;
    }
    
    public User login(String email, String password) {
        // For each user in the list...
        for (User user : list) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password))
                return user; // Login correct. Return this user.
        }
        return null; // Login incorrect. Return null.
    }
}