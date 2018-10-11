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
                <xsl select="catalog/cd">
                    <tr>
                        <td><xsl:value-of select="title"/></td>
                    <td><xsl:value-of select="genre"/></td>
                    <td><xsl:value-of select="releaseDate"/></td>
                    <td><xsl:value-of select="price"/></td>
                    <td><xsl:value-of select="availableCopies"/></td>
                    </tr>
                </c:set>

                <c:import url = "http://localhost:8080/style.xsl" var = "xslt"/>
                <x:transform xml = "${xmltext}" xslt = "${xslt}"/>

                </body>
                </html>