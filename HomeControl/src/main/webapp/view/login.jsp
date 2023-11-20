<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/login.css">
</head>

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
