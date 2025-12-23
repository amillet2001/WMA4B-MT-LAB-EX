<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="html" indent="yes" encoding="UTF-8" doctype-system="about:legacy-compat"/>

  <!-- Main Root Template -->
  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Portfolio | <xsl:value-of select="portfolio/metadata/n"/></title>
        
        <link href="https://fonts.googleapis.com/css2?family=Major+Mono+Display&amp;family=Space+Grotesk:wght@300;400;500;700&amp;display=swap" rel="stylesheet"/>
        
        <style>
          * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
          }

          :root {
            --text-dark: <xsl:value-of select="portfolio/themeConfig/colorScheme/darkTheme/textColor"/>;
            --bg-start-dark: <xsl:value-of select="portfolio/themeConfig/colorScheme/darkTheme/backgroundStartColor"/>;
            --bg-end-dark: <xsl:value-of select="portfolio/themeConfig/colorScheme/darkTheme/backgroundEndColor"/>;
            --card-dark: <xsl:value-of select="portfolio/themeConfig/colorScheme/darkTheme/cardBackgroundColor"/>;
            --border-dark: <xsl:value-of select="portfolio/themeConfig/colorScheme/darkTheme/borderColor"/>;
            --primary-dark: <xsl:value-of select="portfolio/themeConfig/colorScheme/darkTheme/primaryAccentColor"/>;
            --secondary-dark: <xsl:value-of select="portfolio/themeConfig/colorScheme/darkTheme/secondaryAccentColor"/>;

            --text-light: <xsl:value-of select="portfolio/themeConfig/colorScheme/lightTheme/textColor"/>;
            --bg-start-light: <xsl:value-of select="portfolio/themeConfig/colorScheme/lightTheme/backgroundStartColor"/>;
            --bg-end-light: <xsl:value-of select="portfolio/themeConfig/colorScheme/lightTheme/backgroundEndColor"/>;
            --card-light: <xsl:value-of select="portfolio/themeConfig/colorScheme/lightTheme/cardBackgroundColor"/>;
            --border-light: <xsl:value-of select="portfolio/themeConfig/colorScheme/lightTheme/borderColor"/>;
            --primary-light: <xsl:value-of select="portfolio/themeConfig/colorScheme/lightTheme/primaryAccentColor"/>;
            --secondary-light: <xsl:value-of select="portfolio/themeConfig/colorScheme/lightTheme/secondaryAccentColor"/>;
          }

          body {
            font-family: 'Space Grotesk', sans-serif;
            line-height: 1.8;
            color: var(--text-dark);
            padding: 80px 30px;
            max-width: 1200px;
            margin: 0 auto;
            min-height: 100vh;
            background: linear-gradient(135deg, var(--bg-start-dark) 0%, var(--bg-end-dark) 100%);
            background-size: 400% 400%;
            animation: gradientAnimation 15s ease infinite;
            transition: all 1s ease-in-out;
            position: relative;
            z-index: 1;
          }

          body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            opacity: 0.3;
            background-image: radial-gradient(circle, var(--primary-dark) 1px, transparent 1px), radial-gradient(circle, var(--secondary-dark) 1px, transparent 1px);
            background-size: 50px 50px;
            background-position: 0 0, 25px 25px;
            filter: blur(0.5px);
            transition: opacity 1s ease-in-out;
          }

          body.light-mode {
            color: var(--text-light);
            background: linear-gradient(135deg, var(--bg-start-light) 0%, var(--bg-end-light) 100%);
            animation: none;
          }

          body.light-mode::before {
            opacity: 0.1;
            background-image: radial-gradient(circle, var(--primary-light) 1px, transparent 1px), radial-gradient(circle, var(--secondary-light) 1px, transparent 1px);
          }

          @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
          }

          .header {
            text-align: center;
            margin-bottom: 80px;
            position: relative;
            z-index: 10;
          }

          .header h1 {
            font-family: 'Major Mono Display', monospace;
            font-size: 5.5em;
            font-weight: 400;
            letter-spacing: 5px;
            color: var(--primary-dark);
            text-shadow: 0 0 15px rgba(187, 134, 252, 0.4), 0 0 30px rgba(187, 134, 252, 0.2);
            transition: all 1s ease-in-out;
          }

          .header .title-role {
            font-size: 1.5em;
            font-weight: 300;
            color: var(--secondary-dark);
            letter-spacing: 2px;
            transition: all 1s ease-in-out;
          }

          body.light-mode .header h1 {
            color: var(--primary-light);
            text-shadow: none;
          }

          body.light-mode .header .title-role {
            color: var(--secondary-light);
          }

          .section {
            background-color: var(--card-dark);
            border-radius: 18px;
            padding: 45px;
            margin-bottom: 40px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.4);
            transition: all 0.3s ease;
            border: 1px solid var(--border-dark);
            position: relative;
            z-index: 2;
          }

          .section:hover {
            transform: translateY(-8px);
            box-shadow: 0 25px 55px rgba(0,0,0,0.6);
          }

          body.light-mode .section {
            background-color: var(--card-light);
            color: var(--text-light);
            border: 1px solid var(--border-light);
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
          }

          .section h2 {
            font-size: 2.8em;
            font-weight: 700;
            margin-bottom: 30px;
            color: var(--primary-dark);
            padding-bottom: 15px;
            border-bottom: 3px solid var(--secondary-dark);
            transition: all 1s ease-in-out;
          }

          body.light-mode .section h2 {
            color: var(--primary-light);
            border-bottom-color: var(--secondary-light);
          }

          .section p {
            font-size: 1.1em;
            margin-bottom: 18px;
          }

          .about-content {
    display: flex;
    gap: 20px; /* smaller gap */
    align-items: center; /* vertically aligned */
    flex-direction: row; /* FIXED */
}


          .about-text {
            flex: 2;
          }

          .about-image-container {
            flex: 1;
            display: flex;
            justify-content: flex-start;
          }

          .profile-image {
    width: 100%;
    max-width: 380px; /* bigger */
    border-radius: 12px;
    border: 3px solid var(--primary-dark);
    box-shadow: 0 5px 20px rgba(187, 134, 252, 0.4);
    transition: all 0.5s ease-in-out;
}


          body.light-mode .profile-image {
            border: 3px solid var(--primary-light);
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
          }

          a {
            color: var(--secondary-dark);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
          }

          a:hover {
            color: var(--primary-dark);
          }

          body.light-mode a {
            color: var(--secondary-light);
          }

          body.light-mode a:hover {
            color: var(--primary-light);
          }

          .skills-list {
            list-style: none;
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
          }

          .skill-tag {
            background-color: rgba(187, 134, 252, 0.1);
            border: 1px solid var(--border-dark);
            padding: 10px 25px;
            border-radius: 30px;
            font-size: 1em;
            font-weight: 500;
            color: var(--primary-dark);
            transition: all 0.3s ease;
          }

          .skill-tag:hover {
            background-color: var(--primary-dark);
            color: var(--text-dark);
            transform: translateY(-4px) scale(1.05);
          }

          body.light-mode .skill-tag {
            background-color: rgba(98, 0, 238, 0.1);
            border-color: var(--border-light);
            color: var(--primary-light);
          }

          body.light-mode .skill-tag:hover {
            background-color: var(--primary-light);
            color: var(--text-light);
          }

          .projects-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 20px;
          }

          .project-card {
            background-color: var(--card-dark);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 15px 40px rgba(0,0,0,0.4);
            border: 1px solid var(--border-dark);
            transition: all 0.3s ease;
            text-decoration: none;
          }

          .project-card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: 0 20px 45px rgba(0,0,0,0.6);
          }

          .project-thumbnail {
            width: 100%;
            height: 200px;
            background-size: cover;
            background-position: center;
            transition: transform 0.4s ease-in-out;
          }

          .project-card:hover .project-thumbnail {
            transform: scale(1.1);
          }

          .project-info {
            padding: 25px;
            color: var(--text-dark);
          }

          .project-info h3 {
            font-size: 1.6em;
            font-weight: 700;
            margin-bottom: 10px;
            color: var(--primary-dark);
          }

          .project-card:hover .project-info h3 {
            color: var(--secondary-dark);
          }

          .project-info p {
            font-size: 0.95em;
            line-height: 1.6;
          }

          body.light-mode .project-card {
            background-color: var(--card-light);
            border-color: var(--border-light);
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
          }

          body.light-mode .project-info {
            color: var(--text-light);
          }

          body.light-mode .project-info h3 {
            color: var(--primary-light);
          }

          .theme-toggle-container {
            text-align: center;
            margin-top: 50px;
            position: sticky;
            bottom: 30px;
            z-index: 100;
          }

          .theme-button {
            background: linear-gradient(45deg, var(--primary-dark), var(--secondary-dark));
            color: var(--text-dark);
            border: none;
            padding: 15px 35px;
            cursor: pointer;
            border-radius: 40px;
            font-family: 'Space Grotesk', sans-serif;
            font-weight: 700;
            font-size: 1.2em;
            box-shadow: 0 10px 30px rgba(0,0,0,0.4);
            transition: all 0.4s ease;
            letter-spacing: 1px;
          }

          .theme-button:hover {
            transform: translateY(-5px) scale(1.04);
            box-shadow: 0 18px 40px rgba(0,0,0,0.6);
          }

          body.light-mode .theme-button {
            background: linear-gradient(45deg, var(--primary-light), var(--secondary-light));
            color: var(--text-light);
          }

          @media (max-width: 992px) {
            .header h1 { font-size: 4.5em; }
            .about-content { flex-direction: column; }
            .profile-image { max-width: 80%; }
          }

          @media (max-width: 768px) {
            body { padding: 50px 20px; }
            .header h1 { font-size: 3.5em; }
          }

          @media (max-width: 480px) {
            body { padding: 30px 15px; }
            .header h1 { font-size: 2.8em; }
          }
        </style>
      </head>
      <body>
        <header class="header">
          <h1>Hi there! <br/> I'm <xsl:value-of select="portfolio/metadata/n"/></h1>
          <p class="title-role"><xsl:value-of select="portfolio/metadata/title"/></p>
        </header>

        <main>
          <!-- About Section Template -->
          <xsl:call-template name="aboutTemplate"/>
          
          <!-- Skills Section Template -->
          <xsl:call-template name="skillsTemplate"/>
          
          <!-- Projects Section Template -->
          <xsl:call-template name="projectsTemplate"/>
          
          <!-- Theme Toggle Template -->
          <xsl:call-template name="themeToggleTemplate"/>
          
          <!-- Contact Section Template -->
          <xsl:call-template name="contactTemplate"/>
        </main>

        <script>
          let isLightMode = false;
          function toggleTheme() {
            const btn = document.querySelector('.theme-button');
            if (document.body.classList.contains('light-mode')) {
              document.body.classList.remove('light-mode');
              btn.textContent = '🌞 Step into Light';
            } else {
              document.body.classList.add('light-mode');
              btn.textContent = '🌙 Embrace the Dark';
            }
          }
        </script>
      </body>
    </html>
  </xsl:template>

  <!-- About Section Template -->
  <xsl:template name="aboutTemplate">
    <section id="about" class="section">
      <h2>About Me</h2>
      <div class="about-content">
        <div class="about-text">
          <p><xsl:value-of select="portfolio/about/intro"/></p>
          <p><xsl:value-of select="portfolio/about/description"/></p>
        </div>
        <div class="about-image-container">
          <img class="profile-image" alt="Profile Photo">
            <xsl:attribute name="src"><xsl:value-of select="portfolio/about/profileImage"/></xsl:attribute>
          </img>
        </div>
      </div>
    </section>
  </xsl:template>

  <!-- Skills Section Template -->
  <xsl:template name="skillsTemplate">
    <section id="skills" class="section">
      <h2>Skills &amp; Expertise</h2>
      <ul class="skills-list">
        <xsl:for-each select="portfolio/skillsSection/skill">
          <li class="skill-tag"><xsl:value-of select="."/></li>
        </xsl:for-each>
      </ul>
    </section>
  </xsl:template>

  <!-- Projects Section Template -->
  <xsl:template name="projectsTemplate">
    <section id="projects" class="section">
      <h2>Featured Projects</h2>
      <div class="projects-grid">
        <xsl:for-each select="portfolio/projectsSection/project">
          <a class="project-card" target="_blank" rel="noopener noreferrer">
            <xsl:attribute name="href"><xsl:value-of select="projectLink"/></xsl:attribute>
            <div class="project-thumbnail">
              <xsl:attribute name="style">background-image: url(<xsl:value-of select="projectImage"/>)</xsl:attribute>
            </div>
            <div class="project-info">
              <h3><xsl:value-of select="projectTitle"/></h3>
              <p><xsl:value-of select="projectDescription"/></p>
            </div>
          </a>
        </xsl:for-each>
      </div>
    </section>
  </xsl:template>

  <!-- Theme Toggle Template -->
  <xsl:template name="themeToggleTemplate">
    <div class="theme-toggle-container">
      <button class="theme-button" onclick="toggleTheme()">🌞 Step into Light</button>
    </div>
  </xsl:template>

  <!-- Contact Section Template -->
  <xsl:template name="contactTemplate">
    <section id="contact" class="section">
      <h2>Connect With Me</h2>
      <p>Email: <a>
        <xsl:attribute name="href">mailto:<xsl:value-of select="portfolio/metadata/email"/></xsl:attribute>
        <xsl:value-of select="portfolio/metadata/email"/>
      </a></p>
      <p>LinkedIn: <a href="https://linkedin.com/in/santiago" target="_blank" rel="noopener noreferrer"><xsl:value-of select="portfolio/metadata/social/linkedin"/></a></p>
      <p>GitHub: <a href="https://github.com/santiago" target="_blank" rel="noopener noreferrer"><xsl:value-of select="portfolio/metadata/social/github"/></a></p>
    </section>
  </xsl:template>

</xsl:stylesheet>