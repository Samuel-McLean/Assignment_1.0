/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.movie;

import java.util.*;
import java.io.*;
import javax.xml.bind.*;

public class MoviesApplication implements Serializable {

    private String filePath;
    private Movies movies;

    public MoviesApplication() {
    }

    public MoviesApplication(String filePath, Movies movies) {
        super();
        this.filePath = filePath;
        this.movies = movies;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException {
        this.filePath = filePath;
        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Movies.class);
        Unmarshaller u = jc.createUnmarshaller();

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
