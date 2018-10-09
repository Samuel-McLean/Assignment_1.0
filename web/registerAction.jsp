<%@page import="uts.user.*"%>
<%@page import="uts.controller.Validator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Action</title>
    </head>
    <body>
        <%
            String fullName = (String) session.getAttribute("fullName");
            String email = (String) session.getAttribute("email");
            String password = (String) session.getAttribute("password");
            String phoneNumber = (String) session.getAttribute("phoneNumber");
            String address = (String) session.getAttribute("address");
            //need to complete...
            Validator validator = new Validator();
             
             if(validator.checkEmpty(email, fullName, password)){
                  response.sendRedirect("register.jsp");
                 session.setAttribute("userErr", "Please fill in empty fields!");
             }else{
                User user = new User(fullName, email, password, phoneNumber, address);
                session.setAttribute("user", user);
                response.sendRedirect("validate_user.jsp");
             }
        %>
    </body>
</html>
