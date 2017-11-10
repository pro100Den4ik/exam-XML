<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/" xmlns:x="x-schema:xdr_schema.xml">
    <html>
      <body>
        <h1>Object's</h1>
        <table border="1">
          <tr border="1">
            <th style="color:blue">id</th>
            <th style="color:blue">type</th>
            <th style="color:blue">name</th>
            <th style="color:blue">address</th>
            <th style="color:blue">date-build</th>
            <th style="color:blue">description</th>
            <th style="color:blue">cost</th>
            <th style="color:blue">currency</th>
          </tr>
          <xsl:for-each select="x:body/x:obj">
            <xsl:sort select="x:date_build/x:year" order="descending"/>
            <xsl:sort select="x:date_build/x:month" order="descending"/>
            <xsl:sort select="x:date_build/x:day" order="descending"/>
            <xsl:sort select="x:description/x:num_rooms" order="descending"/>
            <tr>
              <td>
                <xsl:value-of select="@id"/>
              </td>
              <td>
                <xsl:value-of select="@type"/>
              </td>
              <td>
                <xsl:value-of select="x:name"/>
              </td>
              <td>
                <xsl:value-of select="x:address"/>
              </td>
              <td>
                <xsl:if test="x:date_build/x:year != 0">
                  <xsl:value-of select="x:date_build/x:day"/>.<xsl:value-of select="x:date_build/x:month"/>.<xsl:value-of select="x:date_build/x:year"/>г.
                </xsl:if>
              </td>
              <td>
                <xsl:if test="x:description/x:num_rooms != 0">
                  Num rooms: <xsl:value-of select="x:description/x:num_rooms"/><br />
                </xsl:if>
                <xsl:if test="x:description/x:num_floor != 0">
                  Num floor: <xsl:value-of select="x:description/x:num_floor"/><br />
                </xsl:if>
                <xsl:if test="x:description/x:size != 0">
                  Size: <xsl:value-of select="x:description/x:size"/>
                </xsl:if>
              </td>
              <td>
                <xsl:value-of select="x:cost"/>
              </td>
              <td>
                <xsl:value-of select="x:cost/@currency"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>