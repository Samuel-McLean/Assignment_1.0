<%@page import="uts.user.*"%>
<%@page import="uts.controller.Validator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Action</title>
    </head>
    <body>
        <% String userPath = application.getRealPath("WEB-INF/users.xml");%>
        <jsp:useBean id="userApp" class="uts.user.UserApplication" scope="application">
            <jsp:setProperty name="userApp" property="filePath" value="<%=userPath%>"/>
        </jsp:useBean>
        <%Users users = userApp.getUsers();%>
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            User user = users.login(email, password);
            Validator validator = new Validator();
            if (!validator.validateEmail(email)) {
                response.sendRedirect("login.jsp");
                session.setAttribute("emailErr", "Incorrect email format");
            }else if (!validator.validatePassword(password)) {
                response.sendRedirect("login.jsp");
                session.setAttribute("passwordErr", "Incorrect password format");
            }else if (user != null) {
                session.setAttribute("user", user);
                response.sendRedirect("main.jsp");
            }else{
                response.sendRedirect("login.jsp");
                session.setAttribute("existErr", "User does not exist!");               
            }
        %>
        <%public Users fetchUsers(){
            return users;
}
}%>
    </body>
</html>
