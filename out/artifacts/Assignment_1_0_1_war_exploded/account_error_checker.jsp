<%-- 
    Document   : account_error_checker
    Created on : 10/10/2018, 6:13:03 PM
    Author     : Sam
--%>

<%@page import="uts.user.User"%>
<%@page import="uts.user.Users"%>
<%@page import="uts.controller.Validator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Error Checker</title>
    </head>
    <% String filePath = application.getRealPath("WEB-INF/users.xml");%>

    <jsp:useBean id="userApp" class="uts.user.UserApplication" scope="application">
        <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    <%Users users = userApp.getUsers(); %>
    <body>
        <%
            User user = (User) session.getAttribute("user");
            
            String name = request.getParameter("name");
            String password= request.getParameter("password");
            String email= request.getParameter("email");
            String address= request.getParameter("address") + "";
            String phoneNumber= request.getParameter("phoneNumber") + "";
            String dob = request.getParameter("dateOfBirth") + "";
            Validator validator = new Validator();

            if(validator.validateUser(name, email, password) && users.exist(user) && user != null){
                userApp.editUser(user, name, email, password, phoneNumber, address, dob);
                session.setAttribute("updateSuccessful", "User Details Updated.");
            } 
            else {
                    if (!validator.validateEmail(email)) {
                        session.setAttribute("errEmail", " Email is invalid!");
                    }
                    if (!validator.validateName(name)) {
                        session.setAttribute("errName", " Name is invalid!");
                    }
                    if (!validator.validatePassword(password)) {
                        session.setAttribute("errPassword", " Password is invalid!");
                    }
                }      
            response.sendRedirect("account.jsp");
        %>
    </body>
</html>
