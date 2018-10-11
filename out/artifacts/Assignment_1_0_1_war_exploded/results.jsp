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
        <div class="center_align">
            <div class="center_align_inner">
            <%

                String genreSearch = request.getParameter("genre");
                String titleSearch = request.getParameter("title");
                String startDate = request.getParameter("startDate");
                String endDate = request.getParameter("endDate");
                if(genreSearch != null && !genreSearch.equals("")){
                    ArrayList<Movie> returnedMovies = movies.findMovieGenre(genreSearch);
                    if (returnedMovies.size() > 0) {
                        movies.print(returnedMovies, out);
                    }
                } else if(titleSearch != null && !titleSearch.equals("")){
                    ArrayList<Movie> returnedMovies = movies.findMovieTitle(titleSearch);
                    if (returnedMovies.size() > 0) {
                        movies.print(returnedMovies, out);
                    }
                } else if(startDate != null && endDate != null && !startDate.equals("") && !endDate.equals("")){
                    ArrayList<Movie> dateMovies = movies.findMovieByDate(startDate, endDate);
                    if (dateMovies.size() > 0) {
                        movies.print(dateMovies, out);
                    } 
                    
                }else{
                        out.print("No movies match your search");
                    }
            %>
            </div>
        </div>
    </body>
</html>