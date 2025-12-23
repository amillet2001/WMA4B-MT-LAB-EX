<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Edralyn Portfolio</title>
                <style>
                    body {
                        font-family: 'Arial', sans-serif;
                        margin: 0;
                        padding: 0;
                        line-height: 1.6;
                        color: #333;
                        background-color: #f9f9f9;
                    }
                    
                    h1, h2, h3 {
                        margin-bottom: 10px;
                        color: #2c3e50;
                    }
                    
                    p {
                        margin: 0 0 15px;
                    }
                    
                    a {
                        color: #3498db;
                        text-decoration: none;
                    }
                    
                    a:hover {
                        text-decoration: underline;
                    }
                    
                    /* Header and Navbar */
                    header {
                        background-color: #2c3e50;
                        color: white;
                        padding: 10px 20px;
                        position: fixed;
                        width: 100%;
                        top: 0;
                        z-index: 1000;
                        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                    }
                    
                    .navbar {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        max-width: 1200px;
                        margin: 0 auto;
                    }
                    
                    .logo {
                        font-size: 1.5em;
                        font-weight: bold;
                    }
                    
                    .logo span {
                        color: #3498db;
                    }
                    
                    .nav-links {
                        list-style: none;
                        display: flex;
                        gap: 20px;
                        margin: 0;
                        padding: 0;
                    }
                    
                    .nav-links li a {
                        color: white;
                        font-weight: 500;
                        transition: color 0.3s;
                    }
                    
                    .nav-links li a:hover {
                        color: #3498db;
                    }
                    
                    /* Sections */
                    .section {
                        padding: 80px 20px 40px; /* Extra top padding for fixed navbar */
                        max-width: 1200px;
                        margin: 0 auto;
                        text-align: center;
                    }
                    
                    .section:nth-child(even) {
                        background-color: #ecf0f1;
                    }
                    
                    /* About Section */
                    .content {
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        gap: 30px;
                        flex-wrap: wrap;
                    }
                    
                    .profile-pic {
                        width: 150px;
                        height: 150px;
                        border-radius: 50%;
                        object-fit: cover;
                        border: 3px solid #3498db;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    }
                    
                    .text {
                        max-width: 500px;
                        text-align: left;
                    }
                    
                    .text h1 {
                        font-size: 2em;
                    }
                    
                    /* Skills Section */
                    .skills-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
                        gap: 20px;
                        margin-top: 20px;
                    }
                    
                    .skill-card {
                        background-color: #3498db;
                        color: white;
                        padding: 20px;
                        border-radius: 8px;
                        font-weight: bold;
                        transition: transform 0.3s, box-shadow 0.3s;
                    }
                    
                    .skill-card:hover {
                        transform: translateY(-5px);
                        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
                    }
                    
                    /* Projects Section */
                    .projects-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                        gap: 20px;
                        margin-top: 20px;
                    }
                    
                    .project-card {
                        background-color: white;
                        padding: 20px;
                        border-radius: 8px;
                        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                        transition: transform 0.3s;
                    }
                    
                    .project-card:hover {
                        transform: translateY(-5px);
                    }
                    
                    .project-card h3 {
                        color: #2c3e50;
                        margin-bottom: 10px;
                    }
                    
                    /* Contact Section */
                    .contact p {
                        font-size: 1.1em;
                        margin: 10px 0;
                    }
                    
                    /* Footer */
                    footer {
                        background-color: #2c3e50;
                        color: white;
                        text-align: center;
                        padding: 20px;
                        margin-top: 40px;
                    }
                    
                    footer p {
                        margin: 0;
                        font-size: 0.9em;
                    }
                    
                    /* Responsiveness */
                    @media (max-width: 768px) {
                        .navbar {
                            flex-direction: column;
                            gap: 10px;
                        }
                        
                        .nav-links {
                            gap: 10px;
                        }
                        
                        .content {
                            flex-direction: column;
                            text-align: center;
                        }
                        
                        .text {
                            text-align: center;
                        }
                        
                        .skills-grid, .projects-grid {
                            grid-template-columns: 1fr;
                        }
                        
                        .section {
                            padding: 60px 10px 20px;
                        }
                    }
                    
                    @media (max-width: 480px) {
                        .logo {
                            font-size: 1.2em;
                        }
                        
                        .profile-pic {
                            width: 120px;
                            height: 120px;
                        }
                        
                        h1 {
                            font-size: 1.5em;
                        }
                    }
                </style>
            </head>
            <body>
                <header>
                    <nav class="navbar">
                        <h2 class="logo">
                            <xsl:value-of select="portfolio/header/logo"/>
                        </h2>
                        <ul class="nav-links">
                            <xsl:for-each select="portfolio/header/navLinks/link">
                                <li>
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="@href"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="."/>
                                    </a>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </nav>
                </header>
                
                <xsl:for-each select="portfolio/sections/section">
                    <section>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                        <xsl:attribute name="class">section</xsl:attribute>
                        <xsl:if test="@id = 'about'">
                            <div class="content">
                                <img class="profile-pic">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="profilePic/@src"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:value-of select="profilePic/@alt"/>
                                    </xsl:attribute>
                                </img>
                                <div class="text">
                                    <h1>
                                        <xsl:value-of select="text/heading"/>
                                    </h1>
                                    <p>
                                        <xsl:value-of select="text/paragraph" disable-output-escaping="yes"/>
                                    </p>
                                </div>
                            </div>
                        </xsl:if>
                        <xsl:if test="@id = 'skills'">
                            <h1>
                                <xsl:value-of select="heading"/>
                            </h1>
                            <div class="skills-grid">
                                <xsl:for-each select="skillsGrid/skill">
                                    <div class="skill-card">
                                        <xsl:value-of select="."/>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </xsl:if>
                        <xsl:if test="@id = 'projects'">
                            <h1>
                                <xsl:value-of select="heading"/>
                            </h1>
                            <div class="projects-grid">
                                <xsl:for-each select="projectsGrid/project">
                                    <div class="project-card">
                                        <h3>
                                            <xsl:value-of select="title"/>
                                        </h3>
                                        <p>
                                            <xsl:value-of select="description"/>
                                        </p>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </xsl:if>
                        <xsl:if test="@id = 'contact'">
                            <h1>
                                <xsl:value-of select="heading"/>
                            </h1>
                            <p>📧 Email: <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="contactInfo/email/@href"/>
                                </xsl:attribute>
                                <xsl:value-of select="contactInfo/email"/>
                            </a></p>
                            <p>🌐 GitHub: <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="contactInfo/github/@href"/>
                                </xsl:attribute>
                                <xsl:attribute name="target">
                                    <xsl:value-of select="contactInfo/github/@target"/>
                                </xsl:attribute>
                                <xsl:value-of select="contactInfo/github"/>
                            </a></p>
                        </xsl:if>
                    </section>
                </xsl:for-each>
                
                <footer>
                    <p>
                        <xsl:value-of select="portfolio/footer/copyright" disable-output-escaping="yes"/>
                    </p>
                </footer>
                
                <script>
                    <xsl:attribute name="src">
                        <xsl:value-of select="portfolio/assets/script/@src"/>
                    </xsl:attribute>
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
