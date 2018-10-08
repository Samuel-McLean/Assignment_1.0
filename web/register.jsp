<<<<<<< HEAD
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <title >Register Page</title>
    </head>
    <body>
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
    </body>
</html>