<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/portfolio">
        <html>
            <head>
               <title>Student Portfolio</title>
                <style>
                    body {
                        background: #eafcff;
                        color: #222;
                        font-family: 'Segoe UI', Arial, sans-serif;
                        margin: 0;
                        padding: 0;
                    }
                    .section {
                        background: #fff;
                        border-radius: 12px;
                        margin: 32px auto;
                        max-width: 760px;
                        box-shadow: 0 2px 14px rgba(21,180,210,0.10);
                        padding: 24px 32px;
                    }
                    h2 {
                        color: #12a4d9;
                        font-weight: 700;
                        margin-bottom: .7em;
                    }
                    ul {
                        margin-top: 0.8em;
                        margin-bottom: 0.5em;
                    }
                    li {
                        margin-bottom: .45em;
                    }
                    p {
                        margin-bottom: .5em;
                    }
                </style>
            </head>
            <body>

                <div class="section">
                    <h2>Profile Information</h2>
                    <p><strong>Name:</strong> <xsl:value-of select="home/hero/name" /></p>
                    <p><strong>Detail:</strong> <xsl:value-of select="home/hero/detail" /></p>
                </div>

                <div class="section">
                    <h2>About</h2>
                    <p><xsl:value-of select="about/content" /></p>
                </div>

                <div class="section">
                    <h2>Educational Background</h2>
                    <ul>
                        <xsl:for-each select="resume/educationalBackground/ul/li">
                            <li><xsl:value-of select="." /></li>
                        </xsl:for-each>
                    </ul>
                </div>

                <div class="section">
                    <h2>Hobbies</h2>
                    <ul>
                        <xsl:for-each select="resume/hobbies/ul/li">
                            <li><xsl:value-of select="." /></li>
                        </xsl:for-each>
                    </ul>
                </div>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
