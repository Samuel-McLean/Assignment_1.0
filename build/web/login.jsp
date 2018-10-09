<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--
        this needs to be able to handle the login without the use of another page.
    -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
        <title>Login</title>
    </head>
    <body>
        <%  String existErr = (String) session.getAttribute("existErr");%>
        <div class="center_align">
            <div class="center_align_inner">
                <h1>Login</h1>
            </div>
        </div>
        <p class="right_side"><span style="font-family: Lucida Sans Unicode">Don't have an account? </span><u><a class="link_buttons" href="register.jsp">Register</a></u></p>
        <%
            String emailErr = (String) session.getAttribute("emailErr");
            String passwordErr = (String) session.getAttribute("passwordErr");
        %>
        <form action="loginAction.jsp" method="post">    
            <div class="center_align">
                <div class="center_align_inner">
                    <table>
                        <tr>
                            <td>Email:&emsp;&emsp;&emsp;&emsp;<input type="email" name="email" required="true"></td>
                            <td><span class="validity" ><c:if test="${emailErr!=null}"><c:out value="${emailErr}"/></span></c:if></td>
                        </tr>
                        <tr>  
                            <td>Password:&emsp;&emsp;<input type="password" name="password" required="true"></td>
                            <td><span class="validity" ><c:if test="${passwordErr!=null}"><c:out value="${passwordErr}"/></span></c:if></td>
                        </tr>
                        <tr>
                            <td><u><a class="link_buttons" id="back_but" href="index.jsp">Back</a></u><input type="submit" class="button_login" value="Login"></td>
                        </tr> 
                    </table>
                </div>
            </div>
        </form>
        <%
            session.invalidate();
        %>
    </body>
</html>