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
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phoneNumber = request.getParameter("phoneNumber");
            String address = request.getParameter("address");
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
