// 舊密碼
let inputCurrentPassword = document.querySelector('#inputCurrentPassword');
// 新密碼
let inputNewPassword = document.querySelector('#inputNewPassword');
//再次輸入密碼
let inputConfirmNewPassword = document.querySelector(
    '#inputConfirmNewPassword');

let checkSpan01 = document.querySelector('#checkSpan01');
let checkSpan02 = document.querySelector('#checkSpan02');
let checkSpan03 = document.querySelector('#checkSpan03');

inputCurrentPassword.addEventListener('blur', function () {
  if (inputCurrentPassword.value === "") {
    checkSpan01.innerHTML = "不可空白！";
    checkSpan01.style = "color:red";

  }
});

// 新密碼
inputNewPassword.addEventListener('blur', function () {
  if (inputNewPassword.value === "") {
    checkSpan02.innerHTML = "不可空白！";
    checkSpan02.style = "color:red";
  } else {
    checkSpan02.innerHTML = "";
  }
});

//再次輸入密碼
inputConfirmNewPassword.addEventListener('blur', function () {
  if (inputConfirmNewPassword.value === "") {
    checkSpan03.innerHTML = "不可空白！";
    checkSpan03.style = "color:red";
  } else if (inputNewPassword.value !== inputConfirmNewPassword.value) {
    checkSpan03.innerHTML = "兩次密碼不相同！";
    checkSpan03.style = "color:red";
  } else {
    checkSpan03.innerHTML = "正確！";
    checkSpan03.style = "color:green";
  }

});