<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Student Portfolio</title>
        <meta charset="utf-8"/>
        <style>
          body { font-family: Arial, Helvetica, sans-serif; margin: 24px; }
          .card { border: 1px solid #ccc; padding: 18px; border-radius: 8px; max-width: 900px; }
          header { display:flex; gap:16px; align-items:center; margin-bottom:16px; }
          img.photo { width:120px; height:120px; object-fit:cover; border-radius:8px; }
          h1 { margin:0; font-size:1.4rem; }
          .meta { color:#333; margin-top:6px; }
          table { width:100%; border-collapse: collapse; margin-top:10px; }
          th, td { border:1px solid #ddd; padding:8px; text-align:left; }
          th { background:#f5f5f5; }
          .section { margin-top:16px; }
          .projects, .achievements { list-style:disc; margin-left:20px; }
        </style>
      </head>

      <body>
        <xsl:for-each select="StudentPortfolio/Student">
          <div class="card">
            <header>
              <xsl:choose>
                <xsl:when test="string-length(normalize-space(Photo)) &gt; 0">
                </xsl:when>
                <xsl:otherwise>
                  <div style="width:120px;height:120px;background:#eee;display:flex;align-items:center;justify-content:center;border-radius:8px;">
                    <span>Photo</span>
                  </div>
                </xsl:otherwise>
              </xsl:choose>

              <div>
                <h1><xsl:value-of select="FullName"/></h1>
                <div class="meta">
                  <strong>ID:</strong> <xsl:value-of select="StudentID"/> |
                  <strong>Course:</strong> <xsl:value-of select="Course"/> |
                  <strong>Year:</strong> <xsl:value-of select="Year"/>
                  <br/>
                  <strong>Birthday:</strong> <xsl:value-of select="Birthday"/> |
                  <strong>Sex:</strong> <xsl:value-of select="Sex"/>
                  <br/>
                  <strong>Contact:</strong> <xsl:value-of select="Contact"/> |
                  <strong>Email:</strong> <xsl:value-of select="Email"/>
                </div>
              </div>
            </header>

            <div class="section">
              <h3>Address</h3>
              <div><xsl:value-of select="Address"/></div>
            </div>

            <xsl:if test="Grades/Grade">
              <div class="section">
                <h3>Grades</h3>
                <table>
                  <tr><th>Subject</th><th>Score</th></tr>
                  <xsl:for-each select="Grades/Grade">
                    <tr>
                      <td><xsl:value-of select="Subject"/></td>
                      <td><xsl:value-of select="format-number(Score, '0.00')"/></td>
                    </tr>
                  </xsl:for-each>
                </table>
              </div>
            </xsl:if>

            <xsl:if test="Projects/Project">
              <div class="section">
                <h3>Projects</h3>
                <ul class="projects">
                  <xsl:for-each select="Projects/Project">
                    <li>
                      <strong><xsl:value-of select="Title"/></strong>
                      <xsl:if test="Year"> (<xsl:value-of select="Year"/>)</xsl:if>
                      <div><xsl:value-of select="Description"/></div>
                    </li>
                  </xsl:for-each>
                </ul>
              </div>
            </xsl:if>

            <xsl:if test="Achievements/Achievement">
              <div class="section">
                <h3>Achievements</h3>
                <ul class="achievements">
                  <xsl:for-each select="Achievements/Achievement">
                    <li><xsl:value-of select="."/></li>
                  </xsl:for-each>
                </ul>
              </div>
            </xsl:if>

            <xsl:if test="Remarks">
              <div class="section">
                <h3>Remarks</h3>
                <div><xsl:value-of select="Remarks"/></div>
              </div>
            </xsl:if>

          </div>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
