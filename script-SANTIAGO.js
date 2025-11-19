const { useState } = React;


const PortfolioApp = () => {
    
    const [isLightMode, setIsLightMode] = useState(false);

    
    const toggleTheme = () => {
        setIsLightMode(prevMode => {
            const newMode = !prevMode;
           
            document.body.classList.toggle('light-mode', newMode); 
            return newMode;
        });
    };

    
    const skills = ['React.js', 'Next.js', 'JavaScript', 'HTML', 'CSS', 'Git / GitHub', 'UI/UX Design', 'Node.js', 'Java'];
    
    const projects = [
        {
            id: 1,
            title: "Dynamic Dashboard Pro",
            description: "A comprehensive, responsive dashboard built with React and Redux, featuring real-time data visualization and user authentication.",
            image: "https://via.placeholder.com/400x200/4a3a6b/ffffff?text=Dashboard+UI", 
            link: "https://github.com/your-repo/dashboard"
        },
        {
            id: 2,
            title: "E-commerce Platform X",
            description: "Developed a scalable e-commerce application with a modern UI, Stripe integration, and a robust backend API.",
            image: "https://via.placeholder.com/400x200/4a3a6b/ffffff?text=E-commerce+UI", 
            link: "https://github.com/your-repo/ecommerce"
        },
        {
            id: 3,
            title: "Creative Portfolio Generator",
            description: "A tool to quickly generate personalized portfolios using various templates and customization options.",
            image: "https://via.placeholder.com/400x200/4a3a6b/ffffff?text=Portfolio+Builder", 
            link: "https://github.com/your-repo/portfolio-gen"
        }
    ];

    return (
        <main>
            <section id="about" className="section">
                <h2>About Me</h2>
                <div className="about-content">
                    <div className="about-text">
                        <p>Greetings! I am a passionate creative developer specializing in crafting **immersive digital experiences**. My work blends cutting-edge front-end technologies with a keen eye for dramatic aesthetics and intuitive user journeys. I thrive on transforming complex ideas into elegant, performant, and visually captivating web applications.</p>
                        <p>With a background spanning React.js development, UI/UX principles, and digital artistry, I am adept at building projects that not only function flawlessly but also leave a lasting impression. Let's create something extraordinary together.</p>
                    </div>
                    
                 
                    
                </div>
            </section>

 
            <section id="skills" className="section">
                <h2>Skills & Expertise</h2>
                <ul className="skills-list">
                    {skills.map(skill => (
                        <li key={skill} className="skill-tag">{skill}</li>
                    ))}
                </ul>
            </section>


            <section id="projects" className="section">
                <h2>Featured Projects</h2>
                <div className="projects-grid">
                    {projects.map(project => (
                        <a href={project.link} target="_blank" rel="noopener noreferrer" key={project.id} className="project-card">
        
                            <div className="project-thumbnail" style={{ backgroundImage: `url(${project.image})` }}></div>
                            <div className="project-info">
                                <h3>{project.title}</h3>
                                <p>{project.description}</p>
                            </div>
                        </a>
                    ))}
                </div>
            </section>
            
        
            <div className="theme-toggle-container">
                <button className="theme-button" onClick={toggleTheme}>
                    {isLightMode ? '🌙 Embrace the Dark' : '🌞 Step into Light'}
                </button>
            </div>

            
            <section id="contact" className="section">
                <h2>Connect With Me</h2>
                <p>Email: <a href="mailto:contact@[LASTNAME].com">contact@[LASTNAME].com</a></p>
                <p>GitHub: <a href="https://github.com/[LASTNAME]" target="_blank" rel="noopener noreferrer">/[LASTNAME]</a></p>
            </section>
        </main>
    );
};


const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<PortfolioApp />);