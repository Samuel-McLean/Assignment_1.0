<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Movies</title>
    </head>
    <body>
        <form action="index.jsp" method="post" target="_self">
        <p>Search by dates:</p>
            <table>
                <tr>
                    <!--// Enter a date for the movie year?-->
                    <!-- Enter a date before 2018-01-01: -->
                    <td>Start Date:&nbsp;</td>
                    <td><input type="date" name="startDate" max="2018-01-01"></td>
                    <!-- Enter a date after 2000-01-01: -->
                    <td>&nbsp;End Date:&nbsp;</td>
                    <td><input type="date" name="endDate" min="2000-01-01">&nbsp;&nbsp;</td>
                    <td><input type="submit" value="Search"/></td>
                </tr>
            </table>
        <br>
            <table>
                <tr>
                    <td>Genre of Movie:</td>
                    <td><input type="text" name="search"></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td><input type="submit" value="Search"/></td>
                </tr>
            </table>
        <br>
            <table>
                <tr>
                    <td>Title of Movie:&nbsp;&nbsp;</td>
                    <td><input type="text" name="search2"></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td><input type="submit" value="Search"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>


