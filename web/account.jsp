<<<<<<< HEAD
<%@page import="uts.wsd.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Account</title>
    </head>
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
                user.setAddress(Address);
                user.setPhoneNumber(PhoneNumber);
                
        %>
        
        <p>
            Details updated.
        </p>
        
        <%  
            }
        %>
        
        <form action="edit_user.jsp" method="POST">
            <table>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name"<br></td>
                </tr>
                
                <tr>
                    <td>Password </td>
                    <td><input type="text" name="password"<br></td>
                </tr>
                
                <tr>
                    <td> Email </td>
                    <td><input type="password" name="email"</td><br>
                </tr>
                
                <tr>
                    <td> Address </td>
                    <td><input type="password" name="adress"</td><br>
                </tr>
                
                <tr>
                    <td> Phone Number </td>
                     <td><input type="password" name="phoneNumber"</td><br>
                </tr>

                <tr>    
                    <td>
                    <input type="submit" value="update" name="update"/>
                    </td>

                </tr>

                <tr>    
                    <td>
                    <input type="cancel account" value="cancel"name="cancel"/>
                    /** Needs to delete account from users.xml with OMS **/
                     <%
                     User user = (User) session.getAttribute("user");
                     if(request.getParameter(user)  != null){
                          user.getParentNode().removeChild(user);
         
%>     
  <p> user removed</p>
  <%}%>

                    </td>
                </tr>
                
                <tr>
                    <td>
                        <p>
                            Return to the <a href="index.jsp">main page</a>
                        </p>
                    </td>
                </tr>
                
                
                
            </table>
        </form>
        
        
=======
<%@ page language="java" import="uts.user.*" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script type="text/javascript" src="js/animation.js"></script>
        <link rel="stylesheet" type="text/css" href="css/demo.css">
        <title>Edit</title>
    </head>
    <body style="background:none transparent;">
        <% String filePath = application.getRealPath("WEB-INF/users.xml");%>

        <jsp:useBean id="userApp" class="uts.user.UserApplication" scope="application">
            <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        <%Users users = userApp.getUsers(); %>
        <%
            User user = (User) session.getAttribute("user");
            //WHY ARE WE DELETING USERS ON THE ACCOUNT PAGE???
            //users.removeUser(users.getUser(user.getEmail()));
        %>

        <p class="form_title">My Account</p>

        <form method="post" action="welcome.jsp">
            <table class="table">
                <tr><td>Full name</td><td><input type="text" name="name" size="25" value="<%=user.getName()%>"></td></tr>
                <tr><td>Email    </td><td><input type="text" name="email" size="25" value="<%=user.getEmail()%>"></td></tr>
                <tr><td>Password    </td><td><input type="password" name="password" size="25" value="<%=user.getPassword()%>"></td></tr>
                <tr><td>Phone    </td><td><input type="text" name="phone" size="25" value="<%=user.getPhoneNumber()%>"></td></tr>
                <tr><td></td><td><input type="submit" value="Save" class="button"></td></tr>
            </table>
            <%
                session.setAttribute("user", user);
                users.addUser(user);
                userApp.updateXML(users, filePath);
            %>
        </form>
>>>>>>> 8b7d559059345a47b7a9824a822e06b030e26f78
    </body>
</html>
