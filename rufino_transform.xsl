<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Student Portfolio - <xsl:value-of select="portfolio/student/name"/></title>
                <style>
                    body { font-family: Arial, sans-serif; background-color: #cfcfcfff; margin: 20px; }
                    h1, h2 { color: #333; }
                    ul { list-style-type: square; }
                    .project { margin-bottom: 20px; padding: 10px; background-color: #afafafff; border-radius: 5px; box-shadow: 1px 1px 5px #ccc; }
                </style>
            </head>
            <body>
                <h1>Name:<xsl:value-of select="portfolio/student/name"/></h1>
                <h2>Course: <xsl:value-of select="portfolio/student/course"/></h2>
                <h2>Year: <xsl:value-of select="portfolio/student/year"/></h2>

                <h2>Skills</h2>
                <ul>
                    <xsl:for-each select="portfolio/student/skills/skill">
                        <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                </ul>

                <h2>Projects</h2>
                <xsl:for-each select="portfolio/projects/project">
                    <div class="project">
                        <h3><xsl:value-of select="title"/></h3>
                        <p><xsl:value-of select="description"/></p>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
