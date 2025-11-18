<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Student Portfolio</title>
        <style>
          body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #343a40;
            line-height: 1.6;
          }
          .container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
          }
          h1, h2 {
            color: #495057;
          }
          h2 {
            border-bottom: 2px solid #dee2e6;
            padding-bottom: 10px;
          }
          ul {
            list-style-type: none;
            padding: 0;
          }
          li {
            background: #e9ecef;
            padding: 5px 10px;
            margin-bottom: 5px;
            border-radius: 3px;
          }
          .section {
            margin-bottom: 40px;
          }
          .project {
            border-left: 4px solid #007bff;
            padding-left: 15px;
            margin-bottom: 20px;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>Student Portfolio</h1>
          <xsl:apply-templates select="portfolio/student"/>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="student">
    <header style="background-color: #f4f4f4; padding: 20px; text-align: center; border-bottom: 2px solid #ccc;">
      <h1 style="margin: 0; color: #2c3e50;">
        <xsl:value-of select="firstName"/><xsl:text> </xsl:text><xsl:value-of select="middleName"/><xsl:text> </xsl:text><xsl:value-of select="lastName"/>
      </h1>
    </header>
    <p><strong>Section:</strong> <xsl:value-of select="section"/></p>
    <p><strong>Email:</strong> <xsl:value-of select="email"/></p>
    <p><strong>Phone:</strong> <xsl:value-of select="phone"/></p>

    <div class="section">
      <h2>About Me</h2>
      <p><xsl:value-of select="aboutMe"/></p>
    </div>

    <div class="section">
      <h2>Skills</h2>
      <ul>
        <xsl:for-each select="skills/skill">
          <li><xsl:value-of select="."/></li>
        </xsl:for-each>
      </ul>
    </div>

    <div class="section">
      <h2>Education</h2>
      <xsl:for-each select="education/degree">
        <p><strong><xsl:value-of select="degreeType"/> in <xsl:value-of select="field"/></strong> - <xsl:value-of select="institution"/>, <xsl:value-of select="year"/></p>
      </xsl:for-each>
    </div>

    <div class="section">
      <h2>Hobbies</h2>
      <ul>
        <xsl:for-each select="hobbies/hobby">
          <li><xsl:value-of select="."/></li>
        </xsl:for-each>
      </ul>
    </div>
  </xsl:template>
</xsl:stylesheet>
