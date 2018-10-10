<%@page import="uts.controller.Validator"%>
<%@page import="java.util.Date"%>
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
        <h1>My Account</h1>
        
        <%
            User user = (User) session.getAttribute("user");
            String errName = "";
            String errEmail = "";
            String errPassword = "";
            if(request.getParameter("name") != null){
                String name = request.getParameter("name");
                String password= request.getParameter("password");
                String email= request.getParameter("email");
                String address= request.getParameter("address");
                String phoneNumber= request.getParameter("phoneNumber");
                String dob = request.getParameter("dateOfBirth");
                Validator validator = new Validator();
                if(validator.validateUser(name, email, password)){
                    user.setName(name);
                    user.setPassword(password);
                    user.setEmail(email);
                    user.setPhoneNumber(phoneNumber);
                    user.setAddress(address);
                    user.setDateOfBirth(user.stringToDate(dob));
                
        %>
        <p>Details updated.</p>
        <%} else{
                boolean emailValid = validator.validateEmail(email);
                boolean nameValid = validator.validateEmail(name);
                boolean passwordValid = validator.validateEmail(password);
                if(emailValid){errEmail = "Email is invalid!";}
                if(nameValid){errName = "Name is invalid!";}
                if(passwordValid){errPassword = "Password is invalid!";}
}}%>
        <form action="account.jsp" method="POST">
            <table>
                <tr><td>Full name   </td><td><input type="text" name="name" size="25" value="<%=user.getName()%>"><%=errName%></td></tr>   
                <tr><td>Email       </td><td><input type="text" name="email" size="25" value="<%=user.getEmail()%>"><%=errEmail%></td></tr>
                <tr><td>Password    </td><td><input type="password" name="password" size="25" value="<%=user.getPassword()%>"><%=errPassword%></td></tr>             
                <tr><td>Phone Number</td><td><input type="text" name="phoneNumber" size="25" value="<%=user.getPhoneNumber()%>"/></td><br></tr>
                <tr><td>Address     </td><td><input type="text" name="address" size="25" value="<%=user.getAddress()%>"></td></tr>
                <tr><td>D.O.B.      </td><td><input type="text" name="dateOfBirth" size="25" value="<%if(user.getDateOfBirth() != null){out.print(user.dateToStringXML(user.getDateOfBirth()));%>"> <%} else{out.print(" No Date of Birth Set!");}%></td></tr>
                <tr><td><input type="submit" value="update" name="update"/></td></tr>
                <tr><td><a class="cancel_button" href="cancel_account.jsp"></a>
                     
                     <%
                         /** Needs to delete account from users.xml with OMS **/
        //use a seporate page of this, it will be called cancel_button and will use a javabean to appear on the page.
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
                session.setAttribute("user", user);
                users.addUser(user);
                userApp.updateXML(users, filePath);
            %>
    </body>
</html>
