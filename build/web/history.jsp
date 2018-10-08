<%@page import="uts.user.User"%>
<%@page import="uts.tutor.Movie"%>
<%@page import="uts.student.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="styles.css">
        <script src="animation.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bookings Page</title>
    </head>
    <body onload="startTime()">
        <div >
            <span class="float">UTSTutor</span>  <span class="time" id="time" ></span>
        </div>

        <% String bookingsPath = application.getRealPath("WEB-INF/bookings.xml");%>        
        <jsp:useBean id="bookingApp" class="uts.booking.BookingApplication" scope="application">
            <jsp:setProperty name="bookingApp" property="filePath" value="<%=bookingsPath%>"/>
        </jsp:useBean>
        <%Booking booking = bookingApp.getBookings();%>
        <%
            ArrayList<Booking> userList = new ArrayList();
            User user = (User) session.getAttribute("user");
            Movie movie = (Movie) session.getAttribute("movie");
            String log = "";
            String type = "";
            if (user != null) {
                log = " &lt " + user.getName() + " &gt";
                type = user.getType();
                userList = bookings.getUserBookings(bookings.getList(), user.getName());
            } else if (movie != null) {
                log = " &lt " + movie.getName() + " &gt";
                type = movie.getType();
                 userList = bookings.getUserBookings(bookings.getList(), tutor.getName());
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
                if (bookings.getList().size() > 0) {
                    bookings.printBookings(userList, out);
                    userList=null;
                }
            %>   
        </form>          
    </body>
</html>
