<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/studentPortfolio">
        <html>
        <head>
            <title>
                <xsl:value-of select="personalInfo/fullName"/> – Portfolio
            </title>
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }
                
                body {
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    background-color: #ffffff;
                    color: #1f2937;
                    line-height: 1.6;
                }
                
            
                header {
                    background: #111827;
                    color: #ffffff;
                    padding: 40px 24px;
                    text-align: center;
                    border-bottom: 4px solid #ff5838;
                }
                
                header h1 {
                    font-size: 48px;
                    font-weight: 800;
                    margin-bottom: 8px;
                    letter-spacing: -1px;
                }
                
                header p {
                    font-size: 15px;
                    color: #d1d5db;
                    font-weight: 500;
                    letter-spacing: 1px;
                }
                
                .container {
                    max-width: 1200px;
                    margin: 0 auto;
                    padding: 20px 16px;
                }
                
                
                .sections-grid {
                    display: grid;
                    grid-template-columns: 280px 1fr;
                    gap: 20px;
                }
                
                .sidebar {
                    display: grid;
                    gap: 20px;
                }
                
                .main-content {
                    display: grid;
                    gap: 20px;
                }
                
                .section {
                    background: #f9fafb;
                    padding: 24px;
                    border: 3px solid #ff5838;
                    transition: box-shadow 0.3s ease;
                }
                
                .section:hover {
                    box-shadow: 0 12px 24px rgba(255, 88, 56, 0.15);
                }
                

                .section h2 {
                    font-size: 28px;
                    font-weight: 800;
                    margin-bottom: 24px;
                    color: #111827;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }
                
                .section h3 {
                    font-size: 17px;
                    font-weight: 700;
                    color: #111827;
                    margin-top: 20px;
                    margin-bottom: 8px;
                }
                
                .section p {
                    margin-bottom: 12px;
                    color: #4b5563;
                    font-size: 14px;
                    line-height: 1.7;
                }
                

                .tag {
                    display: inline-block;
                    padding: 8px 16px;
                    margin: 6px 8px 6px 0;
                    border-radius: 4px;
                    background-color: #ff5838;
                    color: #ffffff;
                    font-size: 13px;
                    font-weight: 600;
                }
                
                .project-card {
                    margin-bottom: 28px;
                    padding-bottom: 28px;
                    border-bottom: 1px solid #e5e7eb;
                }
                
                .project-card:last-child {
                    border-bottom: none;
                    margin-bottom: 0;
                    padding-bottom: 0;
                }
                
                .project-title {
                    font-size: 19px;
                    font-weight: 800;
                    color: #111827;
                    margin-bottom: 8px;
                }
                
           
                .project-type {
                    display: inline-block;
                    font-size: 11px;
                    font-weight: 700;
                    color: #ffffff;
                    background-color: #ff5838;
                    padding: 6px 12px;
                    margin-bottom: 12px;
                    text-transform: uppercase;
                }
                
                strong {
                    color: #111827;
                    font-weight: 700;
                }
                
               
                .section-full {
                    grid-column: 1 / -1;
                }
                
                @media (max-width: 768px) {
                    header h1 {
                        font-size: 36px;
                    }
                    
                    /* Stack layout on mobile - single column */
                    .sections-grid {
                        grid-template-columns: 1fr;
                        gap: 24px;
                    }
                    
                    .sidebar {
                        gap: 24px;
                    }
                    
                    .main-content {
                        gap: 24px;
                    }
                    
                    .section {
                        padding: 24px;
                    }
                }
            </style>
        </head>
        <body>
            <header>
                <h1><xsl:value-of select="personalInfo/fullName"/></h1>
                <p>
                    <xsl:value-of select="personalInfo/program"/>
                    •
                    <xsl:value-of select="personalInfo/country"/>
                </p>
            </header>

            <div class="container">
                <div class="sections-grid">
                    
                  
                    <div class="sidebar">
                  
                        <div class="section">
                            <h2>Education</h2>
                            <xsl:for-each select="education/degree">
                                <div>
                                    <h3><xsl:value-of select="title"/></h3>
                                    <xsl:if test="major">
                                        <p><strong>Major:</strong> <xsl:value-of select="major"/></p>
                                    </xsl:if>
                                    <xsl:if test="institution">
                                        <p><strong>Institution:</strong> <xsl:value-of select="institution"/></p>
                                    </xsl:if>
                                    <xsl:if test="years">
                                        <p><strong>Years:</strong> <xsl:value-of select="years"/></p>
                                    </xsl:if>
                                    <p><strong>Status:</strong> <xsl:value-of select="status"/></p>
                                </div>
                            </xsl:for-each>

                            <xsl:if test="education/educationHistory">
                                <h3>Background</h3>
                                <xsl:for-each select="education/educationHistory/level">
                                    <p>
                                        <strong><xsl:value-of select="name"/></strong><br/>
                                        <xsl:value-of select="school"/><br/>
                                        <xsl:value-of select="years"/>
                                    </p>
                                </xsl:for-each>
                            </xsl:if>
                        </div>

                    
                        <div class="section">
                            <h2>Skills</h2>
                            <xsl:variable name="categories" select="skills/skill[not(category=preceding::skill/category)]"/>
                            <xsl:for-each select="$categories">
                                <xsl:variable name="currentCat" select="category"/>
                                <div>
                                    <h3><xsl:value-of select="$currentCat"/></h3>
                                    <div>
                                        <xsl:for-each select="//skills/skill[category=$currentCat]">
                                            <span class="tag"><xsl:value-of select="name"/></span>
                                        </xsl:for-each>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                    
              
                    <div class="main-content">
                    
                        <div class="section">
                            <h2>About</h2>
                            <p><xsl:value-of select="about"/></p>
                        </div>

             
                        <div class="section">
                            <h2>Projects</h2>
                            <xsl:for-each select="projects/project">
                                <div class="project-card">
                                    <div class="project-title"><xsl:value-of select="name"/></div>
                                    <span class="project-type"><xsl:value-of select="type"/></span>
                                    <p><strong>Role:</strong> <xsl:value-of select="role"/></p>
                                    <p><xsl:value-of select="description"/></p>
                                    <xsl:if test="technologies">
                                        <p><strong>Technologies:</strong></p>
                                        <div>
                                            <xsl:for-each select="technologies/technology">
                                                <span class="tag"><xsl:value-of select="."/></span>
                                            </xsl:for-each>
                                        </div>
                                    </xsl:if>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                    
                </div>
            </div>
        </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
