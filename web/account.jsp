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
        
        
    </body>
</html>
