/*
 *
 */
const CLIENT_ID = "311641388431-g4o06guk8m1d2e5jh7ttgu1jnfm5s5jg.apps.googleusercontent.com"; 
const redirect_uri="http://localhost:7777/login/oauth/google";

// onload 시점에 이벤트 핸들러 추가
window.onload = () => {

  // btn-google이라는 아이디 속성을 가진 요소의 클릭 이벤트
  document.querySelector("#btn-google").onclick = () => {
    // alert("구글 로그인!@");
    const url = "https://accounts.google.com/o/oauth2/v2/auth"
                + "?client_id=" + CLIENT_ID
                + "&redirect_uri=" + redirect_uri
                + "&response_type=code"
                + "&scope=email profile";
    location.href = url;
  }

}