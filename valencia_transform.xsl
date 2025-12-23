<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:strip-space elements="*"/>
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>Student Portfolio - Valencia</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background: #f5f7fa;
                        margin: 0;
                        padding: 0;
                    }
                    .container {
                        width: 75%;
                        max-width: 900px;
                        margin: 40px auto;
                        background: #ffffff;
                        padding: 30px 40px;
                        border-radius: 12px;
                        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                    }
                    h1 {
                        text-align: center;
                        margin-bottom: 25px;
                        color: #2c3e50;
                    }
                    h2 {
                        margin-top: 30px;
                        margin-bottom: 12px;
                        color: #34495e;
                        border-left: 4px solid #3498db;
                        padding-left: 10px;
                    }
                    .project {
                        padding: 18px;
                        background: #fafafa;
                        border-radius: 8px;
                        margin-bottom: 15px;
                        border: 1px solid #e1e1e1;
                        transition: 0.2s;
                    }
                    .project:hover {
                        transform: translateY(-3px);
                        box-shadow: 0 3px 10px rgba(0,0,0,0.09);
                    }
                    .skill {
                        display: inline-block;
                        margin-right: 10px;
                        margin-bottom: 8px;
                        padding: 6px 12px;
                        border-radius: 20px;
                        background: #3498db;
                        color: white;
                        font-size: 14px;
                        font-weight: bold;
                    }
                    .info-box {
                        padding: 15px;
                        background: #ecf5ff;
                        border-left: 4px solid #3498db;
                        border-radius: 6px;
                    }
                </style>
            </head>

            <body>
                <div class="container">

                    <h1>Student Portfolio</h1>

                    <!-- Student Info -->
                    <xsl:apply-templates select="StudentPortfolio/Student" />

                    <!-- Projects -->
                    <h2>Projects</h2>
                    <xsl:for-each select="StudentPortfolio/Projects/Project">
                        <div class="project">
                            <h3><xsl:value-of select="normalize-space(Title)"/></h3>
                            <p><xsl:value-of select="normalize-space(Description)"/></p>
                            <p><strong>Year:</strong> <xsl:value-of select="Year"/></p>
                        </div>
                    </xsl:for-each>

                    <!-- Skills -->
                    <h2>Skills</h2>
                    <xsl:for-each select="StudentPortfolio/Skills/Skill">
                        <span class="skill"><xsl:value-of select="normalize-space(.)"/></span>
                    </xsl:for-each>

                </div>
            </body>
        </html>
    </xsl:template>

    <!-- Student Info Template -->
    <xsl:template match="Student">
        <h2>Student Information</h2>
        <div class="info-box">
            <p><strong>Name:</strong>
                <xsl:value-of select="normalize-space(FirstName)"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="normalize-space(LastName)"/>
            </p>
            <p><strong>Course:</strong> <xsl:value-of select="normalize-space(Course)"/></p>
            <p><strong>Year Level:</strong> <xsl:value-of select="YearLevel"/></p>
        </div>
    </xsl:template>

</xsl:stylesheet>
