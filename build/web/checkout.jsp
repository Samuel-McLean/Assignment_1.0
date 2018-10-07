<%@page import="uts.movie.*"%>
<%@page import="uts.user.*"%>
<%@page import="java.util.ArrayList"%>
<<<<<<< HEAD
=======
<%@page import="uts.checkout.*"%>
>>>>>>> c1bbd9d5afb796e74736bc5734ac92157294eb3d
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
    </head>
    <body>
        <% String userPath = application.getRealPath("WEB-INF/users.xml");%>
        <jsp:useBean id="userApp" class="uts.user.UserApplication" scope="application">
            <jsp:setProperty name="userApp" property="filePath" value="<%=userPath%>"/>
        </jsp:useBean>
        <% String moviePath = application.getRealPath("WEB-INF/movies.xml");%>
        <jsp:useBean id="moviesApp" class="uts.movie.MoviesApplication" scope="application">
            <jsp:setProperty name="moviesApp" property="filePath" value="<%=moviePath%>"/>
        </jsp:useBean>
        <%Users users = userApp.getUsers();%>
        <%Movies movies = moviesApp.getMovies();%>
        <%
            User user = (User) session.getAttribute("user");
            String log = "";
            if (user != null) {
                log = " &lt " + user.getName() + " &gt";
            } else {
                log = " &lt " + " Unkonwn User " + " &gt";
            }
        %>
        <h2 class="header">Checkout</h2>
        <table class="main_table" >
            <tr ><td align="right" class="log" >You are logged in as  <%=log%></td></tr>
            <tr><td align="right"><u><a  class="link" href="checkout.jsp">View All</a></u> &emsp;<u><a  class="link" href="main.jsp">Main</a></u> &emsp;<u><a  class="link" href="edit_user.jsp">Account</a></u> &emsp; <u><a class="link" href="logout.jsp">Logout</a></u>&emsp; </td></tr>
        </table>
               
        <div>
            <%
                session.removeAttribute("checkoutMsg");
                String email = request.getParameter("emailSelect");
                if (email != null) {
                    ArrayList<Movies> movieList = new ArrayList();
                    //need to put the title of the movie you are trying to checkout in getMovie(HERE, PUT IT HERE). 
                    Movie checkoutMovie = movies.getMovie();
                    movieList.add(checkoutMovie);
                    if (movieList.size() > 0) {
                        //make a print
                        movies.print(movieList, out);
                    }
            %>
            <form class="checkout_form_div" method="post" action="main.jsp">
                <%
                    checkout.addBooking(new checkout(checkoutTutor.getName(), checkoutTutor.getEmail(), user.getName(), user.getEmail(), checkoutTutor.getSubject(), "active"));
                    checkoutApp.updateXML(checkout, checkoutPath);
                %>
                <input class="button" type="submit" value="Create Booking">

            </form>
            <%}%>
        </div>

        <% if (user != null) {
                session.setAttribute("user", user);
            } else if (tutor != null) {
                session.setAttribute("tutor", tutor);
            }
        %>
    </body>
</html>
