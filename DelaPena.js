alert("Welcome! Please fill out the signup form.");

document.addEventListener("DOMContentLoaded", function() {
  let title = document.querySelector("h1");
  title.style.color = "blue";

  let form = document.getElementById("signupForm");
  form.addEventListener("submit", function(e) {
    e.preventDefault(); 
    alert("Form submitted successfully!");
  });
});
