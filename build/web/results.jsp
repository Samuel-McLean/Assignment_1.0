<%@page import="uts.movie.*" import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="styles.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <% String moviePath = application.getRealPath("WEB-INF/movies.xml");%>
        <jsp:useBean id="moviesApp" class="uts.movie.MoviesApplication" scope="application">
            <jsp:setProperty name="moviesApp" property="filePath" value="<%=moviePath%>"/>
        </jsp:useBean>
        <br><br>
        <%Movies movies = moviesApp.getMovies();%>
        <%

            String search = request.getParameter("search");
            String search2 = request.getParameter("search2");
            String endDate = request.getParameter("endDate");
            String startDate = request.getParameter("startDate");
            if(search != null && !search.equals("")){
                ArrayList<Movie> returnedMovies = movies.findMovieGenre(search);
                if (returnedMovies.size() > 0) {
                    movies.print(returnedMovies, out);
                }
            } else if(search2 != null && !search2.equals("")){
                ArrayList<Movie> returnedMovies = movies.findMovieTitle(search2);
                if (returnedMovies.size() > 0) {
                    movies.print(returnedMovies, out);
                }
            } else if(startDate != null && endDate != null && !startDate.equals("") && !endDate.equals("")){
                ArrayList<Movie> dateMovies = movies.findMovieByDate(startDate, endDate);
                if (dateMovies.size() > 0) {
                    movies.print(dateMovies, out);
                } 
            }
        %>
    </body>
</html>