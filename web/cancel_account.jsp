<%-- 
    Document   : cancel_account
    Created on : 10/10/2018, 1:50:51 PM
    Author     : Sam
--%>

<%@page import="uts.checkout.Orders"%>
<%@page import="uts.checkout.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.user.User"%>
<%@page import="uts.user.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Account</title>
    </head>
        <% String orderPath = application.getRealPath("WEB-INF/users.xml");%>

        <jsp:useBean id="orderApp" class="uts.checkout.OrderApplication" scope="application">
            <jsp:setProperty name="orderApp" property="filePath" value="<%=orderPath%>"/>
        </jsp:useBean>
        <%Orders orders = orderApp.getOrders(); %>
        
        <% String userPath = application.getRealPath("WEB-INF/users.xml");%>

        <jsp:useBean id="userApp" class="uts.user.UserApplication" scope="application">
            <jsp:setProperty name="userApp" property="filePath" value="<%=userPath%>"/>
        </jsp:useBean>
        <%Users users = userApp.getUsers(); %>
        <%User user = (User) session.getAttribute("user");%>
    <body>
        <%
            users.removeUser(user);
            userApp.updateXML(users, userPath);
            response.sendRedirect("logout.jsp");
        %>
    </body>
</html>
