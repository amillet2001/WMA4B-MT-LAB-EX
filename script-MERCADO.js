const bgColors = [
    'blue',
    'red',
    'green',
    'grey'
];

let colorIndex = 0;

changeColorBtn.addEventListener('click', function() {
    colorIndex = (colorIndex + 1) % bgColors.length;
    document.body.style.background = bgColors[colorIndex];
    alert('Background color changed!');
});

window.addEventListener('load', function() {
    setTimeout(function() {
        alert('Welcome to my portfolio! Feel free to explore my project/s and contact me.');
    }, 500);
});