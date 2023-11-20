<%@ page import="com.example.homecontrol.DB.DBManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

    DBManager.newInstance();
    ResultSet res = null;
    String total_user = "0";

    if(session.getAttribute("userid") == null){
        response.sendRedirect("/logout");
    }


    res = DBManager.getInstance().getDBUser().CountDBUser();
    if(res.next()){
        total_user = res.getString("count");
    }

%>


<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/admin.css">
</head>

<header>
    <section id="headSect">
        <div>총 회원 수 <%=total_user%>명</div>
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
            <li><a href="admin_mailbox.jsp?sel=&search=&pageNum=1" target="mainframe">문의 확인</a></li>
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
        window.location.href = "/logout";
    }
</script>

