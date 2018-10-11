<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
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
       </xsl>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
