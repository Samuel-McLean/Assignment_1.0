<%@page import="uts.movie.user.*"%>
<%@page import="uts.controller.Validator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validate User</title>
    </head>
    <body>
        <% String filePath = application.getRealPath("WEB-INF/users.xml");%>

        <jsp:useBean id="userApp" class="uts.user.UserApplication" scope="application">
            <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        <%
            Users users = userApp.getUsers();
            User user = (User) session.getAttribute("user");
            Validator validator = new Validator();

            String email = user.getEmail();
            String name = user.getName();
            String password = user.getPassword();
                      
            if (users.getUser(email) != null) {
                response.sendRedirect("register.jsp");
                session.setAttribute("userErr", "User is already registered!");
            }else{
            if (!validator.validateEmail(email)) {
                response.sendRedirect("register.jsp");
                session.setAttribute("emailErr", "Incorrect email format");
            } else if (!validator.validateName(name)) {
                response.sendRedirect("register.jsp");
                session.setAttribute("nameErr", "Incorrect name format");
            } else if (!validator.validatePassword(password)) {
                response.sendRedirect("register.jsp");
                session.setAttribute("passwordErr", "Incorrect password format");
            } else {
                session.setAttribute("user", user);
                response.sendRedirect("welcome_user.jsp");
            }}

        %>

    </body>
</html>
