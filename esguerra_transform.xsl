<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/portfolio">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Student Portfolio - <xsl:value-of select="student/firstName"/> <xsl:value-of select="student/lastName"/></title>
                <style>
                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                    }
                    
                    body {
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        line-height: 1.6;
                        background: #333333;
                        color: #e0e0e0;
                    }

                    .container {
                        margin: auto;
                        background: #2d2d2d;
                        overflow: hidden;
                        box-shadow: 0 20px 60px rgba(0,0,0,0.5);
                    }

                    .header {
                        background: #1f1f1f;
                        color: #e0e0e0;
                        padding: 1rem;
                        text-align: center;
                        border-bottom: 2px solid #444;
                    }

                    .my-name {
                        font-size: 2.5em;
                        margin-bottom: 10px; 
                        color: wheat;
                    }
                    
                    .header p {
                        font-size: 1.2em;
                        opacity: 0.95;
                    }
                    
                    .contact-info {
                        padding: 1rem;
                        margin-top: 1rem;
                        display: flex;
                        justify-content: center;
                        gap: 30px;
                        border-top: 1px solid #444;
                    }
                    
                    .contact-item {
                        display: flex;
                        align-items: center;
                        gap: 8px;
                    }
                    
                    .content {
                        padding: 40px;
                    }
                    
                    .section {
                        margin-bottom: 40px;
                    }
                    
                    .section-title {
                        font-size: 1.8em;
                        color: wheat;
                        margin-bottom: 20px;
                        padding-bottom: 10px;
                    }

                    .academic-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                        gap: 20px;
                        margin-bottom: 20px;
                    }

                    .academic-card {
                        background: #3a3a3a;
                        padding: 20px;
                        border-radius: 10px;
                    }

                    .academic-card h3 {
                        color: #64b5f6;
                        font-size: 0.9em;
                        margin-bottom: 5px;
                        text-transform: uppercase;
                    }

                    .academic-card p {
                        font-size: 1.3em;
                        font-weight: bold;
                        color: #e0e0e0;
                    }
                    
                    .project-card {
                        background: #3a3a3a;
                        padding: 25px;
                        margin-bottom: 20px;
                        border-radius: 10px;
                        transition: transform 0.3s ease, box-shadow 0.3s ease;
                    }

                    .project-card h3 {
                        color: #81c784;
                        margin-bottom: 10px;
                        font-size: 1.3em;
                    }

                    .project-card p {
                        margin-bottom: 10px;
                        color: #b0b0b0;
                    }

                    .tech-tags {
                        margin: 15px 0;
                    }

                    .tech-tag {
                        display: inline-block;
                        background: #4a4a4a;
                        color: #64b5f6;
                        border: 1px solid #64b5f6;
                        padding: 5px 12px;
                        margin: 3px;
                        border-radius: 15px;
                        font-size: 0.85em;
                    }

                    .project-link {
                        color: #64b5f6;
                        text-decoration: none;
                        font-weight: 600;
                    }

                    .project-link:hover {
                        text-decoration: underline;
                        color: #90caf9;
                    }
                    
                    .skills-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                        gap: 25px;
                    }
                    
                    .skill-category {
                        background: #3a3a3a;
                        padding: 20px;
                        border-radius: 10px;
                    }

                    .skill-category h3 {
                        color: #64b5f6;
                        margin-bottom: 15px;
                        font-size: 1.1em;
                    }

                    .skill-item {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        padding: 8px 0;
                        border-bottom: 1px solid #4a4a4a;
                        color: #e0e0e0;
                    }

                    .skill-item:last-child {
                        border-bottom: none;
                    }
                    
                    .skill-level {
                        font-size: 0.85em;
                        padding: 3px 10px;
                        border-radius: 12px;
                        font-weight: 600;
                    }
                    
                    .level-beginner {
                        background: #ffc107;
                        color: #fff;
                    }
                    
                    .level-intermediate {
                        background: #2196f3;
                        color: #fff;
                    }
                    
                    .level-advanced {
                        background: #4caf50;
                        color: #fff;
                    }
                    
                    .level-expert {
                        background: #9c27b0;
                        color: #fff;
                    }
                    
                    .achievement-item {
                        background: #3a3a3a;
                        padding: 20px;
                        margin-bottom: 15px;
                        border-radius: 10px;
                    }

                    .achievement-item h3 {
                        color: #ffb74d;
                        margin-bottom: 8px;
                    }

                    .achievement-item p {
                        color: #b0b0b0;
                    }

                    .achievement-date {
                        color: #999;
                        font-size: 0.9em;
                        font-style: italic;
                    }

                    .activity-item {
                        background: #3a3a3a;
                        padding: 20px;
                        margin-bottom: 15px;
                        border-radius: 10px;
                    }

                    .activity-item h3 {
                        color: #66bb6a;
                        margin-bottom: 5px;
                    }

                    .activity-item p {
                        color: #b0b0b0;
                    }

                    .activity-role {
                        color: #aaa;
                        font-weight: 600;
                        margin-bottom: 8px;
                    }

                    .activity-duration {
                        color: #999;
                        font-size: 0.9em;
                        margin-bottom: 10px;
                    }

                    .about-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                        gap: 20px;
                    }

                    .about-item {
                        background: #3a3a3a;
                        padding: 20px;
                        border-radius: 10px;
                        text-align: center;
                        font-size: 1.1em;
                        font-weight: 600;
                        color: #ba68c8;
                    }

                    @media (max-width: 768px) {
                        .header h1 {
                            font-size: 1.8em;
                        }

                        .content {
                            padding: 20px;
                        }
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <div class="header">
                        <h1 class="my-name"><xsl:value-of select="student/firstName"/> <xsl:value-of select="student/lastName"/></h1>
                        <p><xsl:value-of select="student/program"/></p>
                        
                        <div class="contact-info">
                            <div class="contact-item">
                                <span><xsl:value-of select="student/email"/></span>
                            </div>
                            <div class="contact-item">
                                <span><xsl:value-of select="student/phone"/></span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="content">
                        <div class="section">
                            <h2 class="section-title">Academic Information</h2>
                            <div class="academic-grid">
                                <div class="academic-card">
                                    <h3>CUMULATIVE GWA</h3>
                                    <p><xsl:value-of select="academicInfo/gpa"/></p>
                                </div>
                                <div class="academic-card">
                                    <h3>Academic Year</h3>
                                    <p><xsl:value-of select="academicInfo/academicYear"/></p>
                                </div>
                                <div class="academic-card">
                                    <h3>Semester</h3>
                                    <p><xsl:value-of select="academicInfo/semester"/></p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="section">
                            <h2 class="section-title">Projects</h2>
                            <xsl:for-each select="projects/project">
                                <div class="project-card">
                                    <h3><xsl:value-of select="projectTitle"/></h3>
                                    <p><xsl:value-of select="description"/></p>
                                    <p><strong>Technologies: </strong><xsl:value-of select="technologies"/></p>
                                    <p><strong>Completed: </strong> <xsl:value-of select="dateCompleted"/></p>
                                    <p>
                                        <a href="{projectURL}" class="project-link" target="_blank">
                                            View Project
                                        </a>
                                    </p>
                                </div>
                            </xsl:for-each>
                        </div>
                        
                        <div class="section">
                            <h2 class="section-title">Skills</h2>
                            <div class="skills-grid">
                                <xsl:for-each select="skills/skillCategory">
                                    <div class="skill-category">
                                        <h3><xsl:value-of select="@name"/></h3>
                                        <xsl:for-each select="skill">
                                            <div class="skill-item">
                                                <span><xsl:value-of select="."/></span>
                                                <span>
                                                    <xsl:attribute name="class">
                                                        skill-level level-<xsl:value-of select="translate(@level, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
                                                    </xsl:attribute>
                                                    <xsl:value-of select="@level"/>
                                                </span>
                                            </div>
                                        </xsl:for-each>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </div>
                        
                        <div class="section">
                            <h2 class="section-title">Achievements</h2>
                            <xsl:for-each select="achievements/achievement">
                                <div class="achievement-item">
                                    <h3><xsl:value-of select="title"/></h3>
                                    <p><xsl:value-of select="description"/></p>
                                    <p class="achievement-date"><xsl:value-of select="date"/></p>
                                </div>
                            </xsl:for-each>
                        </div>
                        
                        <div class="section">
                            <h2 class="section-title">About Me</h2>
                            <div class="about-grid">
                                <xsl:for-each select="aboutMe/fact">
                                    <div class="about-item">
                                        <span><xsl:value-of select="."/></span>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </div>

                        <div class="section">
                            <h2 class="section-title">Organizations Affiliated With</h2>
                            <xsl:for-each select="extracurricular/activity">
                                <div class="activity-item">
                                    <h3><xsl:value-of select="activityName"/></h3>
                                    <p class="activity-role"><xsl:value-of select="role"/></p>
                                    <p class="activity-duration"><xsl:value-of select="duration"/></p>
                                    <p><xsl:value-of select="description"/></p>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    

</xsl:stylesheet>