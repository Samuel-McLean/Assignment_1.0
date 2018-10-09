<%@page import="uts.movie.*"%>
<%@page import="uts.checkout.*"%> 
<%@page import="uts.user.*"%>
<%@page import="java.util.ArrayList"%>
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
        <% String orderPath = application.getRealPath("WEB-INF/orders.xml");%>
        <jsp:useBean id="ordersApp" class="uts.checkout.CheckoutApplication" scope="application">
            <jsp:setProperty name="ordersApp" property="filePath" value="<%=orderPath%>"/>
        </jsp:useBean>

        <%Movies movies = moviesApp.getMovies();%>
        <%Users users = userApp.getUsers();%>
        <%Orders orders = ordersApp.getOrders();%>
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
                String title = request.getParameter("");
                if (title != null) {
                    ArrayList<Movies> movieList = new ArrayList();
                    //need to put the title of the movie you are trying to checkout in getMovie(HERE, PUT IT HERE). 
                Movie orderMovie = movies.getMovie(title);
                movies.getList();
                    if (movieList.size() > 0) {
                        movies.print(movieList, out);
                    }
            %>
            <form class="checkout_form_div" method="post" action="main.jsp">
                <%
                    Movies.addOrder(new Movie(Order.getOrder, "isAvailable"));
                    checkoutApp.updateXML(checkout, checkoutPath);
                %>
                
               
                
                
                <input class="button" type="submit" value="Create Booking">

            </form>
            <%}%>
        </div>

        <% if (user != null) {
                session.setAttribute("user", user);
            } else if (order != null) {
                session.getAttribute("order", order);
            }
        %>
    </body>
</html>
