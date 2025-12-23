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
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        background: #1a1a1a;
                        padding: 0;
                        min-height: 100vh;
                        overflow-x: hidden;
                    }
                    
                    .sidebar {
                        position: fixed;
                        left: 0;
                        top: 0;
                        width: 320px;
                        height: 100vh;
                        background: linear-gradient(180deg, #d35400 0%, #c56918ff 100%);
                        padding: 40px 30px;
                        color: white;
                        overflow-y: auto;
                        overflow-x: hidden;
                        box-shadow: 4px 0 20px rgba(0,0,0,0.3);
                        z-index: 1000;
                    }
                    
                    .sidebar::-webkit-scrollbar {
                        width: 8px;
                    }
                    
                    .sidebar::-webkit-scrollbar-track {
                        background: rgba(0,0,0,0.2);
                    }
                    
                    .sidebar::-webkit-scrollbar-thumb {
                        background: rgba(0,0,0,0.4);
                        border-radius: 4px;
                    }
                    
                    .sidebar::-webkit-scrollbar-thumb:hover {
                        background: rgba(0,0,0,0.6);
                    }
                    
                    .profile-section {
                        text-align: center;
                        margin-bottom: 40px;
                        padding-bottom: 30px;
                        border-bottom: 2px solid rgba(255,255,255,0.2);
                    }
                    
                    .profile-initial {
                        width: 120px;
                        height: 120px;
                        background: rgba(255,255,255,0.2);
                        border: 4px solid white;
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 3em;
                        font-weight: bold;
                        margin: 0 auto 20px;
                        box-shadow: 0 8px 16px rgba(0,0,0,0.2);
                    }
                    
                    .profile-name {
                        font-size: 1.6em;
                        font-weight: 600;
                        margin-bottom: 8px;
                        line-height: 1.3;
                    }
                    
                    .profile-id {
                        font-size: 0.9em;
                        opacity: 0.9;
                        letter-spacing: 1px;
                        font-family: 'Courier New', monospace;
                    }
                    
                    .sidebar-section {
                        margin-bottom: 35px;
                    }
                    
                    .sidebar-title {
                        font-size: 0.85em;
                        text-transform: uppercase;
                        letter-spacing: 2px;
                        margin-bottom: 15px;
                        opacity: 0.8;
                        font-weight: 600;
                    }
                    
                    .sidebar-content {
                        font-size: 0.95em;
                        line-height: 1.6;
                    }
                    
                    .sidebar-item {
                        background: rgba(255,255,255,0.1);
                        padding: 12px 15px;
                        border-radius: 8px;
                        margin-bottom: 10px;
                        backdrop-filter: blur(10px);
                        word-wrap: break-word;
                        overflow-wrap: break-word;
                    }
                    
                    .main-content {
                        margin-left: 320px;
                        padding: 0;
                        min-height: 100vh;
                    }
                    
                    .hero-banner {
                        background: linear-gradient(135deg, #2c2c2c 0%, #1a1a1a 50%, #2c2c2c 100%);
                        padding: 80px 60px;
                        color: white;
                        position: relative;
                        overflow: hidden;
                        border-bottom: 4px solid #d35400;
                    }
                    
                    .hero-banner::before {
                        content: '';
                        position: absolute;
                        top: -50%;
                        right: -10%;
                        width: 500px;
                        height: 500px;
                        background: rgba(211, 84, 0, 0.1);
                        border-radius: 50%;
                    }
                    
                    .hero-banner::after {
                        content: '';
                        position: absolute;
                        bottom: -30%;
                        left: -5%;
                        width: 400px;
                        height: 400px;
                        background: rgba(230, 126, 34, 0.08);
                        border-radius: 50%;
                    }
                    
                    .hero-content {
                        position: relative;
                        z-index: 1;
                    }
                    
                    .hero-title {
                        font-size: 3.5em;
                        font-weight: 700;
                        margin-bottom: 15px;
                        text-shadow: 2px 2px 8px rgba(0,0,0,0.3);
                    }
                    
                    .hero-subtitle {
                        font-size: 1.5em;
                        opacity: 0.95;
                        font-weight: 300;
                    }
                    
                    .content-area {
                        background: #2c2c2c;
                        padding: 60px;
                    }
                    
                    .card-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                        gap: 30px;
                        margin-bottom: 50px;
                    }
                    
                    .info-card {
                        background: #1a1a1a;
                        padding: 30px;
                        border-radius: 15px;
                        box-shadow: 0 5px 20px rgba(0,0,0,0.5);
                        border-top: 4px solid #d35400;
                        position: relative;
                    }
                    
                    .info-card::before {
                        content: '';
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        background: linear-gradient(135deg, #d35400 0%, transparent 100%);
                        opacity: 0;
                        border-radius: 15px;
                        z-index: 0;
                    }
                    
                    .card-icon {
                        width: 50px;
                        height: 50px;
                        background: linear-gradient(135deg, #d35400 0%, #e67e22 100%);
                        border-radius: 12px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        color: white;
                        font-size: 1.5em;
                        margin-bottom: 20px;
                        position: relative;
                        z-index: 1;
                    }
                    
                    .card-label {
                        font-size: 0.85em;
                        color: #d35400;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                        font-weight: 600;
                        margin-bottom: 10px;
                        position: relative;
                        z-index: 1;
                    }
                    
                    .card-value {
                        font-size: 1.1em;
                        color: #e0e0e0;
                        line-height: 1.6;
                        position: relative;
                        z-index: 1;
                    }
                    
                    .section-header {
                        margin-bottom: 40px;
                    }
                    
                    .section-title {
                        font-size: 2.5em;
                        color: #d35400;
                        margin-bottom: 10px;
                        position: relative;
                        display: inline-block;
                    }
                    
                    .section-title::after {
                        content: '';
                        position: absolute;
                        bottom: -8px;
                        left: 0;
                        width: 60px;
                        height: 4px;
                        background: linear-gradient(90deg, #d35400 0%, #e67e22 100%);
                        border-radius: 2px;
                    }
                    
                    .section-subtitle {
                        color: #aaa;
                        font-size: 1.1em;
                        margin-top: 15px;
                    }
                    
                    .gpa-card {
                        background: linear-gradient(135deg, #d35400 0%, #e67e22 100%);
                        padding: 50px;
                        border-radius: 20px;
                        text-align: center;
                        color: white;
                        box-shadow: 0 5px 15px rgba(211, 84, 0, 0.4);
                        position: relative;
                        overflow: hidden;
                        margin: 40px 0;
                    }
                    
                    .gpa-card::before {
                        content: '';
                        position: absolute;
                        top: -50px;
                        right: -50px;
                        width: 200px;
                        height: 200px;
                        background: rgba(255,255,255,0.1);
                        border-radius: 50%;
                    }
                    
                    .gpa-label {
                        font-size: 1.1em;
                        text-transform: uppercase;
                        letter-spacing: 3px;
                        margin-bottom: 20px;
                        opacity: 0.9;
                        position: relative;
                        z-index: 1;
                    }
                    
                    .gpa-value {
                        font-size: 5em;
                        font-weight: 700;
                        position: relative;
                        z-index: 1;
                        text-shadow: 2px 2px 8px rgba(0,0,0,0.2);
                    }
                    
                    .gpa-scale {
                        font-size: 1em;
                        margin-top: 10px;
                        opacity: 0.8;
                        position: relative;
                        z-index: 1;
                    }
                    
                    .skills-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                        gap: 30px;
                        margin-top: 30px;
                    }
                    
                    .skill-category {
                        background: #1a1a1a;
                        padding: 35px;
                        border-radius: 15px;
                        box-shadow: 0 5px 20px rgba(0,0,0,0.5);
                    }
                    
                    .skill-category-title {
                        font-size: 1.4em;
                        color: #e0e0e0;
                        margin-bottom: 25px;
                        padding-bottom: 15px;
                        border-bottom: 2px solid #3a3a3a;
                        display: flex;
                        align-items: center;
                    }
                    
                    .skill-category-title::before {
                        content: '▸';
                        color: #d35400;
                        margin-right: 10px;
                        font-size: 1.2em;
                    }
                    
                    .skill-list {
                        display: flex;
                        flex-direction: column;
                        gap: 15px;
                    }
                    
                    .skill-item {
                        display: flex;
                        align-items: center;
                        justify-content: space-between;
                        padding: 12px 0;
                    }
                    
                    .skill-name {
                        font-size: 1.05em;
                        color: #e0e0e0;
                        font-weight: 500;
                    }
                    
                    .skill-level {
                        padding: 6px 14px;
                        border-radius: 20px;
                        font-size: 0.8em;
                        font-weight: 600;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                    }
                    
                    .skill-level.advanced {
                        background: #2d5016;
                        color: #7ed321;
                    }
                    
                    .skill-level.intermediate {
                        background: #5a3a0d;
                        color: #ffb84d;
                    }
                    
                    .skill-level.beginner {
                        background: #0d3a5a;
                        color: #4da6ff;
                    }
                    
                    .soft-skills {
                        display: grid;
                        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                        gap: 15px;
                    }
                    
                    .soft-skill-badge {
                        background: #1a1a1a;
                        padding: 18px 24px;
                        border-radius: 12px;
                        text-align: center;
                        font-weight: 500;
                        color: #e0e0e0;
                        border: 2px solid #d35400;
                        box-shadow: 0 3px 10px rgba(0,0,0,0.5);
                    }
                    
                    @media (max-width: 1024px) {
                        .sidebar {
                            width: 280px;
                        }
                        
                        .main-content {
                            margin-left: 280px;
                        }
                        
                        .content-area {
                            padding: 40px;
                        }
                    }
                    
                    @media (max-width: 768px) {
                        .sidebar {
                            position: relative;
                            width: 100%;
                            height: auto;
                        }
                        
                        .main-content {
                            margin-left: 0;
                        }
                        
                        .hero-banner {
                            padding: 50px 30px;
                        }
                        
                        .hero-title {
                            font-size: 2.5em;
                        }
                        
                        .content-area {
                            padding: 30px 20px;
                        }
                        
                        .gpa-value {
                            font-size: 3.5em;
                        }
                    }
                    
                    @media print {
                        body {
                            background: white;
                        }
                        
                        .sidebar {
                            position: relative;
                            width: 100%;
                            height: auto;
                            page-break-after: always;
                        }
                        
                        .main-content {
                            margin-left: 0;
                        }
                    }
                </style>
            </head>
            <body>
                <xsl:apply-templates select="portfolio/student"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="student">
        <div class="sidebar">
            <div class="profile-section">
                <div class="profile-initial">
                    <xsl:value-of select="substring(personalInfo/firstName, 1, 1)"/>
                    <xsl:value-of select="substring(personalInfo/lastName, 1, 1)"/>
                </div>
                <div class="profile-name">
                    <xsl:value-of select="personalInfo/firstName"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="personalInfo/lastName"/>
                </div>
                <div class="profile-id">ID: <xsl:value-of select="studentID"/></div>
            </div>
            
            <div class="sidebar-section">
                <div class="sidebar-title">Contact</div>
                <div class="sidebar-item">
                    <div style="opacity: 0.8; font-size: 0.85em; margin-bottom: 3px;">Email</div>
                    <div><xsl:value-of select="personalInfo/email"/></div>
                </div>
                <div class="sidebar-item">
                    <div style="opacity: 0.8; font-size: 0.85em; margin-bottom: 3px;">Phone</div>
                    <div><xsl:value-of select="personalInfo/phone"/></div>
                </div>
            </div>
            
            <div class="sidebar-section">
                <div class="sidebar-title">Location</div>
                <div class="sidebar-item">
                    <xsl:value-of select="personalInfo/address/street"/><br/>
                    <xsl:value-of select="personalInfo/address/city"/>, 
                    <xsl:value-of select="personalInfo/address/province"/><br/>
                    <xsl:value-of select="personalInfo/address/zipCode"/><br/>
                    <xsl:value-of select="personalInfo/address/country"/>
                </div>
            </div>
            
            <div class="sidebar-section">
                <div class="sidebar-title">Personal Details</div>
                <div class="sidebar-item">
                    <div style="opacity: 0.8; font-size: 0.85em; margin-bottom: 3px;">Date of Birth</div>
                    <div><xsl:value-of select="personalInfo/dateOfBirth"/></div>
                </div>
                <div class="sidebar-item">
                    <div style="opacity: 0.8; font-size: 0.85em; margin-bottom: 3px;">Gender</div>
                    <div><xsl:value-of select="personalInfo/gender"/></div>
                </div>
            </div>
        </div>
        
        <div class="main-content">
            <div class="hero-banner">
                <div class="hero-content">
                    <div class="hero-title">Student Portfolio</div>
                    <div class="hero-subtitle"><xsl:value-of select="academicInfo/program"/></div>
                </div>
            </div>
            
            <div class="content-area">
                <div class="section-header">
                    <h2 class="section-title">Academic Overview</h2>
                    <p class="section-subtitle">Current academic standing and performance</p>
                </div>
                
                <div class="card-grid">
                    <div class="info-card">
                        <div class="card-icon">🎓</div>
                        <div class="card-label">Program</div>
                        <div class="card-value"><xsl:value-of select="academicInfo/program"/></div>
                    </div>
                    
                    <div class="info-card">
                        <div class="card-icon">📚</div>
                        <div class="card-label">Year Level</div>
                        <div class="card-value">Year <xsl:value-of select="academicInfo/yearLevel"/></div>
                    </div>
                    
                    <div class="info-card">
                        <div class="card-icon">👤</div>
                        <div class="card-label">Full Name</div>
                        <div class="card-value">
                            <xsl:value-of select="personalInfo/firstName"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="personalInfo/middleName"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="personalInfo/lastName"/>
                        </div>
                    </div>
                </div>
                
                <div class="gpa-card">
                    <div class="gpa-label">General Point Average</div>
                    <div class="gpa-value"><xsl:value-of select="academicInfo/gpa"/></div>
                    <div class="gpa-scale">Out of 5.0</div>
                </div>
                
                <div class="section-header" style="margin-top: 60px;">
                    <h2 class="section-title">Skills &amp; Competencies</h2>
                    <p class="section-subtitle">Technical expertise and interpersonal abilities</p>
                </div>
                
                <div class="skills-grid">
                    <div class="skill-category">
                        <h3 class="skill-category-title">Technical Skills</h3>
                        <div class="skill-list">
                            <xsl:for-each select="skills/technicalSkills/skill">
                                <div class="skill-item">
                                    <span class="skill-name"><xsl:value-of select="."/></span>
                                    <span>
                                        <xsl:attribute name="class">
                                            skill-level <xsl:value-of select="translate(@level, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="@level"/>
                                    </span>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                    
                    <div class="skill-category">
                        <h3 class="skill-category-title">Soft Skills</h3>
                        <div class="soft-skills">
                            <xsl:for-each select="skills/softSkills/skill">
                                <div class="soft-skill-badge">
                                    <xsl:value-of select="."/>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>