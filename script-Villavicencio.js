document.getElementById('signupForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent default form submission

            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (password !== confirmPassword) {
                
                alert('Passwords do not match! Please try again.');
                
                const confirmField = document.getElementById('confirmPassword');
                confirmField.style.borderColor = '#dc3545';
                confirmField.style.boxShadow = '0 0 0 3px rgba(220, 53, 69, 0.1)';
                setTimeout(() => {
                    confirmField.style.borderColor = '#e1e5e9';
                    confirmField.style.boxShadow = 'none';
                }, 2000);
            } else {
                
                document.getElementById('thankYouMsg').style.display = 'block';
                
                document.body.style.background = 'linear-gradient(135deg, #28a74520 0%, #20c99720 100%)';
                
                this.reset();
                setTimeout(() => {
                    document.body.style.background = 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)';
                    document.getElementById('thankYouMsg').style.display = 'none';
                }, 3000);
            }
        });