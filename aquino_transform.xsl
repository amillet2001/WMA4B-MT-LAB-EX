<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/portfolio">
        <html>
            <head>
                <title>NEIL AQUINO PORTFOLIO</title>

                <style>
                    * {
                      margin: 0;
                      padding: 0;
                      box-sizing: border-box;
                      font-family: "Segoe UI", Arial, sans-serif;
                    }

                    body {
                      background-color: #ff0000ff;
                      color: #ff0000ff;
                      line-height: 1.6;
                    }

                    h1 {
                      color: #a2ff00ff;
                      margin-bottom: 1rem;
                    }

                    h2 {
                      color: #ff0000ff;
                      margin-bottom: 1rem;
                    }

                    .section {
                      margin-top: 20px;
                      padding: 15px;
                      background-color: #ffffffff;
                      border: 1px solid #000000ff;
                      border-radius: 5px;
                    }

                    .card {
                      background: #ff0000ff;
                      color: #a2ff00ff;
                      padding: 1rem;
                      border-radius: 10px;
                      margin-bottom: 1.5rem;
                      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                    }

                    .card li {
                      list-style: none;
                    }

                    .hobbies {
                      display: flex;
                      flex-wrap: wrap;
                      gap: 1.5rem;
                    }

                    .hobbies li {
                      background: #ff0000ff;
                      color: #a2ff00ff;
                      padding: 0.4rem 0.8rem;
                      border-radius: 6px;
                      font-size: 0.9rem;
                      font-weight: bold;
                    }

                    table {
                      width: 100%;
                      border-collapse: collapse;
                      margin-top: 10px;
                    }

                    th {
                      background-color: #a2ff00ff;
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
                </style>
            </head>

            <body>
                <h1>NEIL AQUINO PORTFOLIO</h1>

                <div class="section">
                    <h2>Profile Information</h2>
                    <p><strong>Name:</strong> <xsl:value-of select="home/hero/name" /></p>
                    <p><strong>Description:</strong> <xsl:value-of select="home/hero/description" /></p>
                </div>

                <div class="section">
                    <h2>About</h2>
                    <h3><xsl:value-of select="about/title" /></h3>
                    <p><xsl:value-of select="about/content" /></p>
                </div>

                <div class="section">
                    <h2>Educational Background</h2>
                    <div class="card">
                        <ul>
                            <xsl:for-each select="resume/educBackground/ul/li">
                                <li><xsl:value-of select="." /></li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </div>

                <div class="section">
                    <h2>Hobbies</h2>
                    <ul class="skills">
                        <xsl:for-each select="resume/hobbies/ul/li">
                            <li><xsl:value-of select="." /></li>
                        </xsl:for-each>
                    </ul>
                </div>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>