<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>meteo</title>
            </head>
            <body>
                <xsl:for-each select="meteo/mesure ">
                    <ul> 
                        <li> Date mesure :<xsl:value-of select="@date" /></li>
                    </ul>
                    <table border="1" width="90%">
                        <tr>
                            <th>ville</th>
                            <th>temperature</th>
                        </tr>
                        
                        <xsl:for-each select="ville"> 
                            <tr>
                                <td><xsl:value-of select="@nom"/></td>
                                <td><xsl:value-of select="@temperature"/></td>
                            </tr>
                        </xsl:for-each> 
                        <tr>
                            <td>temperature moyenne </td>
                            <td> <xsl:value-of select="avg(ville/@temperature)"/></td>
                            
                        </tr>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>