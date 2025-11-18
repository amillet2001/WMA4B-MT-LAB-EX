<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="html" encoding="UTF-8" indent="yes" />
  
  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title><xsl:value-of select="/portfolio/metadata/title" /></title>
        <style>
          * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
          }

          body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: #0a0a0a;
            color: #e5e5e5;
            line-height: 1.6;
          }

          .container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 0 2rem;
          }

          /* Navigation */
          .nav {
            position: fixed;
            left: 2rem;
            top: 50%;
            transform: translateY(-50%);
            z-index: 100;
          }

          .nav-dots {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
          }

          .nav-dot {
            width: 8px;
            height: 8px;
            background: #404040;
            border-radius: 50%;
            cursor: pointer;
            transition: all 0.3s;
          }

          .nav-dot.active {
            background: #fff;
            transform: scale(1.5);
          }

          /* Hero Section */
          .hero-section {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 4rem 0;
          }

          .hero-content {
            flex: 1;
            max-width: 600px;
          }

          .hero-label {
            font-size: 0.875rem;
            color: #888;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 1rem;
          }

          .hero-name {
            font-size: 4rem;
            font-weight: 300;
            line-height: 1.1;
            margin-bottom: 1rem;
          }

          .hero-lastname {
            color: #666;
          }

          .hero-description {
            font-size: 1.125rem;
            color: #999;
            margin-bottom: 2rem;
            line-height: 1.8;
          }

          .hero-description strong {
            color: #fff;
            font-weight: 600;
          }

          .status {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.875rem;
            color: #888;
          }

          .status-dot {
            width: 8px;
            height: 8px;
            background: #22c55e;
            border-radius: 50%;
            animation: pulse 2s infinite;
          }

          @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
          }

          .hero-side {
            flex: 0 0 300px;
            background: #111;
            border: 1px solid #222;
            border-radius: 8px;
            padding: 2rem;
          }

          .hero-side h3 {
            font-size: 0.875rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #888;
            margin-bottom: 1.5rem;
          }

          .hero-details {
            margin-bottom: 2rem;
          }

          .hero-detail-item {
            margin-bottom: 1rem;
          }

          .hero-detail-item strong {
            display: block;
            font-size: 0.875rem;
            color: #666;
            margin-bottom: 0.25rem;
          }

          .hero-focus {
            margin-top: 2rem;
          }

          .focus-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
          }

          .focus-tag {
            background: #1a1a1a;
            border: 1px solid #333;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            font-size: 0.75rem;
            color: #ccc;
          }

          /* Section */
          .section {
            min-height: 100vh;
            padding: 6rem 0;
          }

          .section-header {
            display: flex;
            justify-content: space-between;
            align-items: baseline;
            margin-bottom: 4rem;
          }

          .section-title {
            font-size: 2.5rem;
            font-weight: 300;
          }

          .section-meta {
            font-size: 0.875rem;
            color: #666;
          }

          /* Education Items */
          .education-list {
            display: flex;
            flex-direction: column;
            gap: 3rem;
          }

          .education-item {
            display: grid;
            grid-template-columns: 100px 1fr 200px;
            gap: 3rem;
            padding-bottom: 3rem;
            border-bottom: 1px solid #222;
          }

          .education-item:last-child {
            border-bottom: none;
          }

          .education-year {
            font-size: 1.25rem;
            color: #666;
          }

          .education-content h3 {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
          }

          .education-school {
            color: #888;
            margin-bottom: 1rem;
          }

          .education-description {
            color: #999;
            line-height: 1.7;
          }

          .education-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            align-content: flex-start;
          }

          .education-tag {
            background: #1a1a1a;
            border: 1px solid #333;
            padding: 0.375rem 0.875rem;
            border-radius: 4px;
            font-size: 0.75rem;
            color: #ccc;
          }

          /* Interest Cards */
          .interests-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 2rem;
          }

          .interest-card {
            background: #111;
            border: 1px solid #222;
            border-radius: 8px;
            padding: 2rem;
            transition: all 0.3s;
          }

          .interest-card:hover {
            border-color: #444;
            transform: translateY(-4px);
          }

          .interest-meta {
            display: flex;
            justify-content: space-between;
            font-size: 0.75rem;
            color: #666;
            margin-bottom: 1rem;
          }

          .interest-card h3 {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1rem;
          }

          .interest-card p {
            color: #999;
            line-height: 1.7;
            margin-bottom: 1.5rem;
          }

          .read-more {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            color: #ccc;
            text-decoration: none;
            font-size: 0.875rem;
            transition: gap 0.3s;
          }

          .read-more:hover {
            gap: 1rem;
          }

          /* Connect Section */
          .connect-section {
            padding: 6rem 0;
          }

          .connect-intro {
            max-width: 600px;
            margin-bottom: 3rem;
          }

          .connect-intro h2 {
            font-size: 2.5rem;
            font-weight: 300;
            margin-bottom: 1rem;
          }

          .connect-intro p {
            color: #999;
            font-size: 1.125rem;
            line-height: 1.7;
          }

          .contact-link {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            color: #fff;
            text-decoration: none;
            font-size: 1.125rem;
            margin-top: 1rem;
            transition: gap 0.3s;
          }

          .contact-link:hover {
            gap: 1rem;
          }

          .social-header {
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            color: #666;
            margin-bottom: 2rem;
          }

          .social-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
          }

          .social-item {
            background: #111;
            border: 1px solid #222;
            border-radius: 8px;
            padding: 1.5rem;
            transition: all 0.3s;
          }

          .social-item:hover {
            border-color: #444;
          }

          .social-item h3 {
            font-size: 1rem;
            font-weight: 600;
            margin-bottom: 0.25rem;
          }

          .social-item .username {
            font-size: 0.875rem;
            color: #666;
          }

          /* Footer */
          .footer {
            border-top: 1px solid #222;
            padding: 3rem 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #666;
            font-size: 0.875rem;
          }

          .footer-icons {
            display: flex;
            gap: 1rem;
          }

          .footer-icon {
            width: 32px;
            height: 32px;
            background: #1a1a1a;
            border: 1px solid #333;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s;
          }

          .footer-icon:hover {
            background: #222;
            border-color: #444;
          }

          @media (max-width: 768px) {
            .nav { display: none; }
            .hero-section { flex-direction: column; gap: 2rem; }
            .hero-side { flex: 1; width: 100%; }
            .hero-name { font-size: 2.5rem; }
            .education-item { grid-template-columns: 1fr; gap: 1rem; }
            .interests-grid { grid-template-columns: 1fr; }
            .social-grid { grid-template-columns: 1fr; }
            .section-header { flex-direction: column; gap: 1rem; }
          }
        </style>
      </head>
      <body>
        <!-- Navigation Dots -->
        <nav class="nav">
          <div class="nav-dots">
            <div class="nav-dot active"></div>
            <div class="nav-dot"></div>
            <div class="nav-dot"></div>
            <div class="nav-dot"></div>
          </div>
        </nav>

        <div class="container">
          <!-- Hero Section -->
          <section class="hero-section">
            <div class="hero-content">
              <div class="hero-label">PORTFOLIO / <xsl:value-of select="/portfolio/metadata/year" /></div>
              <h1 class="hero-name">
                <xsl:value-of select="/portfolio/personal/firstName" /><br/>
                <span class="hero-lastname"><xsl:value-of select="/portfolio/personal/lastName" /></span>
              </h1>
              <p class="hero-description">
                <xsl:value-of select="/portfolio/personal/tagline" />
              </p>
              <div class="status">
                <span class="status-dot"></span>
                <xsl:value-of select="/portfolio/personal/location" />
              </div>
            </div>

            <div class="hero-side">
              <h3>CURRENTLY</h3>
              <div class="hero-details">
                <div class="hero-detail-item">
                  <strong><xsl:value-of select="/portfolio/personal/title" /></strong>
                  <div><xsl:value-of select="/portfolio/education/degree/school" /></div>
                </div>
                <div class="hero-detail-item">
                  <strong><xsl:value-of select="/portfolio/education/degree/period" /></strong>
                </div>
              </div>

              <div class="hero-focus">
                <h3>FOCUS</h3>
                <div class="focus-tags">
                  <xsl:for-each select="/portfolio/skills/technical/skill[position() &lt;= 5]">
                    <span class="focus-tag"><xsl:value-of select="." /></span>
                  </xsl:for-each>
                </div>
              </div>
            </div>
          </section>

          <!-- Education Section -->
          <section class="section">
            <div class="section-header">
              <h2 class="section-title">Education</h2>
              <div class="section-meta">2010 — <xsl:value-of select="/portfolio/metadata/year" /></div>
            </div>

            <div class="education-list">
              <div class="education-item">
                <div class="education-year">Current</div>
                <div class="education-content">
                  <h3><xsl:value-of select="/portfolio/education/degree/level" /></h3>
                  <div class="education-school"><xsl:value-of select="/portfolio/education/degree/school" /></div>
                  <p class="education-description">
                    <xsl:value-of select="/portfolio/education/degree/specialization" />
                  </p>
                </div>
              </div>

              <div class="education-item">
                <div class="education-year">2016-2022</div>
                <div class="education-content">
                  <h3>Senior High School</h3>
                  <div class="education-school"><xsl:value-of select="/portfolio/education/highSchool/school" /></div>
                  <p class="education-description">
                    Completed secondary education with focus on academic excellence and personal development.
                  </p>
                </div>
              </div>

              <div class="education-item">
                <div class="education-year">2010-2016</div>
                <div class="education-content">
                  <h3>Elementary Education</h3>
                  <div class="education-school"><xsl:value-of select="/portfolio/education/elementary/school" /></div>
                  <p class="education-description">
                    Foundation years building core academic skills and discovering early interests in technology.
                  </p>
                </div>
              </div>
            </div>
          </section>

          <!-- Interests Section -->
          <section class="section">
            <div class="section-header">
              <h2 class="section-title">Interests</h2>
            </div>

            <div class="interests-grid">
              <xsl:for-each select="/portfolio/interests/interest">
                <div class="interest-card">
                  <div class="interest-meta">
                    <span><xsl:value-of select="/portfolio/metadata/year" /></span>
                    <span>Ongoing</span>
                  </div>
                  <h3><xsl:value-of select="." /></h3>
                  <p>
                    Passionate about exploring and learning in this field, continuously developing skills and staying updated with latest trends.
                  </p>
                  <a href="#" class="read-more">Learn more →</a>
                </div>
              </xsl:for-each>
            </div>
          </section>

          <!-- Connect Section -->
          <section class="connect-section">
            <div class="connect-intro">
              <h2>Let's Connect</h2>
              <p>
                Always interested in new opportunities, collaborations, and conversations about technology and design.
              </p>
              <a href="mailto:{/portfolio/personal/contact/email}" class="contact-link">
                <xsl:value-of select="/portfolio/personal/contact/email" /> →
              </a>
            </div>

            <div class="social-header">ELSEWHERE</div>
            <div class="social-grid">
              <xsl:for-each select="/portfolio/social/link">
                <a href="{@url}" target="_blank" style="text-decoration: none; color: inherit;">
                  <div class="social-item">
                    <h3><xsl:value-of select="@platform" /></h3>
                    <div class="username">
                      <xsl:choose>
                        <xsl:when test="contains(@url, 'github.com')">@<xsl:value-of select="substring-after(@url, 'github.com/')" /></xsl:when>
                        <xsl:when test="contains(@url, 'linkedin.com')">@<xsl:value-of select="/portfolio/personal/firstName" /><xsl:value-of select="/portfolio/personal/lastName" /></xsl:when>
                        <xsl:otherwise>@<xsl:value-of select="/portfolio/personal/firstName" /></xsl:otherwise>
                      </xsl:choose>
                    </div>
                  </div>
                </a>
              </xsl:for-each>
            </div>
          </section>
        </div>

        <script>
          // Smooth scroll for navigation
          const sections = document.querySelectorAll('.section, .hero-section');
          const navDots = document.querySelectorAll('.nav-dot');

          window.addEventListener('scroll', () => {
            let current = '';
            sections.forEach((section, index) => {
              const sectionTop = section.offsetTop;
              if (pageYOffset >= sectionTop - 200) {
                current = index;
              }
            });

            navDots.forEach((dot, index) => {
              dot.classList.remove('active');
              if (index === current) {
                dot.classList.add('active');
              }
            });
          });

          navDots.forEach((dot, index) => {
            dot.addEventListener('click', () => {
              sections[index].scrollIntoView({ behavior: 'smooth' });
            });
          });
        </script>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>