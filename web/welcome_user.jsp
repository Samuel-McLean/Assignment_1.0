<%@page import="uts.movie.user.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Welcome User</title>
    </head>     
    <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
    <jsp:useBean id="userApp" class="uts.movie.user.UserApplication" scope="application">
        <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    <%Users users = userApp.getUsers();%>
    <% User user = (User) session.getAttribute("user");  %>
    <body >        
        <%           
            session.setAttribute("user", user);
            users.addUser(user);
            userApp.updateXML(users, filePath);
            response.sendRedirect("main.jsp");
        %>       
    </body>
</html>
