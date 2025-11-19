<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        
        <html lang="en">
            
            <head>
                <title><xsl:value-of select="portfolio/personal_info/name"/> | Portfolio</title>
                
                <style>
                    body {
                    margin: 0;
                    font-family: "Poppins", sans-serif;
                    background: #e9f3ff;
                    }
                    
                    header {
                    background: linear-gradient(135deg, #1e88e5, #0d47a1);
                    padding: 3rem 1rem;
                    color: white;
                    text-align: center;
                    position: relative;
                    }
                    
                    .profile-pic {
                    width: 130px;
                    height: 130px;
                    border-radius: 50%;
                    border: 4px solid white;
                    object-fit: cover;
                    box-shadow: 0 4px 10px rgba(0,0,0,0.3);
                    position: absolute;
                    right: 40px;
                    top: 40px;
                    }
                    
                    h1 {
                    margin: 0;
                    font-size: 2.6rem;
                    font-weight: 700;
                    }
                    
                    nav {
                    background: #1565c0;
                    padding: 1rem;
                    text-align: center;
                    }
                    
                    nav a {
                    padding: 0.7rem 1.2rem;
                    margin: 0 0.5rem;
                    background: #0d47a1;
                    color: white;
                    text-decoration: none;
                    border-radius: 6px;
                    font-weight: 600;
                    transition: 0.2s;
                    }
                    
                    nav a:hover {
                    background: #2196f3;
                    }
                    
                    section {
                    background: white;
                    width: 85%;
                    max-width: 900px;
                    margin: 2rem auto;
                    padding: 1.8rem;
                    border-radius: 12px;
                    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
                    }
                    
                    h2 {
                    margin-bottom: 1rem;
                    color: #0d47a1;
                    font-size: 1.8rem;
                    }
                    
                    ul {
                    padding-left: 1rem;
                    list-style: none;
                    }
                    
                    ul li {
                    padding: 0.5rem 0 0.5rem 1.2rem;
                    position: relative;
                    }
                    
                    ul li::before {
                    content: "●";
                    color: #1565c0;
                    font-size: 1rem;
                    position: absolute;
                    left: 0;
                    }
                    
                    footer {
                    background: #0d47a1;
                    color: white;
                    text-align: center;
                    padding: 1.3rem;
                    margin-top: 2rem;
                    }
                </style>
                
            </head>
            
            <body>
                
                <!-- HEADER -->
                <header>
                    <!-- Profile picture: change the path in your XML under <profile_picture_src> -->
                    <h1><xsl:value-of select="portfolio/personal_info/name"/></h1>
                    <p><xsl:value-of select="portfolio/personal_info/title"/></p>
                </header>
                
                <!-- NAVIGATION -->
                <nav>
                    <xsl:for-each select="portfolio/section">
                        <a href="#{@id}">
                            <xsl:value-of select="title"/>
                        </a>
                    </xsl:for-each>
                </nav>
                
                <!-- SECTIONS -->
                <xsl:for-each select="portfolio/section">
                    <section id="{@id}">
                        <h2><xsl:value-of select="title"/></h2>
                        
                        <!-- Paragraph -->
                        <xsl:if test="paragraph">
                            <p><xsl:value-of select="paragraph"/></p>
                        </xsl:if>
                        
                        <!-- List -->
                        <xsl:if test="list">
                            <ul>
                                <xsl:for-each select="list/item">
                                    <li><xsl:value-of select="."/></li>
                                </xsl:for-each>
                            </ul>
                        </xsl:if>
                        
                        <!-- Contact -->
                        <xsl:if test="contact_details">
                            <ul>
                                <xsl:for-each select="contact_details/detail">
                                    <li>
                                        <strong><xsl:value-of select="@type"/>:</strong>
                                        <xsl:choose>
                                            <xsl:when test="@href">
                                                <a href="{@href}">
                                                    <xsl:value-of select="."/>
                                                </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="."/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </xsl:if>
                    </section>
                </xsl:for-each>
                
                <!-- FOOTER -->
                <footer>
                    <p><xsl:value-of select="portfolio/footer/copyright"/></p>
                </footer>
                
            </body>
        </html>
        
    </xsl:template>
    
</xsl:stylesheet>
