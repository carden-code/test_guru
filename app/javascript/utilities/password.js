document.addEventListener('turbolinks:load',function() {
  var control = document.querySelector("input#user_password_confirmation")

  if (control) { control.addEventListener('keyup', colorChange) }
})

function colorChange(){
  var input1 = document.querySelector("input#user_password"),
      input2 = document.querySelector("input#user_password_confirmation");
    if (input1.value != input2.value) {
      input2.style.backgroundColor = "red"
    } else if (input1.value === input2.value && input1.value != ""){
        input2.style.backgroundColor = "green"
      } else {
        input2.style.backgroundColor = ""
      };
};
