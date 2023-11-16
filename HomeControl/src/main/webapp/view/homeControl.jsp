<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    session.setAttribute("test","a");
%>
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
        background-color: bisque;
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

    h4{
        align-content: center;
    }
    #mainSect{
        background-color: aqua;
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
<body>
    <main >
        <aside id="leftSect" >
            <h4>메뉴판</h4>
            <ul>
                <li><a href="homeControl_main.jsp" target="mainframe">메인</a></li>
                <li><a href="homeControl_mail.jsp" target="mainframe">문의 하기</a></li>
            </ul>
        </aside>

        <!--main-->
        <div id="mainSect">
            <article>
                <iframe name="mainframe" src="homeControl_main.jsp" frameborder="0"></iframe>
            </article>
        </div>

    </main>
</body>
</html>
