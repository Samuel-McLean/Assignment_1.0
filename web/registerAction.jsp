<%-- 
    Document   : registerAction
    Created on : 08/10/2018, 5:33:41 PM
    Author     : danyj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Register Action!</h1>
        <%
            String fullName = (String) session.getAttribute("fullName");
            String email = (String) session.getAttribute("email");
            String password = (String) session.getAttribute("password");
            String phoneNumber = (String) session.getAttribute("phoneNumber");
            String address = (String) session.getAttribute("address");
        %>
    </body>
</html>
