package uts.ws.rest;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import uts.user.User;
import uts.user.UserApplication;
import uts.user.Users;

@Path("/studentApp")
public class UserService {    

    @Context
    private ServletContext application;

    private UserApplication getUserApp() throws JAXBException, IOException, Exception {
        // The web server can handle requests from different clients in parallel.
        // These are called "threads".
        //
        // We do NOT want other threads to manipulate the application object at the same
        // time that we are manipulating it, otherwise bad things could happen.
        //
        // The "synchronized" keyword is used to lock the application object while
        // we're manpulating it.
        synchronized (application) {
            UserApplication userApp = (UserApplication) application.getAttribute("userApp");
            if (userApp == null) {
                userApp = new UserApplication();
                userApp.setFilePath(application.getRealPath("WEB-INF/users.xml"));
                application.setAttribute("studentApp", userApp);
            }
            return userApp;
        }
    }
    @Path("welcome")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String welcome() {
        return "Hello and welcome to UTSTutor";
    }
    
    @Path("users")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Users getUsers() throws JAXBException, IOException, Exception{
        return getUserApp().getUsers();
    }

    @Path("students/{email}")
    @GET
    @Produces(MediaType.TEXT_XML)
    public User getUser(@PathParam("email") String email) throws JAXBException, IOException, Exception{
        return getUserApp().getUsers().getUser(email);
    }    
   
}
