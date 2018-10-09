<%@page import="java.util.ArrayList"%>
<%@page import="uts.checkout.*"%>
<%@page import="uts.user.*" contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <title>Main Page</title>
    </head>
    <body>
        <%User user = (User)session.getAttribute("user");%>
        <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are logged in as<%=user.getName()%> &lt; <%=user.getEmail()%>&gt;</div>
        
        <% String ordersPath = application.getRealPath("WEB-INF/history.xml");%>
        <jsp:useBean id="ordersApp" class="uts.checkout.CheckoutApplication" scope="application">
            <jsp:setProperty name="ordersApp" property="filePath" value="<%=ordersPath%>"/>
        </jsp:useBean>
        
        <% String userPath = application.getRealPath("WEB-INF/users.xml");%>
        <jsp:useBean id="userApp" class="uts.user.UserApplication" scope="application">
            <jsp:setProperty name="userApp" property="filePath" value="<%=userPath%>"/>
        </jsp:useBean> 
        
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
        <h1>Order History <%if(!hasOrder){out.print("is Empty!");%></h1>
         <table>
            <tr><td><u><a class="cancel" href="cancel.jsp">Cancel Order</a></u> &emsp;</tr> 
            <tr><td><u><a class="account" href="account.jsp">Account Settings</a></u> &emsp;</tr> 
        </table>      
         <%="Your orders will show below when you have made some."%><%}%>
        <div><%//<jsp:include page="history.jsp" flush="true" />%></div> 
        <br><br>
    </body>
</html>