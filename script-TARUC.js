document.getElementById("signupForm").addEventListener("submit", function(event) {
    event.preventDefault(); 
 const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
 if (password !== confirmPassword) {
        alert("Passwords do not match!");
    } else {
        alert("Signup successful! Welcome!");
        document.body.style.backgroundColor = "#6fc169ff"; 
    }
});