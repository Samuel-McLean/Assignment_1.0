<%@ page language="java" import="uts.user.*" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/demo.css">
        <title>Edit</title>
    </head>
    <body style="background://add background;">
        <% String filePath = application.getRealPath("WEB-INF/users.xml");%>

        <jsp:useBean id="" class="uts.controller.UserApplication" scope="application">
            <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        
        <%Users users = userAcc.getUsers(); %> 
        <%
            User user = (User) session.getAttribute("user");
            users.removeUser(user());
        %>

        <p class="formHeader">ACCOUNT SETTINGS</p>

        <form method="post" action="welcome.jsp">
            <table class="table">
                <tr><td>Full name</td><td><input type="text" name="name" size="25" value="<%=user.getName()%>"></td></tr>
                <tr><td>Password</td><td><input type="password" name="password" size="25" value="<%=user.getPassword()%>"></td></tr>
                <tr><td>D.O.B.</td><td><input type="text" name="dob" size="25" value="<%=user.getDOB()%>"></td></tr>
                <tr><td>Address</td><td><input type="text" name="address" size="25" value="<%=user.getAddress()%>"></td></tr>
                <tr><td>Phone Number</td><td><input type="text" name="phone" size="25" value="<%=user.getPhoneNum()%>"></td></tr>
                <tr><td></td><td><input type="submit" value="Save" class="button"></td></tr>
            </table>     
            <%
                session.setAttribute("user", user);
                users.addUser(user);
                userAcc.updateXML(users, filePath);
            %>
        </form>
    </body>
</html>