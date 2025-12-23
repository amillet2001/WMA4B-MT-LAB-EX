<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
    version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Portfolio - <xsl:value-of select="portfolio/student/firstname"/> <xsl:value-of select="portfolio/student/lastname"/></title>
                <style>
                    body { font-family: Arial, sans-serif; background:#f7f9fc; margin:0; padding:20px; color:#222; }
                    .card { max-width:900px; margin:0 auto; background:#fff; padding:30px 40px; border-radius:8px; box-shadow:0 2px 8px rgba(0,0,0,.08); }
                    h1 { margin-top:0; font-size:28px; letter-spacing:.5px; }
                    h2 { margin-bottom:8px; font-size:20px; color:#2d5d88; }
                    .subtitle { color:#555; margin-top:-6px; margin-bottom:18px; }
                    table.profile { width:100%; border-collapse:collapse; margin-bottom:24px; }
                    table.profile th { text-align:left; padding:6px 10px; background:#2d5d88; color:#fff; font-weight:600; }
                    table.profile td { padding:6px 10px; border-bottom:1px solid #eee; }
                    ul { list-style:disc; margin:6px 0 14px 22px; padding:0; }
                    .pillwrap { display:flex; flex-wrap:wrap; gap:6px; }
                    .pill { background:#e0ecf7; color:#16486b; padding:4px 10px; border-radius:16px; font-size:13px; }
                    .section { margin-bottom:26px; }
                    .skills-heading { margin:0 0 8px; font-size:18px; color:#2d5d88; }
                    footer { text-align:center; font-size:12px; color:#666; margin-top:30px; }
                </style>
            </head>
            <body>
                <div class="card">
                    <h1>
                        <xsl:value-of select="portfolio/student/firstname"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="portfolio/student/lastname"/>
                    </h1>
                    <div class="subtitle">
                        <xsl:value-of select="portfolio/student/course"/> | <xsl:value-of select="portfolio/student/year"/>
                    </div>
                    <table class="profile">
                        <tr>
                            <th>ID</th>
                            <th>Age</th>
                            <th>Address</th>
                        </tr>
                        <tr>
                            <td><xsl:value-of select="portfolio/student/@id"/></td>
                            <td><xsl:value-of select="portfolio/student/age"/></td>
                            <td><xsl:value-of select="portfolio/student/address"/></td>
                        </tr>
                    </table>

                    <div class="section">
                        <h2>Skills</h2>
                        <div class="pillwrap">
                            <xsl:for-each select="portfolio/student/skills/skill">
                                <span class="pill"><xsl:value-of select="."/></span>
                            </xsl:for-each>
                        </div>
                    </div>

                    <xsl:if test="portfolio/student/education/item">
                        <div class="section">
                            <h2>Education</h2>
                            <ul>
                                <xsl:for-each select="portfolio/student/education/item">
                                    <li><xsl:value-of select="."/></li>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </xsl:if>

                    <footer>Generated from XML &amp; XSLT</footer>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>