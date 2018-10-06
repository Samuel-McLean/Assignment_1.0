<%@page import="uts.tutor.Tutor"%>
<%@page import="uts.student.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.booking.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
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
        <%Bookings bookings = bookingApp.getBookings();%>
        <%
            ArrayList<Booking> userList = new ArrayList();
            Student student = (Student) session.getAttribute("student");
            Tutor tutor = (Tutor) session.getAttribute("tutor");
            String log = "";
            String type = "";
            if (student != null) {
                log = " &lt " + student.getName() + " &gt";
                type = student.getType();
                userList = bookings.getUserBookings(bookings.getList(), student.getName());
            } else if (tutor != null) {
                log = " &lt " + tutor.getName() + " &gt";
                type = tutor.getType();
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
