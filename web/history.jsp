<%@page import="uts.movie.*"%>
<%@page import="uts.movie.user.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.movie.checkout.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="styles.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bookings Page</title>
    </head>
    <body onload="startTime()">
        <div >
            <span class="float">UTSTutor</span>  <span class="time" id="time" ></span>
        </div>

        <% String bookingsPath = application.getRealPath("WEB-INF/bookings.xml");%>        
        <jsp:useBean id="bookingApp" class="uts.movie.checkout.OrderApplication" scope="application">
            <jsp:setProperty name="bookingApp" property="filePath" value="<%=bookingsPath%>"/>
        </jsp:useBean>
<<<<<<< HEAD
        <%Booking booking = bookingApp.getBookings();%>
=======
        <%checkout c1 = checkoutApplication.getCheckout();%>
>>>>>>> 8b7d559059345a47b7a9824a822e06b030e26f78
        <%
            ArrayList<checkout> userList = new ArrayList();
            User user = (User) session.getAttribute("user");
            Movie movie = (Movie) session.getAttribute("movie");
            String log = "";
            String type = "";
            if (user != null) {
                log = " &lt " + user.getName() + " &gt";
                type = user.getType();
                userList = checkout.getUserBookings(checkouts.getList(), user.getName());
            } else if (movie != null) {
                log = " &lt " + movie.getName() + " &gt";
                type = movie.getType();
                 userList = checkout.getUserBookings(checkout.getList(), movie.getName());
            } else {
                log = " &lt " + " Unkonwn User " + " &gt";
            }
            
        %>
        <h2 class="header"><%=type%> Bookings</h2>
        <table class="main_table" >
            <tr ><td align="right" class="log" >You are logged in as  <%=log%></td></tr>
            <tr><td align="right"><u><a  class="link" href="bookings.jsp">View All</a></u> &emsp;<u><a  class="link" href="main.jsp">Main</a></u> &emsp;<u><a  class="link" href="edit_user.jsp">Account</a></u> &emsp; <u><a class="link" href="logout.jsp">Logout</a></u>&emsp; </td></tr>
        </table>
        <form>
            <%
                if (checkout.getList().size() > 0) {
                    checkout.printBookings(userList, out);
                    userList=null;
                }
            %>   
        </form>          
    </body>
</html>
