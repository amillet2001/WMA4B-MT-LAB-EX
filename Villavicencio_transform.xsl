<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">

    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title><xsl:value-of select="portfolio/personal/name"/></title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&amp;display=swap" rel="stylesheet"/>
        <style>
          <xsl:text disable-output-escaping="yes"><![CDATA[
            
            :root{
              --bg:#050506;
              --panel:#0e0f11;
              --muted:#9fb3d2;
              --accent:#6ea8ff;
              --text:#e7eefc;
              --card:#0b0c0d;
              --border: rgba(255,255,255,0.04);
            }
              
            html,body{
            height:100%;
            margin:0;
            padding:0;
            background:var(--bg);
            color:var(--text);
            font-family:"Inter",system-ui,-apple-system,"Segoe UI",Roboto,Arial,sans-serif;
            -webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale; 
            }

            .container{
            max-width:1100px;
            margin:0 auto;
            padding:48px 20px;
            }

            header{
            background:transparent;
            position:sticky;
            top:0;
            z-index:999;
            padding:12px 0;
            border-bottom:1px solid var(--border);
            }

            .nav{
            display:flex;
            align-items:center;
            justify-content:space-between;
            padding:0 6px;
            }

            .logo{
            font-weight:700;
            color:var(--accent);
            letter-spacing:0.2px;
            }

            .nav-list{
            display:flex;
            gap:18px;
            list-style:none;
            margin:0;
            padding:0;
            }

            .nav-link{
            color:var(--muted);
            text-decoration:none;
            font-weight:500;
            transition:color .18s ease;
            }

            .nav-link:hover{
            color:var(--text);
            }

        
            .section{
            padding:64px 0;
            }
            
            #about, #education, #skills, #hobbies, #contact{
            background:transparent;
            }
            
            #about .container, #education .container, #skills .container, #hobbies .container, #contact .container {
              background: linear-gradient(180deg,var(--panel), rgba(14,15,17,0.95)); 
              padding:36px; 
              border-radius:12px; 
              box-shadow: 0 8px 30px rgba(0,0,0,0.6);
            }

            .hero{
            padding:96px 20px;
            text-align:center;
            background:linear-gradient(180deg,#070708,#0b0c0d);
            }

            .hero-title{
            font-size:2.8rem;
            color:var(--accent);
            margin:0 0 10px;
            }

            .hero-subtitle{
            font-size:1.25rem;
            color:var(--muted);
            margin:0 0 18px;
            }

            .hero p{
            max-width:900px;
            margin:0 auto;
            color:#cfe6ff;
            }

            .about-content{
            display:grid;
            grid-template-columns:1fr 420px;
            gap:28px;
            align-items:center;
            }

            .profile-image{
            width:100%;
            height:auto;
            border-radius:10px;
            border:1px solid var(--border);
            box-shadow:0 6px 20px rgba(0,0,0,0.6);
            }

          
            .timeline-item, .skill-category, .hobby-card, .contact-item{
              background:var(--card); 
              color:var(--text); 
              border:1px solid var(--border); 
              padding:18px; 
              border-radius:10px; 
              margin-bottom:14px;
              box-shadow: 0 6px 18px rgba(2,6,12,0.6);
            }

            .timeline-item strong, .skill-category h3, .hobby-card h3{
            color:var(--text);
            }

            .timeline-item{
            border-left:4px solid var(--accent);
            }

            .skills-grid{
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
            gap:16px;
            }

            .hobbies-grid{
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
            gap:16px;
            }

            
            #contact{
            padding-top:36px;
            padding-bottom:36px;
            }

            .contact-info { 
            display: flex; 
            flex-direction: 
            column; gap: 0; 
            }

            .contact-item { 
            display: flex; 
            align-items: center; 
            gap: 10px; 
            font-size: 16px; 
            padding: 0; 
            margin: 0; 
            background: none; 
            border: none; 
            box-shadow: none; 
            }

            .contact-item i { 
            display: none; 
            }

            .contact-item strong { 
            color: var(--text); 
            }

            .contact-item span { 
            color: var(--text); 
            }

            .contact-item a { 
            color: var(--accent); 
            text-decoration: none; 
            transition: color 0.3s ease; 
            }

            .contact-item a:hover { 
            color: var(--text); 
            }

           
            footer{
            background:#030304;
            color:#9fb3d2;
            padding:18px 0;
            text-align:center;
            border-top:1px solid rgba(255,255,255,0.03);
            }

           
            .timeline-item, .skill-category, .hobby-card, .contact-item{
            opacity:0;
            transform:translateY(18px);
            transition:opacity .6s ease,transform .6s ease;
            }

            .reveal-visible{
            opacity:1;
            transform:none;
            }

           
            @media (max-width:920px){ 
            .about-content{grid-template-columns:1fr;} 
            .hero-title{font-size:2rem;} }
            
          ]]></xsl:text>
        </style>
      </head>

      <body>

        <header class="header">
          <nav class="nav">
            <div class="logo"><xsl:value-of select="portfolio/personal/name"/></div>
            <ul class="nav-list" role="menu">
              <li><a href="#about" class="nav-link" role="menuitem">About</a></li>
              <li><a href="#education" class="nav-link" role="menuitem">Education</a></li>
              <li><a href="#skills" class="nav-link" role="menuitem">Skills</a></li>
              <li><a href="#hobbies" class="nav-link" role="menuitem">Hobbies</a></li>
              <li><a href="#contact" class="nav-link" role="menuitem">Contact</a></li>
            </ul>
          </nav>
        </header>

        <section class="hero">
          <h1 class="hero-title"><xsl:value-of select="portfolio/personal/name"/></h1>
          <p class="hero-subtitle"><xsl:value-of select="portfolio/personal/title"/></p>
          <p><xsl:value-of select="portfolio/personal/description"/></p>
        </section>

        <section id="about" class="section">
          <div class="container">
            <div class="about-content">
              <xsl:if test="portfolio/about/image">
                <img class="profile-image">
                  <xsl:attribute name="src">
                    <xsl:value-of select="normalize-space(portfolio/about/image)"/>
                  </xsl:attribute>
                  <xsl:attribute name="alt">
                    <xsl:value-of select="concat(portfolio/personal/firstname, ' ', portfolio/personal/lastname)"/>
                  </xsl:attribute>
                </img>
              </xsl:if>
              <div class="about-text">
                <p><xsl:value-of select="portfolio/about/text"/></p>
              </div>
            </div>
          </div>
        </section>

        <section id="education" class="section">
          <div class="container">
            <h2 class="section-title">Education</h2>
            <xsl:for-each select="portfolio/education/item">
              <div class="timeline-item">
                <strong><xsl:value-of select="date"/></strong><br/>
                <em><xsl:value-of select="degree"/></em><br/>
                <xsl:value-of select="institution"/><br/>
                <xsl:value-of select="description"/>
              </div>
            </xsl:for-each>
          </div>
        </section>

        <section id="skills" class="section">
          <div class="container">
            <h2 class="section-title">Skills</h2>
            <div class="skills-grid">
              <xsl:for-each select="portfolio/skills/category">
                <div class="skill-category">
                  <h3><xsl:value-of select="name"/></h3>
                  <ul>
                    <xsl:for-each select="items/item">
                      <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                  </ul>
                </div>
              </xsl:for-each>
            </div>
          </div>
        </section>

        <section id="hobbies" class="section">
          <div class="container">
            <h2 class="section-title">Hobbies</h2>
            <div class="hobbies-grid">
              <xsl:for-each select="portfolio/hobbies/hobby">
                <div class="hobby-card">
                  <div class="hobby-icon"><xsl:value-of select="icon"/></div>
                  <h3><xsl:value-of select="name"/></h3>
                  <p><xsl:value-of select="description"/></p>
                </div>
              </xsl:for-each>
            </div>
          </div>
        </section>

        <section id="contact" class="section">
          <div class="container">
            <h2 class="section-title">Contact</h2>
            <p><xsl:value-of select="portfolio/contact/intro"/></p>
            <div class="contact-info">
              <xsl:for-each select="portfolio/contact/items/item">
                <div class="contact-item">
                  <i class="fas fa-info-circle"></i>
                  <strong><xsl:value-of select="@type"/>:</strong>
                  <span><xsl:value-of select="."/></span>
                </div>
              </xsl:for-each>
            </div>
          </div>
        </section>

        <footer>
          <p>© <xsl:value-of select="portfolio/personal/name"/>. All rights reserved.</p>
        </footer>

        <script type="text/javascript"><![CDATA[
          (function () {
            
            document.querySelectorAll('a[href^="#"]').forEach(function(link){
              link.addEventListener('click', function(ev){
                var href = this.getAttribute('href');
                if (!href || href === '#') return;
                var target = document.querySelector(href);
                if (target) {
                  ev.preventDefault();
                  target.scrollIntoView({ behavior: 'smooth', block: 'start' });
                }
              });
            });

     
            var revealSelector = ['.timeline-item', '.skill-category', '.hobby-card', '.contact-item', '.about-content', '.hero'];
            var revealEls = [];
            revealSelector.forEach(function(sel){
              document.querySelectorAll(sel).forEach(function(el){ revealEls.push(el); });
            });

            if ('IntersectionObserver' in window && revealEls.length) {
              var obs = new IntersectionObserver(function(entries){
                entries.forEach(function(entry){
                  if (entry.isIntersecting) {
                    entry.target.classList.add('reveal-visible');
                    obs.unobserve(entry.target);
                  }
                });
              }, { threshold: 0.12 });
              revealEls.forEach(function(el){
                obs.observe(el);
              });
            } else {
             
              revealEls.forEach(function(el){ el.classList.add('reveal-visible'); });
            }
          })();
        ]]></script>

      </body>
    </html>

  </xsl:template>
</xsl:stylesheet>