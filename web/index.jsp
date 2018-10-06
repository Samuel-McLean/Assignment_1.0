<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String filePath = application.getRealPath("WEB-INF/movies.xml"); %>
<jsp:useBean id="moviesApp" class="uts.wsd.MoviesApplication" scope="application">
    <jsp:setProperty name="MoviesApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Page</title>
    </head>
    <body>
        <%
            
            Movies movies = moviesApp.getMovies();
            Genre genre = movies.getGenre(request.getParameter("genre"));
            String title = request.getParameter("title");
            String dateUpper = request.getParameter("dateUpper");
            String dateLower = request.getParameter("dateLower");
            try{
            User user = (User) session.getAttribute("user");
        %>
        <h1>Home Page</h1>
        <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are logged in as</div>
        <!--//search box//-->
         <!--// Search for Genre + Title 
        // IF statement required-->
         <div>
             <jsp:include page="search_dates.jsp" flush="true"/> 
         </div>
         <div>
             <jsp:include page="search_genre" flush="true"/>
         </div>
         
         <div>
             <jsp:include page="search_title" flush="true"/>
         </div>
        
        <%if (dateUpper != null && dateLower != null) {%>
        <p>Here are the movies matching your request between <%=dateLower%> and <%=dateUpper%>:</p>
        <%
            // in here you put the results for the dates.
            
        %>
        
        <!--here you present it in html and make it able to be placed into the checkout-->
        
        <%} else if (genre != null) {%>
        <p>Here are the movies matching your request for genre <%=genre%>: </p>
        <%
            // in here you put the results for the genre.
            ArrayList<Movie> genreMovies = new ArrayList<Movie>();
            genreMovies = moviesApp.getMovies().getMoviesByGenre(genre);
        %>
        
        <!--here you present it in html and make it able to be placed into the checkout-->
        
        <%} else if (title != null) {%>
        <p>Here are the movies matching your request for the title <%=title%></p>
        <%
            // in here you put the results for the title.
            
        %>
        
        <div>
            <jsp:include page="movie_search.jsp" flush="true"/>
        </div>    
        
        <!--here you present it in html and make it able to be placed into the checkout-->
        
        <%}%>
        
        <%} catch(Exception e) {%>

       
        <h1>Home Page</h1>
        <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are not logged in </div>
        <!--//search box//-->
         <!--// Search for Genre + Title 
        // IF statement required-->
         <div>
             <jsp:include page="search_dates.jsp" flush="true"/> 
         </div>
         <div>
             <jsp:include page="search_genre" flush="true"/>
         </div>
         
         <div>
             <jsp:include page="search_title" flush="true"/>
         </div>
        
        <%if (dateUpper != null && dateLower != null) {%>
        <p>Here are the movies matching your request between <%=dateLower%> and <%=dateUpper%>:</p>
        <%
            // in here you put the results for the dates.
            
        %>
        
        <!--here you present it in html and make it able to be placed into the checkout-->
        
        <%} else if (genre != null) {%>
        <p>Here are the movies matching your request for genre <%=genre%>: </p>
        <%
            // in here you put the results for the genre.
            ArrayList<Movie> genreMovies = new ArrayList<Movie>();
            genreMovies = moviesApp.getMovies().getMoviesByGenre(genre);
        %>
        
        <!--here you present it in html and make it able to be placed into the checkout-->
        
        <%} else if (title != null) {%>
        <p>Here are the movies matching your request for the title <%=title%></p>
        <%
            // in here you put the results for the title.
            
        %>
        
        <div>
            <jsp:include page="movie_search.jsp" flush="true"/>
        </div>    
        
        <!--here you present it in html and make it able to be placed into the checkout-->
        
        <%}}%>
           
    </body>
</html>
