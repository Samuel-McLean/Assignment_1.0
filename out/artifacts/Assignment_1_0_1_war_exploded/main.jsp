<%@page import="java.util.ArrayList"%>
<%@page import="uts.checkout.*"%>
<%@page import="uts.user.*" contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <title>Main Page</title>
    </head>
    <body>
        <%User user = (User)session.getAttribute("user");%>
        <div class="user_banner">&emsp; You are logged in as <%=user.getName()%> &emsp;|&emsp; Email: <%=user.getEmail()%></div>
        <div class="right_align_main"><a class="logout" href="logout.jsp">Logout</a></div>
        
        <% String ordersPath = application.getRealPath("WEB-INF/history.xml");%>
        <jsp:useBean id="ordersApp" class="uts.checkout.OrderApplication" scope="application">
            <jsp:setProperty name="ordersApp" property="filePath" value="<%=ordersPath%>"/>
        </jsp:useBean>
        
        <% String userPath = application.getRealPath("WEB-INF/users.xml");%>
        <jsp:useBean id="userApp" class="uts.user.UserApplication" scope="application">
            <jsp:setProperty name="userApp" property="filePath" value="<%=userPath%>"/>
        </jsp:useBean> 
        
        <div><br><u><a class="index_page" href="index.jsp">Index Page</a></u> &emsp;</div>
        
        <%Users users = userApp.getUsers();%>
        <%if (user == null){response.sendRedirect("login.jsp");}%>     
        <%Orders orders = ordersApp.getOrders();%>
        <%
            //not sure if username is good enough unique identifier for an order, email would be better.
            ArrayList<Order> usersOrders = orders.getUserOrders(user.getEmail(), user.getName());
            boolean hasOrder = false;
            if(usersOrders != null && !usersOrders.isEmpty()){
                hasOrder = true;
            }
        %>
        <div class="center_align">
            <div class="center_align_inner">
                <h1>Order History <%if(!hasOrder){out.print("is Empty!");%></h1>
                 <table>
                    <tr><td><u><a class="cancel" href="cancel.jsp">Cancel Order</a></u> &emsp; <u><a class="account" href="account.jsp">Account Settings</a></u> &emsp;</tr> 
                </table>      
                 <%="Your orders will show below when you have made some."%><%}%>
                <div><%//<jsp:include page="history.jsp" flush="true" />%></div> 
                <br><br>
            </div>
        </div>
    </body>
</html>