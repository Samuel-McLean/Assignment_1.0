<%@page import="uts.controller.Validator"%>
<%@page import="java.util.Date"%>
<%@page import="uts.movie.user.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <title>My Account</title>
    </head>
    <% String filePath = application.getRealPath("WEB-INF/users.xml");%>

        <jsp:useBean id="userApp" class="uts.movie.user.UserApplication" scope="application">
            <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        <%Users users = userApp.getUsers(); %>
    <body>  
        <h1>My Account</h1>
        
        <%
            User user = (User) session.getAttribute("user");
            //use the code you already have, do this soon, before you forget.
            
            String errName = (String) session.getAttribute("errName");
            String errEmail = (String) session.getAttribute("errEmail");
            String errPassword = (String) session.getAttribute("errPassword");
            String updateSuccessful = (String) session.getAttribute("updateSuccessful");
            boolean noDOB = false;
            //you may need to create a page to handle the error results.
            String name = request.getParameter("name") + "";
            String password= request.getParameter("password") + "";
            String email= request.getParameter("email") + "";
            String address= request.getParameter("address") + "";
            String phoneNumber= request.getParameter("phoneNumber") + "";
            String dob = request.getParameter("dateOfBirth") + "";
        %>
        <p><%=updateSuccessful%></p>
        
        <form action="account_error_checker.jsp" method="POST">
            <table>
                <tr><td>Full name   </td><td><input type="text" name="name" size="25" value="<%=user.getName()%>"><%=errName%></td></tr>   
                <tr><td>Email       </td><td><input type="text" name="email" size="25" value="<%=user.getEmail()%>"><%=errEmail%></td></tr>
                <tr><td>Password    </td><td><input type="password" name="password" size="25" value="<%=user.getPassword()%>"><%=errPassword%></td></tr>             
                <tr><td>Phone Number</td><td><input type="text" name="phoneNumber" size="25" value="<%=user.getPhoneNumber()%>"/></td><br></tr>
                <tr><td>Address     </td><td><input type="text" name="address" size="25" value="<%=user.getAddress()%>"></td></tr>
                <tr><td>D.O.B.      </td><td><input type="date" name="dateOfBirth" size="25" value="<%if(user.getDateOfBirth() != null){out.print(user.dateToStringXML(user.getDateOfBirth())); noDOB = true;}%>"> <%if(!noDOB){out.print(" No Date of Birth Set! ");}%></td></tr>
                <tr><td><input type="submit" value="update" name="update"/></td></tr>
                <tr><td><a class="cancel_button" href="cancel_account.jsp"></a>
                     
                     <%
                         /** Needs to delete account from users.xml with OMS **/
        //use a seporate page of this, it will be called cancel_button and will use a javabean to appear on the page.
                    //this, to the best of my knowledge should be session. something or other...
                        if(request.getParameter("user")  != null){
                            //need to fix this...
                            //user.getParentNode().removeChild(user);

                    %>     
                                <p> user removed</p>
                        <%}%>
                    </td>
                </tr>
                <tr><td><p>Return to the <a href="main.jsp">main page</a></p></td></tr>
            </table>
        </form>        
            <%
                //users.addUser(user);
                //userApp.updateXML(users, filePath);
            %>
    </body>
</html>
