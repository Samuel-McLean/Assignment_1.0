<%@page import="uts.checkout.*"%>
<%@page import="uts.movie.*"%>
<%@page import="uts.user.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <title>Index</title>
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
        <%//may need to delete stuff above this. not sure if this is relevent to this page at all...
            User user = (User) session.getAttribute("user");
            boolean hasUser = false;
            if(user != null){
                hasUser = true;
            }
        %>
        
        <% if(hasUser) {
                session.setAttribute("user", user);
        %>
        <div class="user_banner">&emsp; You are logged in as <%=user.getName()%> &emsp;|&emsp; Email: <%=user.getEmail()%></div>
        <h2>Index Page</h2>
        <div class="right_align"><u><a class="logout" href="logout.jsp">Logout</a></u>&emsp;</div>
        <div><u><a class="account" href="account.jsp">Account</a></u>&emsp; <u><a class="index_page" href="main.jsp">Main</a></u>&emsp;</div>
        
        <div><jsp:include page="movie_search.jsp" flush="true" /> </div>  
        <br><br>
        <div><jsp:include page="results.jsp" flush="true" /> </div> 
        <%} else {%>
        <h2>Index Page</h2>
        <table>
            <tr><td><u><a class="login" href="login.jsp">Login</a></u> &emsp;</tr>            
        </table>
        <div><jsp:include page="movie_search.jsp" flush="true" /> </div>  
        <br><br>
        <div><jsp:include page="results.jsp" flush="true" /> </div>  
          
        <%}%>
    </body>
</html>

