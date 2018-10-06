<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--
        this needs to be able to handle the login without the use of another page. 
    -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login</h1>
        <form action="loginAction.jsp" method="post">
            <table>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email"></td>
                </tr>
                <tr>  
                    <td>Password</td>
                    <td><input type="password" name="password"></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Login">
                    </td>
                </tr> 
            </table>
        </form>           
    </body>
</html>