<%@page import="uts.checkout.*"%>
<%@page import="uts.movie.*"%>
<%@page import="uts.user.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <title>Index</title>
        <style>
        body 
        {
            background-color: lightBlue;
        }
        </style>
    </head>
    <body>
        <% String moviesPath = application.getRealPath("WEB-INF/movies.xml");%>
        <jsp:useBean id="moviesApp" class="uts.movie.MoviesApplication" scope="application">
            <jsp:setProperty name="moviesApp" property="filePath" value="<%=moviesPath%>"/>
        </jsp:useBean>
        <% String userPath = application.getRealPath("WEB-INF/users.xml");%>
        <jsp:useBean id="userApp" class="uts.user.UserApplication" scope="application">
            <jsp:setProperty name="userApp" property="filePath" value="<%=userPath%>"/>
        </jsp:useBean>
        <%Movies movies = moviesApp.getMovies();%>
        <%Users users = userApp.getUsers();%>
        <%
            User user = (User) session.getAttribute("user");
            boolean hasUser = false;
            if(user != null){
                hasUser = true;
            }
        %>
        <h2>Index Page</h2>
        <% if(!hasUser) {
                session.setAttribute("user", user);
        %>
        <table>
            <tr><td align="right"><u><a href="login.jsp">Login</a></u> &emsp;</tr>            
        </table>
        <div><jsp:include page="search_dates.jsp" flush="true" /> </div>    
        <div><jsp:include page="search_genre.jsp" flush="true" /> </div> 
        <div><jsp:include page="search_title.jsp" flush="true" /> </div> 
        <div><jsp:include page="movie_search.jsp" flush="true" /> </div>  
        <%} else {%>
        <table>
            <tr><u><a href="edit_user.jsp">Account</a></u> &emsp; <u><a href="logout.jsp">Logout</a></u>&emsp; </td></tr>            
        </table>
        <div><jsp:include page="search_dates.jsp" flush="true" /> </div>    
        <div><jsp:include page="search_genre.jsp" flush="true" /> </div> 
        <div><jsp:include page="search_title.jsp" flush="true" /> </div>       
        <div><jsp:include page="movie_search.jsp" flush="true" /> </div> 
        <%}%>
    </body>
</html>

