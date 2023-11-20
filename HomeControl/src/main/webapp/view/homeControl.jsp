<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String menu = request.getParameter("sel_menu");
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/homControl.css">
</head>
<body>
    <main>
        <aside id="leftSect" >
            <h4>메뉴판</h4>
            <ul>
                <li><a href="homeControl_main.jsp" target="mainframe">메인</a></li>
                <li><a href="homeControl_mailbox.jsp" target="mainframe">문의 하기</a></li>
            </ul>
        </aside>
        <div id="mainSect">
            <article>
                <iframe name="mainframe" src="homeControl_main.jsp" frameborder="0"></iframe>
                <iframe name="servFrane" src="homeControl_main.jsp" frameborder="0" style="display: none"></iframe>
            </article>
        </div>
    </main>
</body>
</html>
<script>
    let switchCheck = true;
    setInterval(refresh,1000)

    function refresh(){
        const [mainframe,servFrane] = document.querySelectorAll("iframe");
        servFrane.contentDocument.location.reload(true);
        mainframe.contentWindow.document.querySelector("body").innerHTML = servFrane.contentWindow.document.querySelector("body").innerHTML;
        // servFrane.style.display = "block";
        // mainframe.style.display = "none";
        // servFrane.contentDocument.location.reload(true);
    }
</script>