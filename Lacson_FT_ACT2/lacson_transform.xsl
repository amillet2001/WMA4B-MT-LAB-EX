<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/portfolio">
    <html>
      <head>
        <meta charset="utf-8"/>
        <title>
          <xsl:value-of select="student/firstname"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="student/lastname"/>
          <xsl:text> - Portfolio</xsl:text>
        </title>

        <style>
          body { font-family: Arial; margin: 20px; }
          header { border-bottom: 1px solid #ccc; padding-bottom: 10px; margin-bottom: 15px; }
          h1 { margin: 0; }
          section { margin-bottom: 14px; }
          .label { font-weight: bold; }
          ul { margin: 6px 0 6px 18px; }
        </style>
      </head>

      <body>
        <header>
          <h1>
            <xsl:value-of select="student/firstname"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="student/lastname"/>
          </h1>

          <div><span class="label">Course:</span>
            <xsl:value-of select="student/course"/>
          </div>

          <div><span class="label">Contact: </span>
            <xsl:value-of select="student/email"/>
            <xsl:text> | </xsl:text>
            <xsl:value-of select="student/phone"/>
          </div>
        </header>

        <section>
          <h2>Education</h2>
          <xsl:for-each select="education/school">
            <div>
              <div class="label"><xsl:value-of select="name"/></div>
              <div>
                <xsl:value-of select="degree"/>
                <xsl:if test="year">
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="year"/>
                  <xsl:text>)</xsl:text>
                </xsl:if>
              </div>
            </div>
          </xsl:for-each>
        </section>

        <section>
          <h2>Skills</h2>
          <ul>
            <xsl:for-each select="skills/skill">
              <li><xsl:value-of select="."/></li>
            </xsl:for-each>
          </ul>
        </section>

        <section>
          <h2>Projects</h2>
          <xsl:for-each select="projects/project">
            <div>
              <div class="label">
                <xsl:value-of select="title"/>
                <xsl:if test="year">
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="year"/>
                  <xsl:text>)</xsl:text>
                </xsl:if>
              </div>

              <div>
                <xsl:value-of select="description"/>
                <xsl:if test="link">
                  <xsl:text> </xsl:text>
                  <a href="{link}">View</a>
                </xsl:if>
              </div>
            </div>
            <br/>
          </xsl:for-each>
        </section>

        <section>
          <h2>Awards</h2>
          <ul>
            <xsl:for-each select="awards/award">
              <li>
                <xsl:value-of select="title"/>
                <xsl:if test="year">
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="year"/>
                  <xsl:text>)</xsl:text>
                </xsl:if>
              </li>
            </xsl:for-each>
          </ul>
        </section>

        <section>
          <h2>Personal Statement</h2>
          <div><xsl:value-of select="statement"/></div>
        </section>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
