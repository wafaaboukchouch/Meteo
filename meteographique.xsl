<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0">
    
    <xsl:template match="/">
        <html>
            <body>
                <h2 style="color:blue; text-align:center;">
                    Graphiques des températures
                </h2>
                <xsl:for-each select="meteo/mesure">
                    <div style="margin-bottom:40px;">
                        <h3 style="color:orange; text-align:center;">
                            <xsl:value-of select="normalize-space(@date)"/>
                        </h3>
                        <svg xmlns="http://www.w3.org/2000/svg" width="1100" height="700">
                            <line x1="100" y1="100" x2="100" y2="600" stroke="blue" stroke-width="2"/>
                            <line x1="100" y1="600" x2="1000" y2="600" stroke="blue" stroke-width="2"/>
                                                       
                            <xsl:for-each select="ville">
                                
                                <xsl:variable name="pos" select="100 + position() * 150"/>
                                <xsl:variable name="temp" select="@temperature * 10"/>
                                                               
                                <text x="{$pos}" y="630" font-size="16" fill="black">
                                    <xsl:value-of select="@nom"/>
                                </text>                                                             
                                <rect x="{$pos}" 
                                    y="{600 - $temp}" 
                                    width="40" 
                                    height="{$temp}"
                                    fill="orange" 
                                    stroke="blue"/>
                            </xsl:for-each>
                            
                        </svg>
                        
                    </div>
                </xsl:for-each>
                
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
