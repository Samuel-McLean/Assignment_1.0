<%@page import="uts.user.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <title>My Account</title>
    </head>
    <% String filePath = application.getRealPath("WEB-INF/users.xml");%>

        <jsp:useBean id="userApp" class="uts.user.UserApplication" scope="application">
            <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        <%Users users = userApp.getUsers(); %>
    <body>
        
        <h1>
            My Account
        </h1>
        
        <%
            User user = (User) session.getAttribute("user");
            if(request.getParameter("name") != null){
                String name = request.getParameter("name");
                String password= request.getParameter("password");
                String email= request.getParameter("email");
                String address= request.getParameter("Address");
                String phoneNumber= request.getParameter("PhoneNumber");
                user.setName(name);
                user.setPassword(password);
                user.setEmail(email);
                user.setPhoneNumber(phoneNumber);
                
        %>
        
        <p>
            Details updated.
        </p>
        
        <%  
            }
        %>
        
        <form action="account.jsp" method="POST">
            <table>
                <tr><td>Full name</td><td><input type="text" name="name" size="25" value="<%=user.getName()%>"></td></tr>   
                <tr><td>Email    </td><td><input type="text" name="email" size="25" value="<%=user.getEmail()%>"></td></tr>
                <tr><td>Password    </td><td><input type="password" name="password" size="25" value="<%=user.getPassword()%>"></td></tr>             
                <tr><td> Phone Number </td><td><input type="password" name="phoneNumber"</td><br></tr>
                <tr><td>Phone    </td><td><input type="text" name="phone" size="25" value="<%=user.getPhoneNumber()%>"></td></tr>
                <tr><td><input type="submit" value="update" name="update"/></td></tr>
                <tr><td><input type="cancel account" value="cancel" name="cancel"/>
                     <%
                         /** Needs to delete account from users.xml with OMS **/
                        if(request.getParameter("user")  != null){
                             user.getParentNode().removeChild(user);

                    %>     
                                <p> user removed</p>
                        <%}%>
                    </td>
                </tr>
                <tr><td><p>Return to the <a href="index.jsp">main page</a></p></td></tr>
            </table>
        </form>        
            <%
                session.setAttribute("user", user);
                users.addUser(user);
                userApp.updateXML(users, filePath);
            %>
    </body>
</html>
