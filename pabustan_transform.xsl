<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<xsl:template match="/portfolio">
<html>
<head>
    <title>Student Portfolio - <xsl:value-of select="student/lastname"/></title>
    <style>
       
        :root {
            --primary-blue: #97820aff;     
            --accent-green: #887508ff;      
            --background-white: #ffffff;
            --background-light: #f8f9fa;  
            --text-dark: #2c3e50;         
            --shadow-light: rgba(0, 0, 0, 0.08);
        }

        
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            margin: 0; 
            padding: 30px 20px; 
            background-color: var(--background-light); 
            color: var(--text-dark);
        }
        .portfolio-container { 
            max-width: 1000px; 
            margin: 0 auto; 
            background-color: var(--background-white); 
            padding: 50px; 
            border-radius: 15px; 
            box-shadow: 0 10px 30px var(--shadow-light); 
        }

      
        .header {
            text-align: center;
            padding-bottom: 30px;
            margin-bottom: 40px;
            border-bottom: 6px solid var(--accent-green);
        }
        
      
        h1 { 
            color: var(--primary-blue); 
            font-size: 1.8em; /* Adjusted size */
            margin: 0 0 5px 0;
            font-weight: 700;
        }
        
       
        .subheader {
            color: var(--text-dark);
            font-size: 2.8em; 
            font-weight: 800; 
            margin-top: 5px;
            margin-bottom: 10px;
            line-height: 1.1;
        }
        .subheader span {
             display: block;
             font-size: 0.4em; 
             font-weight: 400;
             color: #05213aff;
        }


        h2 { 
            color: var(--primary-blue); 
            margin-top: 40px; 
            padding-left: 20px;
            border-left: 4px solid var(--primary-blue);
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .info-list { list-style: none; padding: 0; margin-left: 20px; display: grid; grid-template-columns: repeat(2, 1fr); gap: 10px 20px;}
        .info-list li { margin-bottom: 12px; font-size: 1.05em; line-height: 1.5; }
        .info-list strong { 
            color: var(--accent-green); 
            font-weight: 700; 
            display: inline-block;
            min-width: 120px;
        }

        table { 
            width: 100%; 
            border-collapse: separate; 
            border-spacing: 0;
            margin-top: 20px; 
            border-radius: 8px;
            overflow: hidden; 
            box-shadow: 0 2px 10px var(--shadow-light);
        }
        th, td { 
            border-bottom: 1px solid #e9ecef;
            padding: 15px; 
            text-align: left; 
        }
        th { 
            background-color: var(--primary-blue); 
            color: white; 
            font-weight: 600; 
            text-transform: uppercase;
            font-size: 0.9em;
        }
        tr:nth-child(even) { background-color: var(--background-light); } 
        tr:hover { background-color: #e6f7ff; cursor: pointer; } 
        
        .skill-list {
            display: flex;
            flex-wrap: wrap;
            padding: 0;
            list-style: none;
            gap: 12px;
            margin-top: 20px;
        }
        .skill-list li {
            background-color: #f0fdf4; 
            color: var(--text-dark);
            padding: 8px 15px;
            border-radius: 5px;
            border: 1px solid var(--accent-green);
            font-weight: 500;
            font-size: 0.95em;
        }
        .skill-list li strong {
            color: var(--primary-blue);
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <div class="portfolio-container">
        <div class="header">
            <h1> Student Portfolio</h1>
            
            <div class="subheader">
                <xsl:value-of select="student/firstname"/> <xsl:value-of select="student/lastname"/>
                <span><xsl:value-of select="student/course"/></span>
            </div>
        </div>

        <h2> Student Profile</h2>
        <ul class="info-list">
            <li><strong>Student ID :</strong> <xsl:value-of select="student/id"/></li>
            <li><strong>Course:</strong> <xsl:value-of select="student/course"/></li>
            <li><strong>Year Level:</strong> <xsl:value-of select="student/yearlevel"/></li>
            <li><strong>Email:</strong> <xsl:value-of select="student/email"/></li>
        </ul>

        <h2>Activities </h2>
        <table>
            <tr>
                <th>Type</th>
                <th>Name of Activity</th>
                <th>Date Completed</th>
                <th>Description</th>
            </tr>
            <xsl:for-each select="activity">
            <tr>
                <td><xsl:value-of select="@type"/></td>
                <td><xsl:value-of select="name"/></td>
                <td><xsl:value-of select="date"/></td>
                <td><xsl:value-of select="description"/></td>
            </tr>
            </xsl:for-each>
        </table>

        <h2> Technical Skills</h2>
        <ul class="skill-list">
            <xsl:for-each select="skill">
            <li><xsl:value-of select="name"/>: <strong><xsl:value-of select="details"/></strong></li>
            </xsl:for-each>
        </ul>
    </div>
</body>
</html>
</xsl:template>

</xsl:stylesheet>