<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Search Movies</title>
        <%//ADD JSP TO GET AN ERROR TO BE SENT OF THE USER SEARCHES FOR SOMETHING THAT IS NOT RETURNED%>
    </head>
    <body>
        <form action="index.jsp" id="Dates" method="post" target="_self">
            <h3 class="sub_heading">Search For Movies by:</h3>
            <table class="search_table" align="center">
                <tr>
                    <!--// Enter a date for the movie year?-->
                    <!-- Enter a date before 2018-01-01: -->
                    <td>Start Date:&nbsp;</td>
                    <td><input type="date" name="startDate" max="2018-01-01"></td>
                    <!-- Enter a date after 2000-01-01: -->
                    <td>&nbsp;End Date:&nbsp;</td>
                    <td><input type="date" name="endDate" min="2000-01-01"><input type="submit" class="button_styles" value="Search"/></td>
                </tr>
            </table>
        </form>
        <br>
        <form action="index.jsp" id="Genre" method="post" target="_self">
            <table class="search_table" id="text_search" align="center">
                <tr>
                    <td>Genre:</td>
                    <td><input type="text" name="genre"></td>
                    <td></td>
                    <td><input type="submit" class="button_styles" value="Search"/></td>
                </tr>
            </table>
        </form>
        <br>
        <form action="index.jsp" id="Title" method="post" target="_self">
            <table class="search_table" id="text_search" align="center">
                <tr>
                    <td>Title:&nbsp;&nbsp;</td>
                    <td><input type="text" name="title"></td>
                    <td></td>
                    <td><input type="submit" class="button_styles" value="Search"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>


