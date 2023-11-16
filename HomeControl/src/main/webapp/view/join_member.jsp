<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<html>
<style>
main{
    width:100%;
    margin:auto;
    max-width:525px;
    min-height:670px;
    position:relative;
}
section{
    background-color: aqua;
    box-sizing: border-box;
    width:100%;
    height:100%;
    position:absolute;
    padding:90px 70px 50px 70px;

}
#joinForm{
    min-height:345px;
    position:relative;
}
div{
    margin-bottom:15px;
}
h2{
    display: inline-block;
    align-items: center;
}
.input{
    border:none;
    padding:15px 20px;
    border-radius:25px;
    width: 100%;
}
label{
    font-size: 12px;
    display: block;
    width: 100%;
}
.buttons{
    display: flex;
    justify-content: center;
}
form{
    background-color: bisque;
}

</style>

<body>

    <main>
        <section>
            <h2>회원가입 페이지</h2>
            <form action="#" id="joinForm" method="post">
                <div>
                    <label>ID</label><input type="text" name="newID" class="input"> <input type="button" name="idCheck"  value="id중복 확인">
                </div>
                <div>
                    <label>PASSWORD</label><input type="text" name="newPW" class="input">
                </div>
                <div>
                    <label>PASSWORD REPEAT</label><input type="text" name="pwCheck" class="input">
                </div>
                <div class="buttons">
                    <input type="button" value="취소" name="cancel">
                    <button name="join" id="join">가입</button>
                </div>
            </form>
        </section>
    </main>




</body>
<head>
    <title>join_member</title>
</head>
</html>

<script>
const  inputs = document.getElementsByTagName("input");
const [newId,idCheck,newPw,pwCheck,cancel] = inputs;
let joinBtn = document.getElementById("join");
const joinForm = document.getElementById("joinForm");


// id
const idRegExp = /^[a-z]+[a-z0-9]{5,11}$/g;
// pw
const pwRegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
// 이름
const nameRegExp = /^[ㄱ-ㅎ가-힣]+$/;
// phone
const phoneRegExp = /^01([0|1|[6-9])-?([0-9]{3,4})-?([0-9]{4})$/;
let isClear = false;
let correctPw = false;


joinForm.onchange = () => {
    console.log("id" + idRegExp.test(newId.value));
    console.log("pw" + pwRegExp.test(newPw.value));
    console.log(correctPw + "pwcheck");

    if(idRegExp.test(newId.value) && pwRegExp.test(newPw.value) && correctPw){
        console.log("gd")
            joinBtn.setAttribute("disabled",false);
    }
    else {
        joinBtn.setAttribute("disabled",true);
        // joinBtn.
    }
}


// pw check 동일하면 트루로 바꾸기
pwCheck.onkeyup = () => {
    correctPw = newPw.value === pwCheck.value;
}



// 클릭하면 메인화면으로 날려버리기
cancel.onclick = () =>{
    window.location.href = "#";
}

// 클릭하면 데이터베이스 정보 조회해서 비교하기
// idCheck.onclick = () =>{
//
// }




</script>
