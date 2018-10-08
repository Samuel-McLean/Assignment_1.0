<%@page import="uts.student.*" contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <title>Main Page</title>
    </head>
    <body>
        <% 
            User user = (User)session.getAttribute("user");
        %>
        <h1>Order History</h1>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are logged in as<%=user.getName()%> &lt; <%=user.getEmail()%>&gt;</div>
         
        
        
        <p align="right"> <a href="CancelOrder.jsp">Cancel Order</a></p>
        <p align="right"> <a href="accountSettings.jsp">Account Settings</a></p>
        
    </body>
</html>
