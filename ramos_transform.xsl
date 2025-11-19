<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">

    <html>
      <head>
        <title>Catherine Ramos</title>

        <style>
          body {
            font-family: Arial, sans-serif;
            background: #ffd6e8;            /* soft pink background */
            padding: 30px;
            margin: 0;
          }

          .wrapper {
            max-width: 900px;
            margin: auto;
          }

          .card {
            background: #ffffff;
            padding: 25px;
            margin-bottom: 20px;
            border-radius: 14px;
            border: 2px solid #ffb3d9;       /* light pink border */
            box-shadow: 0 3px 10px rgba(0,0,0,0.15);
          }

          h2 {
            color: #cc2e72;                  /* darker pink title */
            margin-top: 0;
          }

          .label {
            font-weight: bold;
            color: #b30059;                   /* deep pink label */
          }

          p {
            line-height: 1.5;
            font-size: 16px;
          }
        </style>
      </head>

      <body>
        <div class="wrapper">

          <div class="card">
            <h2>Personal Information</h2>
            <p><span class="label">Name:</span> <xsl:value-of select="studentProfile/info/fullName"/></p>
            <p><span class="label">Course:</span> <xsl:value-of select="studentProfile/info/course"/></p>
          </div>

          <div class="card">
            <h2>Profile Summary</h2>
            <p><xsl:value-of select="studentProfile/profileSummary"/></p>
          </div>

          <div class="card">
            <h2>Academic Background</h2>
            <xsl:for-each select="studentProfile/academicBackground/school">
              <p>
                <strong><xsl:value-of select="@level"/></strong> – 
                <xsl:value-of select="institution"/>
                (<xsl:value-of select="year"/>)
              </p>
            </xsl:for-each>
          </div>

          <div class="card">
            <h2>Skills</h2>
            <xsl:for-each select="studentProfile/competencies/skill">
              <p>
                <span class="label"><xsl:value-of select="@category"/>:</span>
                <xsl:value-of select="."/>
              </p>
            </xsl:for-each>
          </div>

          <div class="card">
            <h2>Projects</h2>
            <xsl:for-each select="studentProfile/projects/project">
              <p>
                <strong><xsl:value-of select="title"/></strong><br/>
                <span class="label">Tools:</span> <xsl:value-of select="tools"/><br/>
                <xsl:value-of select="summary"/>
              </p>
            </xsl:for-each>
          </div>

          <div class="card">
            <h2>Contact</h2>
            <p><span class="label">Email:</span> <xsl:value-of select="studentProfile/reachMe/email"/></p>
            <p><span class="label">Phone:</span> <xsl:value-of select="studentProfile/reachMe/phone"/></p>
          </div>

        </div>
      </body>

    </html>

  </xsl:template>

</xsl:stylesheet>
