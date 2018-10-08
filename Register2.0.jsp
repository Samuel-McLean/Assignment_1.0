<%@ page language="java" import="uts.wsd.*" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script type="text/javascript" src="js/animation.js"></script>
        <link rel="stylesheet" type="text/css" href="css/demo.css">
        <title>Edit</title>
    </head>
    <body style="background:none transparent;">
        <% String filePath = application.getRealPath("WEB-INF/users.xml");%>

        <jsp:useBean id="userApp" class="uts.controller.UserApplication" scope="application">
            <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        <%Users users = userApp.getUsers(); %>
        <%
            User user = (User) session.getAttribute("user");
            users.deleteUser(user.getEmail());
        %>

        <p class="form_title">My Account</p>

        <form method="post" action="welcome.jsp">
            <table class="table">
                <tr><td>Full name</td><td><input type="text" name="name" size="25" value="<%=user.getName()%>"></td></tr>
                <tr><td>Email    </td><td><input type="text" name="email" size="25" value="<%=user.getEmail()%>"></td></tr>
                <tr><td>Password    </td><td><input type="password" name="password" size="25" value="<%=user.getPassword()%>"></td></tr>
                <tr><td>Phone    </td><td><input type="text" name="phone" size="25" value="<%=user.getPhone()%>"></td></tr>
                <tr><td></td><td><input type="submit" value="Save" class="button"></td></tr>
            </table>
            <%
                session.setAttribute("user", user);
                users.addUser(user);
                userApp.updateXML(users, filePath);
            %>
        </form>



    </body>
</html>