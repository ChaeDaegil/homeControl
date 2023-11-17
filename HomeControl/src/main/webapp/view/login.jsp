<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
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
#login{
    min-height:345px;
    position:relative;
}
div{
    padding: 10px;
   margin-bottom: 15px;
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
        <h2>로그인 페이지</h2>
        <form action="loginCheck.jsp" id="login" method="post">
            <div>
                <label>ID</label><input type="text" name="ID" class="input">
            </div>
            <div>
                <label>PASSWORD</label><input type="text" name="PW" class="input">
            </div>

            <div class="buttons">
                <input type="button" value="회원가입" name="join" id="toJoin">
                <button name="login_submit" id="login_submit">로그인</button>
            </div>
        </form>
    </section>
</main>

</body>
</html>

<script>
    const joinToBtn = document.getElementById("toJoin");
    const loginForm = document.getElementById("login");
    const [id, pw] = document.getElementsByTagName("input");

    joinToBtn.onclick = () =>{
        window.location.href = "join_member.jsp";
    }

    loginForm.addEventListener("submit", function(e) {
        if(id.value.length === 0){
            alert("id를 입력하세요");
            e.preventDefault();
        }
        else if(pw.value.length === 0){
            alert("password를 입력하세요")
            e.preventDefault();
        }
        else if(!correctPw){
            alert("비밀번호를 확인하세요!")
            e.preventDefault();
        }
    });
</script>
