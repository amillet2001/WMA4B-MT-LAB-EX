<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" />
  <xsl:template match="/student">
    <html>
      <head>
        <title>Student Portfolio</title>
      </head>
      <body>
        <h2>Student Portfolio</h2>
        <table border="1">
          <tr bgcolor="#43a3f7">
            <th>First Name</th>
            <th>Middle Name</th>
            <th>Rodriguez</th>
            <th>Age</th>
            <th>Year</th>
            <th>Section</th>
            <th>Course</th>
            <th>Specialization</th>
            <th>ID</th>
          </tr>
          <xsl:for-each select="info[1]">
            <tr>
              <td>
                <xsl:value-of select="first_name" />
              </td>
              <td>
                <xsl:value-of select="middle_name" />
              </td>
              <td>
                <xsl:value-of select="last_name" />
              </td>
              <td>
                <xsl:value-of select="age" />
              </td>
              <td>
                <xsl:value-of select="year" />
              </td>
              <td>
                <xsl:value-of select="section" />
              </td>
              <td>
                <xsl:value-of select="course" />
              </td>
              <td>
                <xsl:value-of select="specialization" />
              </td>
              <td>
                <xsl:value-of select="id" />
              </td>
            </tr>
          </xsl:for-each>
        </table>

        <h2>Other Information</h2>

        <table border="1">
          <tr>
            <th bgcolor="#43a3f7">Skills</th>
          </tr>
          <xsl:for-each select="info[2]/skills/li">
            <tr>
              <td>
                <xsl:value-of select="." />
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <br></br>
        <table border="1">
          <tr>
            <th bgcolor="#43a3f7">Programming Languages</th>
          </tr>
          <xsl:for-each select="info[2]/p_language/li">
            <tr>
              <td>
                <xsl:value-of select="." />
              </td>
            </tr>
          </xsl:for-each>
        </table>

         <br></br>
        <table border="1">
          <tr>
            <th bgcolor="#43a3f7">Tools</th>
          </tr>
          <xsl:for-each select="info[2]/tools/li">
            <tr>
              <td>
                <xsl:value-of select="." />
              </td>
            </tr>
          </xsl:for-each>
        </table>

        <br></br>

        <h2>Education</h2>
        <table border="1">
          <tr bgcolor="#43a3f7"> 
            <th colspan="2">Elementary</th>
            <th colspan="2">Junior High</th>
            <th colspan="3">Senior High</th>
            <th colspan="3">College</th>
          </tr>
          <tr>
            <th>School</th>
            <th>Year</th>
            <th>School</th>
            <th>Year</th>
            <th>School</th>
            <th>Course</th>
            <th>Year</th>
            <th>School</th>
            <th>Course</th>
            <th>Year</th>
          </tr>
          <xsl:for-each select="education">
            <tr>
              <td>
                <xsl:value-of select="elementary/school"/>
              </td>
              <td>
                <xsl:value-of select="elementary/year"/>
              </td>
              <td>
                <xsl:value-of select="junior_high/school"/>
              </td>
              <td>
                <xsl:value-of select="junior_high/year"/>
              </td>
              <td>
                <xsl:value-of select="senior_high/school"/>
              </td>
              <td>
                <xsl:value-of select="senior_high/course"/>
              </td>
              <td>
                <xsl:value-of select="senior_high/year"/>
              </td>
              <td>
                <xsl:value-of select="college/school"/>
              </td>
              <td>
                <xsl:value-of select="college/course"/>
              </td>
              <td>
                <xsl:value-of select="college/year"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>


      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
