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
    
    //adds a movie to the list.
    public void addMovie(Movie movie) {
        list.add(movie);
    }
    
    //removes the movie from the list.
    public void removeMovie(Movie movie) {
        list.remove(movie);
    }
    
    //True or false value as to whether the title has been used or not. 
    public boolean titleUsed(String title){
        for(Movie movie : list){
            if(movie.getTitle().equals(movie)){
                return true;
            }
        }
        return false;
    }
    
    //Finds a movie by its title. Need to deside if both are needed...
    public Movie getMovie(String title){
        for(Movie movie : list){
            if(movie.getTitle().equals(movie)){
                return movie;
            }
        }
        return null;
    }
       
    //Finds a movie/movies with a given genre.
    public ArrayList<Movie> findMovieGenre(String search){
        ArrayList<Movie> moviesWithGenre = new ArrayList();
        for(Movie movie: list){
            if(movie.getGenre().trim().equalsIgnoreCase(search)){
                moviesWithGenre.add(movie);
            }
        }
        return moviesWithGenre;
    }
    
    //Finds a movie/movies with a given title.
    public ArrayList<Movie> findMovieTitle(String search){
        ArrayList<Movie> moviesWithTitle = new ArrayList();
        for(Movie movie: list){
            if(movie.getTitle().trim().equalsIgnoreCase(search)){
                moviesWithTitle.add(movie);
            }
        }
        return moviesWithTitle;
    }
    
    //Takes a string and converts it into a date.
    private Date stringToDate(String dateString) throws ParseException{
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);
        return date; 
    }
    
    //Takes a date and converts it into a string.
    private String dateToString(Date date){
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        String dateString = df.format(date);
        return dateString;
    }
    
    //Finds movies by Date (not working at the moment...)
    public ArrayList<Movie> findMovieByDate(String startDate, String endDate) throws ParseException{
        Date min = this.stringToDate(startDate);
        Date max = this.stringToDate(endDate);
        ArrayList<Movie> movieList = new ArrayList();
        list.forEach((movie) -> {
            Date rDate = movie.getReleaseDate();
            //min.before(movie.getReleaseDate()) && max.after(movie.getReleaseDate())
            if (rDate.after(min) && rDate.before(max)) {
                movieList.add(movie);
            }
        });
        return movieList;
    }
    
    
    //Prints out the table with all the movies from the search...
    public void print(ArrayList<Movie> movieList, Writer sout) {

        PrintWriter out = new PrintWriter(sout);

        out.print("<table  class=\"results_table\" id=\"rt\"align=\"left\">");
        out.print("\n<thead><th>Title</th><th>Genre</th><th>Release Date</th><th>Price</th><th>Available Copies</th></thead>");

        movieList.stream().map((movie) -> {
            String href = movie.isAvailable() ? "<a class=\"link\" href=\"checkout.jsp?titleSelect="+movie.getTitle().trim()+"\">" + movie.getTitle() + "</a>" : movie.getTitle();
            out.println("<tr class=\"results_row\"> ");
            out.println("<td class=\"title_column\">" + href + "</td>");
            return movie;
        }).map((movie) -> {
            out.println("<td>" + movie.getGenre() + "</td>");
            return movie;
        }).map((movie) -> {
            out.println("<td>" + this.dateToString(movie.getReleaseDate()) + "</td>");
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
