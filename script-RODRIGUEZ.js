const button = document.getElementById("button2");
const button2 = document.getElementById("button3");

function clickOne(){
    document.getElementById("body").style.backgroundColor = "black";
}

button.addEventListener('click', function(){
    alert("HELLO");
})

button2.addEventListener('click',  ()=>{
    button2.classList.add('clicked');
    setTimeout(() => {
        button2.classList.remove('clicked');
    }, 100);
});
