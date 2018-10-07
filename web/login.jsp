<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--
        this needs to be able to handle the login without the use of another page. 
    -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <title>Login</title>
    </head>
    <body>
        <%  String existErr = (String) session.getAttribute("existErr");%>
        <h1>Login</h1>
        <%
            String emailErr = (String) session.getAttribute("emailErr");
            String passwordErr = (String) session.getAttribute("passwordErr");
        %>
        <form action="loginAction.jsp" method="post">
            <table>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email" required="true"></td>
                    
                </tr>
                <tr>  
                    <td>Password</td>
                    <td><input type="password" name="password" required="true"></td>
                    <td><span class="validity" ><c:if test="${emailErr!=null}"><c:out value="${emailErr}"/></span></c:if></td>
                </tr>
                <tr>
                    <td><input type="submit" class="button_login" value="Login">&emsp;&emsp;</td>
                    <td><u><a class="link_buttons" href="register.jsp">Register</a></u>&emsp;&nbsp; <u><a class="link_buttons" href="index.jsp">Back</a></u></td>
                </tr> 
            </table>
        </form>
        <%
            session.invalidate();
        %>
    </body>
</html>