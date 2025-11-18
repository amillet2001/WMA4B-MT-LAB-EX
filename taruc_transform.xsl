<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/portfolio">
        <html>
            <head>
                <title>Student Portfolio</title>

                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #FAF5F1; /* Light background */
                        color: #292F36; /* Dark text */
                        margin: 20px;
                    }

                    h1 {
                        color: #A41F13; /* Red */
                        border-bottom: 3px solid #A41F13;
                        padding-bottom: 5px;
                    }

                    h2 {
                        color: #292F36;
                        background-color: #E0DBD8;
                        padding: 8px;
                        border-left: 5px solid #A41F13;
                        margin-top: 30px;
                    }

                    h3 {
                        color: #A41F13;
                        margin-top: 15px;
                    }

                    .section {
                        margin-top: 20px;
                        padding: 15px;
                        background-color: #FFFFFF;
                        border: 1px solid #E0DBD8;
                        border-radius: 5px;
                    }

                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 10px;
                    }

                    th {
                        background-color: #A41F13;
                        color: white;
                        padding: 10px;
                        border: 1px solid #8F7A6E;
                    }

                    td {
                        padding: 8px;
                        border: 1px solid #E0DBD8;
                    }

                    tr:nth-child(even) {
                        background-color: #E0DBD8;
                    }

                    a {
                        color: #A41F13;
                    }

                    li {
                        margin-bottom: 6px;
                    }

                    hr {
                        border: 0;
                        height: 1px;
                        background-color: #8F7A6E;
                        margin-top: 15px;
                        margin-bottom: 15px;
                    }
                </style>
            </head>

            <body>
                <h1>Student Portfolio</h1>

                <div class="section">
                    <h2>Student Information</h2>
                    <p><strong>ID:</strong> <xsl:value-of select="student/studentID" /></p>
                    <p><strong>Name:</strong>
                        <xsl:value-of select="student/name/firstName" />
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="student/name/lastName" />
                    </p>
                    <p><strong>Email:</strong> <xsl:value-of select="student/email" /></p>
                    <p><strong>Major:</strong> <xsl:value-of select="student/major" /></p>
                    <p><strong>Year Level:</strong> <xsl:value-of select="student/yearLevel" /></p>
                </div>

                <div class="section">
                    <h2>Courses</h2>
                    <table>
                        <tr>
                            <th>Code</th>
                            <th>Name</th>
                            <th>Grade</th>
                        </tr>

                        <xsl:for-each select="courses/course">
                            <tr>
                                <td><xsl:value-of select="@courseCode" /></td>
                                <td><xsl:value-of select="courseName" /></td>
                                <td><xsl:value-of select="grade" /></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>

                <div class="section">
                    <h2>Projects</h2>

                    <xsl:for-each select="projects/project">
                        <h3><xsl:value-of select="projectTitle" /></h3>

                        <p><strong>Description:</strong> <xsl:value-of select="description" /></p>

                        <p><strong>Duration:</strong>
                            <xsl:value-of select="startDate" /> -
                            <xsl:value-of select="endDate" />
                        </p>

                        <p><strong>Technologies:</strong>
                            <xsl:for-each select="technologies/technology">
                                <xsl:value-of select="." />
                                <xsl:if test="position() != last()">, </xsl:if>
                            </xsl:for-each>
                        </p>

                        <p><strong>Project URL:</strong>
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="projectURL" />
                                </xsl:attribute>
                                <xsl:value-of select="projectURL" />
                            </a>
                        </p>

                        <hr/>
                    </xsl:for-each>
                </div>

                <div class="section">
                    <h2>Skills</h2>
                    <ul>
                        <xsl:for-each select="skills/skill">
                            <li>
                                <strong><xsl:value-of select="." /></strong>
                                - <xsl:value-of select="@level" />
                            </li>
                        </xsl:for-each>
                    </ul>
                </div>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
