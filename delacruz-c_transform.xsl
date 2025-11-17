<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/myPortfolio">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>My Portfolio: <xsl:value-of select="personalInfo/fullName"/></title>

        <style>
          body {
            font-family: Monospace;
            margin: 0;
            padding: 20px;
            background: lightblue;
          }

          .cont {
            width: 80%;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 25px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
          }

          h1 {
            text-align: center;
            margin-bottom: 30px;
            color: lightseagreen;
          }

          h2 {
            border-bottom: 2px solid #ddd;
            padding-bottom: 4px;
            margin-top: 30px;
            color: red;
          }

          ul {
            list-style-type: hiragana-iroha;
            margin-left: 20px;
          }

          .edu {
            background: lightgray;
            border-left: 4px solid #007acc;
            padding: 10px;
            margin-bottom: 10px;
          }
        </style>
      </head>

      <body>
        <div class="cont">

          <h1>My Simple Portfolio</h1>

          <h2>Personal Information</h2>
          <p><strong>Full Name:</strong> <xsl:value-of select="personalInfo/fullName"/></p>
          <p><strong>Phone Number:</strong> <xsl:value-of select="personalInfo/phoneNum" /></p>
          <p><strong>Birth Date:</strong> <xsl:value-of select="personalInfo/birthDate" /></p>
          <p><strong>Place:</strong> <xsl:value-of select="personalInfo/place" /></p>
          <p><strong>Email:</strong> <xsl:value-of select="personalInfo/email" /></p>
          <p><strong>Course:</strong> <xsl:value-of select="personalInfo/course" /></p>

          <h2>Hobbies</h2>
          <ul>
            <xsl:for-each select="hobbies/hobby">
              <li><xsl:value-of select="."/></li>
            </xsl:for-each>
          </ul>

          <h2>My Skills</h2>
          <ul>
            <xsl:for-each select="mySkills/skill">
              <li><xsl:value-of select="."/></li>
            </xsl:for-each>
          </ul>

          <h2>Educational Background</h2>
          <xsl:for-each select="educationalBackground/education">
            <div class="edu">
              <p><strong>Level:</strong> <xsl:value-of select="level"/></p>
              <p><strong>School:</strong> <xsl:value-of select="schoolName"/></p>
              <p><strong>Year Graduated:</strong> <xsl:value-of select="yearGraduated"/></p>
            </div>
          </xsl:for-each>

        </div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
