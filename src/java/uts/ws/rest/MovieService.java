package uts.ws.rest;

import java.io.IOException;
import java.util.concurrent.ExecutorService;
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.container.AsyncResponse;
import javax.ws.rs.container.Suspended;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import uts.movie.Movie;
import uts.movie.MoviesApplication;
import uts.movie.Movies;

@Path("/moviesApplication")
public class MovieService {    

    @Context
    private ServletContext application;
    private MoviesApplication movieApp;

    private MoviesApplication getMovieApp() throws JAXBException, IOException, Exception {
       
        synchronized (application) {
           MoviesApplication movieApp = (MoviesApplication) application.getAttribute("movieApp");
            if (movieApp == null) {
                movieApp = new MoviesApplication();
                movieApp.setFilePath(application.getRealPath("WEB-INF/movies.xml"));
                application.setAttribute("movieApp", movieApp);
            }
            return movieApp;
        }
    }
//    @Path("welcome")
//    @GET
//    @Produces(MediaType.TEXT_PLAIN)
//    public String welcome() {
//        return "Hello and welcome to UTSTutor";
//    }
    

    @Path("movies/{availableCopies}")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Movies getMovieByAvailability(@PathParam("availableCopies") int availableCopies) throws JAXBException, IOException, Exception{
        //need to fix this
        return getMovieApp().getMovies().getMovieByAvailability(availableCopies);
        //return null;//getMovieApp().getMoviebyStatus(status);
    }

    private ExecutorService executorService = java.util.concurrent.Executors.newCachedThreadPool();

    @Path(value = "movies")
    @GET
    @Produces(value = MediaType.TEXT_XML)
    public void getMovies(@Suspended final AsyncResponse asyncResponse) {
        executorService.submit(new Runnable() {
            public void run() {
                //need to fix this
                //asyncResponse.resume(doGetMovies());
            }
        });
    }
}
