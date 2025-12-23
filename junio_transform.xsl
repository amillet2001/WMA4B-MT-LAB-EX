<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Student Portfolio - <xsl:value-of select="portfolio/student/personalInfo/firstName"/> <xsl:value-of select="portfolio/student/personalInfo/lastName"/></title>
                <style>
                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                    }
                    
                    body {
                        font-family: Tilt Warp, sans-serif;
                        background: #dfddd3;
                        padding: 20px;
                        min-height: 100vh;
                    }
                    
                    .container {
                        max-width: 1200px;
                        margin: 0 auto;
                        background: #e2e4e3;
                        border-radius: 10px;
                        box-shadow: 0 20px 60px rgba(0,0,0,0.3);
                        overflow: hidden;
                    }
                    
                    .header {
                        background: #233130;
                        color: white;
                        padding: 60px 40px;
                        text-align: center;
                        border-bottom: 5px solid #85937d;
                    }
                    
                    .header h1 {
                        font-size: 3em;
                        margin-bottom: 10px;
                        text-shadow: 2px 2px 4px #555;
                    }
                    
                    .header .subtitle {
                        font-size: 1.3em;
                        opacity: 0.95;
                    }
                    
                    .contact-info {
                        margin-top: 20px;
                        font-size: 1em;
                    }
                    
                    .contact-info span {
                        margin: 0 15px;
                        display: inline-block;
                    }
                    
                    .content {
                        padding: 40px;
                    }
                    
                    .section {
                        margin-bottom: 40px;
                    }
                    
                    .section-title {
                        font-size: 2em;
                        color: #233130;
                        border-bottom: 3px solid #85937d;
                        padding-bottom: 10px;
                        margin-bottom: 25px;
                        display:flex;
                        justify-content: center;

                    }
                    
                    .info-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                        gap: 15px;
                        background: #f8f9fa;
                        padding: 25px;
                        border-radius: 10px;
                        margin-bottom: 20px;
                        border: 3px solid #233130;
                    }
                    
                    .info-item {
                        padding: 10px;
                    }
                    
                    .info-label {
                        font-weight: bold;
                        color: #000000;
                        margin-bottom: 5px;
                    }
                    
                    .info-value {
                        color: #333;
                        font-size: 1.1em;
                    }
                    
                    .skills-grid {
                        display: flex;
                        gap: 15px;
                        justify-content: center;
                    }
                    
                    .skill-card {
                        background: #233130;
                        color: white;
                        padding: 20px;
                        border-radius: 10px;
                        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
                        transition: transform 0.3s;
                    }
                    
                    
                    
                    .skill-name {
                        font-size: 1.2em;
                        font-weight: bold;
                        margin-bottom: 8px;
                    }
                    
                    .skill-proficiency {
                        font-size: 0.9em;
                        opacity: 0.9;
                    }
                    
                    .skill-category {
                        font-size: 0.8em;
                        opacity: 0.8;
                        margin-top: 5px;
                    }
                    
                    .project-card {
                        background: #f8f9fa;
                        padding: 25px;
                        border-radius: 10px;
                        margin-bottom: 20px;
                        border: 3px solid #85937d;
                        transition: all 0.3s;
                    }
                    
                    .project-title {
                        font-size: 1.5em;
                        color: #233130;
                        font-weight: bold;
                        margin-bottom: 10px;
                    }
                    
                    .project-description {
                        color: #555;
                        margin-bottom: 15px;
                        line-height: 1.6;
                    }
                    
                    .project-details {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                        gap: 10px;
                        margin-top: 15px;
                    }
                    
                    .project-detail {
                        padding: 8px;
                    }
                    
                    .project-label {
                        font-weight: bold;
                        color: #233130;
                        font-size: 0.9em;
                    }
                    
                    .project-value {
                        color: #333;
                        margin-top: 3px;
                    }
                    
                    .achievement-card {
                        background: linear-gradient(135deg, #ffd89b 0%, #19547b 100%);
                        color: white;
                        padding: 20px;
                        border-radius: 10px;
                        margin-bottom: 15px;
                        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
                    }
                    
                    .achievement-title {
                        font-size: 1.3em;
                        font-weight: bold;
                        margin-bottom: 8px;
                    }
                    
                    .achievement-description {
                        margin-bottom: 8px;
                        opacity: 0.95;
                    }
                    
                    .achievement-date {
                        font-size: 0.9em;
                        opacity: 0.9;
                    }
                    
                    .interests-container {
                        display: flex;
                        flex-wrap: wrap;
                        gap: 15px;
                        justify-content: center;
                    }
                    
                    .interest-tag {
                        background: #dfddd3;
                        color: #233130;
                        font-weight: bold;
                        padding: 12px 25px;
                        border-radius: 25px;
                        border: 2px solid #85937d;
                        font-size: 1em;
                        box-shadow: 0 3px 6px rgba(0,0,0,0.1);
                        transition: all 0.3s;
                    }
                    
                    
                    
                    .footer {
                        background: #233130;
                        color: white;
                        text-align: center;
                        padding: 20px;
                        font-size: 0.9em;
                    }
                    
                    @media (max-width: 768px) {
                        .header h1 {
                            font-size: 2em;
                        }
                        
                        .content {
                            padding: 20px;
                        }
                        
                        
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <!-- Header Section -->
                    <div class="header">
                        <h1>
                            <xsl:value-of select="portfolio/student/personalInfo/firstName"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="portfolio/student/personalInfo/lastName"/>
                        </h1>
                        <div class="subtitle">
                            <xsl:value-of select="portfolio/student/education/program"/>
                        </div>
                        <div class="contact-info">
                            <span> <xsl:value-of select="portfolio/student/personalInfo/email"/></span>
                            <span> <xsl:value-of select="portfolio/student/personalInfo/phone"/></span>
                            <span> <xsl:value-of select="portfolio/student/personalInfo/studentID"/></span>
                        </div>
                    </div>
                    
                    <div class="content">
                        <!-- Education Section -->
                        <div class="section">
                            <h2 class="section-title">Education</h2>
                            <div class="info-grid">
                                <div class="info-item">
                                    <div class="info-label">Institution</div>
                                    <div class="info-value"><xsl:value-of select="portfolio/student/education/institution"/></div>
                                </div>
                                <div class="info-item">
                                    <div class="info-label">Program</div>
                                    <div class="info-value"><xsl:value-of select="portfolio/student/education/program"/></div>
                                </div>
                                <div class="info-item">
                                    <div class="info-label">Year Level</div>
                                    <div class="info-value"><xsl:value-of select="portfolio/student/education/yearLevel"/></div>
                                </div>
                                
                            </div>
                        </div>
                        
                        <!-- Skills Section -->
                        <div class="section">
                            <h2 class="section-title">Skills</h2>
                            <div class="skills-grid">
                                <xsl:for-each select="portfolio/student/skills/skill">
                                    <div class="skill-card">
                                        <div class="skill-name"><xsl:value-of select="n"/></div>
                                        <div class="skill-proficiency">
                                            Level: <xsl:value-of select="proficiency"/>
                                        </div>
                                        <div class="skill-category">
                                            <xsl:value-of select="@category"/>
                                        </div>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </div>
                        
                        <!-- Projects Section -->
                        <div class="section">
                            <h2 class="section-title">Projects</h2>
                            <xsl:for-each select="portfolio/student/projects/project">
                                <div class="project-card">
                                    <div class="project-title"><xsl:value-of select="title"/></div>
                                    <div class="project-description"><xsl:value-of select="description"/></div>
                                    <div class="project-details">
                                        <div class="project-detail">
                                            <div class="project-label">Technologies</div>
                                            <div class="project-value"><xsl:value-of select="technologies"/></div>
                                        </div>
                                        <div class="project-detail">
                                            <div class="project-label">Role</div>
                                            <div class="project-value"><xsl:value-of select="role"/></div>
                                        </div>
                                        <div class="project-detail">
                                            <div class="project-label">Status</div>
                                            <div class="project-value"><xsl:value-of select="status"/></div>
                                        </div>
                                        <div class="project-detail">
                                            <div class="project-label">Year</div>
                                            <div class="project-value"><xsl:value-of select="year"/></div>
                                        </div>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>
                        
                        
                        <!-- Interests Section -->
                        <div class="section">
                            <h2 class="section-title">Interests</h2>
                            <div class="interests-container">
                                <xsl:for-each select="portfolio/student/interests/interest">
                                    <div class="interest-tag">
                                        <xsl:value-of select="."/>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Footer -->
                    <div class="footer">
                        <p>Student Portfolio © 2024</p>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
