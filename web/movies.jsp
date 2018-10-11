<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml" %>

<html>
    <head>
        <title>Movies x:transform</title>
    </head>

    <body>
        <h3>Books Info:</h3>
        <c:set var = "xmltext">
            <h2>Movies Collection</h2>
            <table border="1">
                <tr bgcolor="#9acd32">
                    <th>Title</th>
                    <th>Genre</th>
                    <th>ReleaseDate</th>
                    <th>Price</th>
                    <th>AvailableCopies</th>
                </tr>
            </table>
<<<<<<< HEAD
        <xsl select="movies">
            
        </xsl>

         </c:set>

                <c:import url = "WEB-INF/wsdl/movies.xml" var = "xslt"/>
                <c:import url = "WEB-INF/wsdl/movies.xml" var = "xslt"/>
                <x:transform xml = "${movies.xml}" xslt = "${movies.xsl}"/>

    </body>
=======

                </c:set>

                <c:import url = "WEB-INF/wsdl/movies.xsl" var = "xslt"/>
                <c:import url = "WEB_INF/wsdl/movies.xml" var = "xslt"/>
                <x:transform xml = "${xml}" xslt = "${xslt}">

                    <x:transform/>          
                    </body>
>>>>>>> fc732612118eb03c9601fc88990523323da84e2f
</html>