package uts.movie;

import java.io.PrintWriter;
import java.io.Serializable;
import java.io.Writer;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="movies")
public class Movies  implements Serializable {
    @XmlElement(name="movie")
    private ArrayList<Movie> list = new ArrayList<Movie>();
    public ArrayList<Movie> getList() {
        return list;
    }
    
    public void addMovie(Movie movie) {
        list.add(movie);
    }
    public void removeMovie(Movie movie) {
        list.remove(movie);
    }
    
    public boolean titleUsed(String title){
        for(Movie movie : list){
            if(movie.getTitle().equals(movie)){
                return true;
            }
        }
        return false;
    }
    
    public Movie getMovie(String title){
        for(Movie movie : list){
            if(movie.getTitle().equals(movie)){
                return movie;
            }
        }
        return null;
    }
    
    public ArrayList<Movie> getMovieByDate(String dateUpper, String dateLower){
        return null;
    }
    
    public ArrayList<Movie> getMoviesByGenre(String genre){
        ArrayList<Movie> genreMovies = new ArrayList<Movie>();
        for(Movie movie: list){
            if(movie.getGenre().equals(genre)){
                genreMovies.add(movie);
            }
        }
        return genreMovies;
    }   
    
    public ArrayList<Movie> findMovie(String search){
        ArrayList<Movie> found = new ArrayList();
        list.stream().filter((movie) -> (movie.getTitle().trim().equalsIgnoreCase(search)
                || movie.getGenre().trim().equalsIgnoreCase(search))).forEach((tutor) -> {
            found.add(tutor);
        });
        return found;
    }
    
    private Date stringToDate(String dateString) throws ParseException{
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);
        return date; 
    }
    
    public ArrayList<Movie> findMovieByDate(String startDate, String endDate) throws ParseException{
        Date sD = this.stringToDate(startDate);
        Date eD = this.stringToDate(endDate);
        ArrayList<Movie> found = new ArrayList();
        for(Movie movie: list){
            if(sD.after(movie.getReleaseDate()) && eD.before(movie.getReleaseDate())){
                found.add(movie);
            }
        }
        return found;
    }
    
    public void print(ArrayList<Movie> movieList, Writer sout) {

        PrintWriter out = new PrintWriter(sout);

        out.print("<table  class=\"results_table\" align=\"center\">");
        out.print("\n<thead><th>Title</th><th>Genre</th><th>Release Date</th><th>Price</th><th>Available Copies</th></thead>");

        movieList.stream().map((movie) -> {
            String href = movie.isAvailable() ? "<a class=\"link\" href=\"checkout.jsp?titleSelect=" + movie.getTitle() + "\" >" + movie.getTitle() + "</a>" : movie.getTitle();
            out.println("<tr > ");
            out.println("<td>" + href + "</td>");
            return movie;
        }).map((movie) -> {
            out.println("<td >" + movie.getGenre() + "</td>");
            return movie;
        }).map((movie) -> {
            out.println("<td >" + movie.getReleaseDate() + "</td>");
            return movie;
        }).map((movie) -> {
            out.println("<td >" + movie.getPrice() + "</td>");
            return movie;
        }).map((movie) -> {
            out.println("<td >" + movie.getAvailableCopies() + "</td>");
            return movie;
        }).forEach((_item) -> {
            out.println("</tr>");
        });
        out.print("</table>");
    }
    
}
