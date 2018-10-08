<<<<<<< HEAD
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <script src="animation.js">
        </script>
        <title >Register Page</title>
    </head>
    <body onload="startTime()">
        <h2 class="header">Enter your details: <c:if test="${userErr!=null}"><span><c:out value="${userErr}"/></span></c:if></h2>
        
            <div class="div_form">
                <form class="form" method="post" action="register_action.jsp" >
                    <table class="table_register">
                        <tr><td>Full Name:</td><td><input style="width:238px;" type="text" name="fullName" required></td><td><span class="validity" ><c:if test="${fullName!=null}"><c:out value="${fullName}"/></span></c:if></td></tr>
                    <tr><td>Email:</td><td><input style="width:238px;" type="text" name="email" required ></td><td><span class="validity" ><c:if test="${email!=null}"><c:out value="${email}"/></span></c:if></td></tr>
                    <tr><td>Password :</td><td><input style="width:238px;" type="password" name="password" required></td><td><span class="validity" ></span><c:if test="${password!=null}"><span><c:out value="${password}"/></span></c:if></td></tr>
                        <tr><td>phoneNum :</td><td><input style="width:238px;" type="text" name="number" required></td><td><span class="validity" ></span><c:if test="${phoneNum!=null}"><span><c:out value="${phoneNum}"/></span></c:if></td></tr>
                        <tr><td>address :</td><td><input style="width:238px;" type="text" name="address" required></td><td><span class="validity" ></span><c:if test="${address!=null}"><span><c:out value="${address}"/></span></c:if></td></tr>
                        <tr><td>User:</td>
                            <td >
                                <select id="box1" name="type" onchange="handleSelect()"  style="width: 80px;" required><span class="validity" ></span>		    	    
                                    <option value="" required><span class="validity" ></span>	
                                    <option value="Student"> User
                                    <option value="Tutor"> Movie                            
                                </select>                               
                                Movie:                    
                                <select id="box2" name="movie" style="width: 80px;" required><span class="validity" ></span>		    	    
                                    <option value="" required><span class="validity" ></span>	
                                    <option value="Incredibles 2"> Incredibles 2
                                    <option value="The Dictator"> The Dictator         
                                    <option value="IT"> IT 
                                    <option value="Intellestar"> Intellestar   
                                </select>
                            </td>
                        </tr>
                        <tr><td></td><td><input class="button" style="width:80px;" type="submit" value="Register"> &emsp; &emsp;<u><a class="link" style="text-align: center" href="login.jsp">Login</a></u>&emsp;<u><a class="link" href="index.html"> back</a></u></td></tr>
                    </table>            
                </form>
            </div>
=======
<%@ page language="java" import="uts.user.*" contentType="text/html; charset=ISO-8859-1"
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

        <jsp:useBean id="userApp" class="uts.user.UserApplication" scope="application">
            <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        <%Users users = userApp.getUsers(); %>
        <%
            User user = (User) session.getAttribute("user");
            //WHY ARE WE DELETING USERS ON THE REGESTER PAGE???
            //users.removeUser(users.getUser(user.getEmail()));
        %>

        <p class="form_title">My Account</p>

        <form method="post" action="main.jsp">
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