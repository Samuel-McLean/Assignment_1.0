<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
    <h2>Users Collection</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>FullName</th>
        <th>Email</th>
        <th>Password</th>
        <th>phoneNum</th>
        <th>address</th>
      </tr>
      <xsl select="catalog/cd">
        <tr>
          <td><xsl:value-of select="fullName"/></td>
          <td><xsl:value-of select="email"/></td>
          <td><xsl:value-of select="password"/></td>
          <td><xsl:value-of select="phoneNum"/></td>
          <td><xsl:value-of select="address"/></td>
        </tr>
      </xsl>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>

