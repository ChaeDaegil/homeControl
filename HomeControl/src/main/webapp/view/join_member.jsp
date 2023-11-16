<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                    <label>PASSWORD</label><input type="password" name="newPW" class="input">
                </div>
                <div>
                    <label>PASSWORD REPEAT</label><input type="password" name="pwCheck" class="input">
                </div>
                <div class="buttons">
                    <input type="button" value="취소" name="cancel">
                    <button name="join">가입</button>
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
let [newId,idCheck,newPw,pwCheck,cancel] = document.getElementsByTagName("input");
// id
const idRegExp = /^[a-z]+[a-z0-9]{5,11}$/g;
// pw
const pwRegExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
// 이름
const nameRegExp = /^[ㄱ-ㅎ가-힣]+$/;
// phone
const phoneRegExp = /^01([0|1|[6-9])-?([0-9]{3,4})-?([0-9]{4})$/;















</script>
