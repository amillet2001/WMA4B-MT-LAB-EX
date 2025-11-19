<?xml version="1.0" encoding="UTF-8"?>
<!-- XSLT Stylesheet for Dean Villanueva Student Portfolio -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!-- Match whole XML document -->
    <xsl:template match="/">
        <html>
        <head>
            <title>Student Portfolio - Dean Villanueva</title>

            <!-- Simple Clean CSS -->
            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 30px;
                    background-color: #f7f7f7;
                }
                h1 {
                    color: #23395d;
                    border-bottom: 2px solid #23395d;
                    padding-bottom: 5px;
                }
                h2 {
                    color: #1d2d44;
                    margin-top: 30px;
                    border-left: 5px solid #1d2d44;
                    padding-left: 10px;
                }
                .section {
                    margin-bottom: 25px;
                    background: #ffffff;
                    padding: 15px;
                    border-radius: 8px;
                    box-shadow: 0 0 5px rgba(0,0,0,0.1);
                }
                .project {
                    padding: 10px 0;
                }
                .project:not(:last-child) {
                    border-bottom: 1px solid #ccc;
                }
            </style>
        </head>

        <body>

            <h1>Student Portfolio</h1>

            <!-- Student Basic Information -->
            <div class="section">
                <h2>Student Information</h2>
                <p><strong>Name:</strong> 
                    <xsl:value-of select="studentPortfolio/studentInfo/firstName" />
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="studentPortfolio/studentInfo/lastName" />
                </p>
                <p><strong>Student ID:</strong> <xsl:value-of select="studentPortfolio/studentInfo/studentID" /></p>
                <p><strong>Program:</strong> <xsl:value-of select="studentPortfolio/studentInfo/program" /></p>
                <p><strong>Year Level:</strong> <xsl:value-of select="studentPortfolio/studentInfo/yearLevel" /></p>
            </div>

            <!-- Skills Section -->
            <div class="section">
                <h2>Skills</h2>
                <ul>
                    <xsl:for-each select="studentPortfolio/skills/skill">
                        <li><xsl:value-of select="." /></li>
                    </xsl:for-each>
                </ul>
            </div>

            <!-- Projects Section -->
            <div class="section">
                <h2>Projects</h2>
                <xsl:for-each select="studentPortfolio/projects/project">
                    <div class="project">
                        <p><strong>Title:</strong> <xsl:value-of select="title" /></p>
                        <p><strong>Description:</strong> <xsl:value-of select="description" /></p>
                        <p><strong>Year:</strong> <xsl:value-of select="yearMade" /></p>
                    </div>
                </xsl:for-each>
            </div>

            <!-- Contact Section -->
            <div class="section">
                <h2>Contact Information</h2>
                <p><strong>Email:</strong> <xsl:value-of select="studentPortfolio/contacts/email" /></p>
                <p><strong>Phone:</strong> <xsl:value-of select="studentPortfolio/contacts/phone" /></p>
                <p><strong>GitHub:</strong> <xsl:value-of select="studentPortfolio/contacts/github" /></p>
            </div>

        </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
