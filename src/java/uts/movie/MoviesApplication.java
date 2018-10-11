/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.movie;

import java.util.*;
import java.io.*;
import javax.xml.bind.*;
import uts.move.user.Users;

public class MoviesApplication implements Serializable {

    private String filePath;
//    private Movies movies;
    private Movies movies = new Movies();
    private Users users;
       
    public MoviesApplication() {
        this.users = new Users();
    }

    public MoviesApplication(String filePath, Movies movies, Users users) {
        super();
        this.users = new Users();
        this.filePath = filePath;
        this.movies = movies;
        this.users = users;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException {

        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Movies.class);
        Unmarshaller u = jc.createUnmarshaller();
        
        this.filePath = filePath;
        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        movies = (Movies) u.unmarshal(fin); // This loads the "shop" object
        fin.close();
    }

    public void updateXML(Movies movies, String filePath) throws Exception {
        this.movies = movies;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Movies.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(movies, fout);
        fout.close();
    }    
    
    
    
    
    public Movies getMovies() {
        return movies;
    }

    public Movie getMovie(String title){
        return movies.getMovie(title);
    }
    
    public void setMovies(Movies movies) {
        this.movies = movies;
    }
    
}
