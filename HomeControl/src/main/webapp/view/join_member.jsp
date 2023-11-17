<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>


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
    background-color: burlywood;
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
    padding: 10px;
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
.right{
    margin-top: 5px;
    position: absolute;
    display: block;
    right: 0;
}

</style>

<body>

    <main>
        <section>
            <h2>회원가입 페이지</h2>
            <form action="<c:url value="/newuserinsert"/>" id="joinForm" method="post">
                <div>
                    <label for="newID">ID</label><input type="text" id="newID" class="input" name="newID">
                    <input class="right" type="button" id="idCheck"  value="id중복 확인" name="idCheck">
                </div>
                <div>
                    <label for="newPW">PASSWORD</label><input type="password" id="newPW" class="input" name="newPW">
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
<head>
    <title>join_member</title>
</head>
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


// 클릭하면 데이터베이스 정보 조회해서 비교하기
idCheck.onclick = () =>{

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
