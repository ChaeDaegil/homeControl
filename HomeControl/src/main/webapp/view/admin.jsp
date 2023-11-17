<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <title>Title</title>
</head>

<style>
    body{
        width:100%;
        margin:auto;
        max-width:1200px;
        min-height:670px;
        position:relative;
        justify-content: center;
    }

    main{
        box-sizing: border-box;
        width:100%;
        height:100%;
        position:absolute;
        padding:90px 70px 50px 70px;
        display: flex;
    }

    aside{
        width: 20%;
        box-sizing: border-box;
        position: relative;
    }

    main > div {
        box-sizing: border-box;
        width: 80%;
        position: relative;
    }
    li{
        list-style-type: none;
        padding: 5px;
    }
    li :hover{
        background-color: #a7cbff;
    }
    header{
        height: 50px;
        position: relative;
    }
    header > section{
        display: flex;
        justify-content: space-between;
        height: 100%;
        align-items: center;

    }
    h4{
        align-content: center;
    }
    #mainSect{
        border: 1px solid slategray;
        position: relative;
    }
    #leftSect{
        background-color: aliceblue;
    }
    #headSect > div{
        margin: 0 10px;
    }
    article{
        height: 100%;
        width: 100%;
    }
    iframe{
        height: 100%;
        width: 100%;
    }
    a{
        text-decoration: none;
        color: black;
    }

</style>
<header>
    <section id="headSect">
        <div>몰라 회원 수 몇명</div>
        <div><input type="button" value="로그아웃" id="logout"></div>
    </section>
</header>


<body>
<main >

    <!--side 여기에 메뉴 선택-->
    <aside id="leftSect" >
        <h4>메뉴판</h4>
        <ul>
            <li><a href="admin_main.jsp" target="mainframe">메인</a></li>
            <li><a href="admin_mailbox.jsp" target="mainframe">문의 확인</a></li>
        </ul>
    </aside>


    <!--main-->
    <div id="mainSect">
        <article>
            <iframe name="mainframe" src="admin_main.jsp" frameborder="0"></iframe>
        </article>
    </div>

</main>
</body>
</html>
<script>
    const logoutBtn = document.getElementById("logout");

    logoutBtn.onclick = () =>{
        window.location.href = "login.jsp";
    }
</script>

