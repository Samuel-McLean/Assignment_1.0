package uts.movie;

import java.io.PrintWriter;
import java.io.Serializable;
import java.io.Writer;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.xml.bind.annotation.*;

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
    
    
    /*
        list.stream().filter((movie) -> (movie.getTitle().trim().equalsIgnoreCase(search)
                || movie.getGenre().trim().equalsIgnoreCase(search))).forEach((movie) -> {
            found.add(movie);
        });
    */
    
    public ArrayList<Movie> findMovieGenre(String search){
        ArrayList<Movie> moviesWithGenre = new ArrayList();
        for(Movie movie: list){
            if(movie.getGenre().trim().equalsIgnoreCase(search)){
                moviesWithGenre.add(movie);
            }
        }
        return moviesWithGenre;
    }
    
    public ArrayList<Movie> findMovieTitle(String search){
        ArrayList<Movie> moviesWithTitle = new ArrayList();
        for(Movie movie: list){
            if(movie.getTitle().trim().equalsIgnoreCase(search)){
                moviesWithTitle.add(movie);
            }
        }
        return moviesWithTitle;
    }
    
    
    private Date stringToDate(String dateString) throws ParseException{
        Date date = new SimpleDateFormat().parse(dateString);
        return date; 
    }
    
    public ArrayList<Movie> findMovieByDate(String startDate, String endDate) throws ParseException{
        Date min = this.stringToDate(startDate);
        Date max = this.stringToDate(endDate);
        Date rDate;
        ArrayList<Movie> movieList = new ArrayList();
        for(Movie movie: list){
            rDate = movie.getReleaseDate();
            //min.before(movie.getReleaseDate()) && max.after(movie.getReleaseDate())
            if(rDate.after(min) && rDate.before(max)){
                movieList.add(movie);
            }
        }
        return movieList;
    }
    
    public void print(ArrayList<Movie> movieList, Writer sout) {

        PrintWriter out = new PrintWriter(sout);

        out.print("<table  class=\"results_table\" align=\"left\">");
        out.print("\n<thead><th>Title</th><th>Genre</th><th>Release Date</th><th>Price</th><th>Available Copies</th></thead>");

        movieList.stream().map((movie) -> {
            String href = movie.isAvailable() ? "<a class=\"link\" href=\"checkout.jsp?titleSelect="+movie.getTitle().trim()+"\">" + movie.getTitle() + "</a>" : movie.getTitle();
            out.println("<tr> ");
            out.println("<td>" + href + "</td>");
            return movie;
        }).map((movie) -> {
            out.println("<td>" + movie.getGenre() + "</td>");
            return movie;
        }).map((movie) -> {
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            String releaseDate = df.format(movie.getReleaseDate());
            out.println("<td>" + releaseDate + "</td>");
            return movie;
        }).map((movie) -> {
            out.println("<td>" + movie.getPrice() + "</td>");
            return movie;
        }).map((movie) -> {
            out.println("<td>" + movie.getAvailableCopies() + "</td>");
            return movie;
        }).forEach((_item) -> {
            out.println("</tr>");
        });
        out.print("</table>");
    }
    
}
