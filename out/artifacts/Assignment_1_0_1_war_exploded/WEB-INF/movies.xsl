<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>      
            <head>
                
            </head>     
            <body>
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>
    <xsl:template match="movies" >
        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Genre</th>
                    <th>Release Date</th>
                    <th>Price</th>
                    <th>Available Copies</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates />
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="book">
        <tr>
            <td>
                <xsl:value-of select="title"/>
            </td>
            <td>
                <xsl:value-of select="genre"/>
            </td>
            <td>
                <xsl:value-of select="releasedate" />
            </td>
            <td>
                <xsl:value-of select="price" />
            </td>
            <td>
                <xsl:value-of select="availblecopies" />
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>


