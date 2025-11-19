document.getElementById("contactForm").addEventListener("submit", function(event) {
  event.preventDefault();

  const name = document.getElementById("name").value;
  const email = document.getElementById("email").value;
  const message = document.getElementById("message").value;

  if (name && email && message) {
    alert(`Thank you, ${name}! Your message has been sent to ramoscath12@gmail.com.`);
    this.reset();
  } else {
    alert("Please fill out all fields before submitting.");
  }
});