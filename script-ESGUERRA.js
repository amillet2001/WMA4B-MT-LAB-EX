function validateSignup() {
    const fullName = document.getElementById('fullName').value;
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;

    if (!fullName || !email || !password || !confirmPassword) {
        alert("All fields are required.");
        return;
    }

    const emailPattern = "@student.tsu.edu.ph";
    if (!email.endsWith(emailPattern)) {
        alert("Please enter a valid TSU Student email address.");
        return;
    }

    if (password.length < 8) {
        alert("Password must be at least 8 characters long.");
        return;
    }

    if (password !== confirmPassword) {
        alert("Passwords do not match.");
        return;
    }

    alert("You have successfully signed up!");
    return;
}