<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Student Portfolio - DelaPena</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 20px; }
                    h1 { color: #2E86C1; }
                    h2 { color: #117A65; }
                    ul { list-style-type: square; }
                </style>
            </head>
            <body>
                <h1>Student Portfolio</h1>
                <h2>Bio</h2>
                <p><strong>Name:</strong> <xsl:value-of select="studentPortfolio/student/bio/name"/></p>
                <p><strong>Student ID:</strong> <xsl:value-of select="studentPortfolio/student/bio/studentID"/></p>
                <p><strong>Course:</strong> <xsl:value-of select="studentPortfolio/student/bio/course"/></p>
                <p><strong>Year Level:</strong> <xsl:value-of select="studentPortfolio/student/bio/yearLevel"/></p>
                
                <h2>Skills</h2>
                <ul>
                    <xsl:for-each select="studentPortfolio/student/skills/skill">
                        <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                </ul>
                
                <h2>Projects</h2>
                <ul>
                    <xsl:for-each select="studentPortfolio/student/projects/project">
                        <li>
                            <strong><xsl:value-of select="title"/></strong>: <xsl:value-of select="description"/>
                        </li>
                    </xsl:for-each>
                </ul>
                
                <h2>Contact</h2>
                <p><strong>Email:</strong> <xsl:value-of select="studentPortfolio/student/contact/email"/></p>
                <p><strong>Phone:</strong> <xsl:value-of select="studentPortfolio/student/contact/phone"/></p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
