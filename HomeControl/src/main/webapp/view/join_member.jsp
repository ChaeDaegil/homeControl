<%@ page import="com.example.homecontrol.DB.DBManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>


<html>

<head>
    <title>join_member</title>
    <link rel="stylesheet" href="css/login_member.css">
</head>
<body>

<main>
    <section>
        <h2>회원가입 페이지</h2>
        <form action="<c:url value="/newuserinsert"/>" id="joinForm" method="post">
            <div>
                <label for="newID">ID</label><input type="text" id="newID" class="input" name="newID" placeholder="영문 시작 4~20글자">
                <input class="right" type="button" id="idCheck"  value="id중복 확인" name="idCheck">
            </div>
            <div>
                <label for="newPW">PASSWORD</label><input type="password" id="newPW" class="input" name="newPW" placeholder="숫자, 영문, 특수기호 포함 10~20글자">
            </div>
            <div>
                <label for="pwCheck">PASSWORD REPEAT</label><input type="password" id="pwCheck" class="input" name="pwCheck">
            </div>
            <div class="buttons">
                <input type="button" value="취소" name="cancel">
                <button name="join" id="join">가입</button>
            </div>
        </form>
    </section>
</main>




</body>


</html>

<script>

    let joinBtn = document.getElementById("join");
    const joinForm = document.getElementById("joinForm");
    const  inputs = document.getElementsByTagName("input");
    const [newId,idCheck,newPw,pwCheck,cancel] = inputs;
    // let idCheck = false;

    function check_all(){
        let id = newId.value;
        let password = newPw.value;
        let chpassword = pwCheck.value;
            console.log(chpassword);
        // id reg
        const idRegExp = /^[A-Za-z]{4,20}$/;
        // pw reg
        const pwRegExp = /^[a-zA-Z0-9~!@#$%^&*()_-]{10,20}$/;

        if(!idRegExp.test(id)){
            console.log(id);
            alert("형식에 맞춰 ID를 입력하세요");
            newId.value = "";
            newId.focus();
            return false;
        }

        else if(!pwRegExp.test(password)){
            alert("형식에 맞춰 password를 입력해주세요");
            newPw.value = "";
            newPw.focus();
            return false;
        }

        else if(chpassword.slice(0,chpassword.length) !== password.slice(0,password.length)){
            alert("비밀번호가 동일하지 않습니다.");
            pwCheck.value= "";
            pwCheck.focus();
            return false;
        }

        else{
            return true;

        }
    }

// 이름
// const nameRegExp = /^[ㄱ-ㅎ가-힣]+$/;
// // phone
// const phoneRegExp = /^01([0|1|[6-9])-?([0-9]{3,4})-?([0-9]{4})$/;


// 클릭하면 메인화면으로 날려버리기
cancel.onclick = () =>{
    window.location.href = "login.jsp";
}


joinForm.addEventListener("submit", function(e) {
    if(!check_all()){
        e.preventDefault();
        console.log("여기옴");
    }
    else{
        console.log("통과함");
    }
});




</script>
