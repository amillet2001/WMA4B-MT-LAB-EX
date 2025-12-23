<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/portfolio">
        <html>
            <head>
                <title>Argueza Portfolio</title>
                <style>
                    body {
                        background: linear-gradient(135deg, #f1eaff 0%, #e4fbff 100%);
                        color: #2e3156;
                        font-family: "Nunito", "Segoe UI", Arial, sans-serif;
                        padding: 40px 0;
                        min-height: 100vh;
                    }
                    h1 {
                        color: #5b4dc5;
                        background: #e4fbff;
                        border-radius: 10px;
                        box-shadow: 0 2px 8px rgba(91,77,197,0.06);
                        padding: 16px 0;
                        text-align: center;
                        margin-bottom: 26px;
                        letter-spacing: 0.8px;
                        font-size: 2.1rem;
                    }
                    h2 {
                        color: #28c8c8;
                        font-size: 1.3rem;
                        margin-bottom: 0.3rem;
                    }
                    .section {
                        margin: 24px auto;
                        padding: 24px 32px;
                        background: #ffffff;
                        border: 1.8px solid #bdc3c7;
                        border-radius: 12px;
                        box-shadow: 0 4px 18px rgba(40,200,200,0.09);
                        max-width: 580px;
                    }
                    .card {
                        background: #d5f3ef;
                        color: #2e3156;
                        padding: 1rem;
                        border-radius: 8px;
                        box-shadow: 0 2px 20px rgba(40,200,200,0.04);
                        margin-bottom: 1.5rem;
                    }
                    .card li {
                        list-style: disc;
                        margin-left: 24px;
                        margin-bottom: 6px;
                        font-size: 1.04rem;
                    }
                    .skills {
                        display: flex;
                        flex-wrap: wrap;
                        gap: 0.9rem;
                        margin-top: 8px;
                    }
                    .skills li {
                        background: #28c8c8;
                        color: #fff;
                        padding: 0.35rem 1.1rem;
                        border-radius: 20px;
                        font-size: 0.95rem;
                        font-style: italic;
                        box-shadow: 0 2px 8px rgba(91,77,197,0.07);
                    }
                    p, ul {
                        font-size: 1rem;
                        margin-bottom: 8px;
                    }
                    @media (max-width: 600px) {
                        .section {
                            padding: 12px 8px;
                            max-width: 98vw;
                        }
                    }
                </style>
            </head>
            <body>
                <h1>Argueza Portfolio</h1>
                <div class="section">
                    <h2>Profile Information</h2>
                    <p><strong>Name:</strong> <xsl:value-of select="home/hero/name" /></p>
                    <p><strong>Description:</strong> <xsl:value-of select="home/hero/description" /></p>
                </div>
                <div class="section">
                    <h2>About</h2>
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
                    <h2>Hobbies and Skills</h2>
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
