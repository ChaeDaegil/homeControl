<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>





<html>
<head>
    <title>Title</title>
</head>
<style>

    a{
        text-decoration: none;
        color: black;
    }
    form{
        padding: 5px;
        display: flex;
        justify-content: space-between;
    }
    table{
        padding: 7px 0;
        width: 100%;
        text-align: center;
        table-layout: fixed;
    }
    table th{
        background-color: slategray;
        border-top: 2px solid gray;
        padding: 5px;
    }
    table td{
        border-bottom: 2px solid gray;
        padding: 5px;
        margin: 5px;
    }
    table td:nth-child(2){
        width: 50%;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .center{
        text-align: center;
        padding: 5px;
    }
    hr{

    }
    table td a{
        display: inline-block;
        text-overflow: ellipsis;
        height: 100%;
        width: 100%;
    }

</style>
<body>
<h2>요기는 문의 메일함</h2>
<hr>
<form action="#">
    <span class="left">##개 메일이 있습니다.</span>
    <span class="right">
            <select>
                <option value="제목" name="제목">제목</option>
                <option value="글쓴이" name="글쓴이">글쓴이</option>
            </select>
            <input type="text">
            <input type="submit" name="search" value="검색">
        </span>
</form>
<table>
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>일시</th>
        <th>확인여부</th>
    </tr>
    </thead>

    <tbody>
    <tr>
        <td>1</td>
        <td class>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea eos fuga illo minima odio optio sed sequi? Aut, cum dicta iusto laborum minima nulla officia porro quo quos repellendus voluptate?</td>
        <td>아무개</td>
        <td>231116</td>
        <td>x</td>
    </tr>
    </tbody>
</table>

<div class="center">
    <a href="#">◀ 이전</a>
    <a href="#">현재 페이지</a>
    <a href="#">다음 ▶</a>
</div>

</body>
</html>

<script>

    const mail_rows = document.querySelectorAll('tbody>tr');

    mail_rows.forEach(mail=>{
        mail.onclick = (event)=>{
            location.href = "/view/admin_mail.jsp?mail_id="+event.currentTarget.querySelector('td').innerText;
        }
    });
</script>

