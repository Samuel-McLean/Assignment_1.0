<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <title >Register Page</title>
    </head>
    <body>
        <%
            String emailErr = (String) session.getAttribute("emailErr");
            String passwordErr = (String) session.getAttribute("passwordErr");
            String nameErr = (String) session.getAttribute("nameErr");
            String phoneErr = (String) session.getAttribute("phoneErr");
            String addressErr = (String) session.getAttribute("addressErr");
            String userErr = (String) session.getAttribute("userErr");
        %>
        <div class="center_align">
            <div class="center_align_inner">
                <h2 class="header">Enter your details: <c:if test="${userErr!=null}"><span><c:out value="${userErr}"/></span></c:if></h2>
                <div class="div_form">
                    <form class="form" method="post" action="registerAction.jsp" >
                        <table class="table_register">
                        <tr><td>Full Name:</td><td><input type="text" name="fullName" required></td><td><span class="validity" ><c:if test="${nameErr!=null}"><c:out value="${nameErr}"/></span></c:if></td></tr>
                        <tr><td>Email:</td><td><input type="text" name="email" required ></td><td><span class="validity" ><c:if test="${emailErr!=null}"><c:out value="${emailErr}"/></span></c:if></td></tr>
                        <tr><td>Password:</td><td><input type="password" name="password" required></td><td><span class="validity" ></span><c:if test="${passwordErr!=null}"><span><c:out value="${passwordErr}"/></span></c:if></td></tr>
                        <tr><td>Phone Number:</td><td><input type="text" name="phoneNumber" required></td><td><span class="validity" ></span><c:if test="${phoneErr!=null}"><span><c:out value="${phoneErr}"/></span></c:if></td></tr>
                        <tr><td>Address:</td><td><input type="text" name="address" required></td><td><span class="validity" ></span><c:if test="${addressErr!=null}"><span><c:out value="${addressErr}"/></span></c:if></td></tr>
                        <tr><td></td><td><input class="login" type="submit" value="Register"> &emsp; &emsp;<u><a class="other_buttons" style="text-align: center" href="login.jsp">Login</a></u>&emsp;<u><a class="other_buttons" href="index.jsp"> Back</a></u></td></tr>
                        </table>            
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>