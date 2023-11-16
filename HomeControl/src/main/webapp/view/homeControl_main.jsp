<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<c:set var="user_id" value="4"/>
<sql:setDataSource
        var="dataSource"
        driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://redcan.iptime.org:4322/home"
        user="root"
        password="1234"
        scope="application"/>
<c:set var="sql_query"
       value="SELECT * FROM machine" scope="page"/>
<sql:query var="result" scope="page" dataSource="${dataSource}" sql="${sql_query}"/>
<c:remove var="sql_query" scope="page"/>


<html>
<style>
    body{
        width: 100%;
        height: 100%;
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }
    .btn_div{
        height:40px;
        width: 100%;
        margin: 0 auto;
        display: flex;
        justify-content: right;
        border-bottom: 1px solid black;
    }
    .btn_div > button{
        margin: 5px;
    }
    main{
        width: 100%;
        height: 100%;
        margin-bottom: 100px;
    }
    .machine_input{
        display: none;
    }
    .machine_list{
        height:100%;
        width: 100%;
        margin: 0 auto;
        display: flex;
        flex-wrap: wrap;
        align-content: stretch;

    }
    .machine_list>div{
        height: 100px;
        width: 150px;
        background-color: #a7cbff;
        box-shadow: 5px 5px 5px 5px #868686;
    }

    .machine_title{
        height: 25px;
        text-align: right;
        padding-right: 10px;
        border:1px solid black;
        box-sizing: border-box;
        border-bottom: none;
    }
    .machine_state_con{
        height: 40px;
        border:1px solid black;
        box-sizing: border-box;
        border-bottom: none;
        display: flex;
        justify-content: right;
    }

    .machine_button_con{
        height: 35px;
        border:1px solid black;
        display: flex;
        justify-content: right;
        box-sizing: border-box;
        padding: 3px;
    }

</style>
<%--<script src="js/homeControl.js" defer></script>--%>
<head>
    <title>Title</title>
</head>
<body>
<main>
    <div class="btn_div">
        <div class="message"></div>
        <input class="machine_input" type="text">
        <button value="${user_id}">추가</button>
    </div>
    <div class="machine_list">
        <c:forEach var="row" items="${result.rows}">
            <div class="machine_con">
                <div class="machine_title">
                    <input style="display: none" type="text">
                        ${row['machine_name']}
                </div>
                <div class="machine_state_con">
                    <button class="machine_state" value="${row['id_num']}">
                        <c:choose>
                            <c:when test = "${row['machine_state'] == 1}">
                                켜짐
                            </c:when>
                            <c:otherwise>
                                꺼짐
                            </c:otherwise>
                        </c:choose>
                    </button>
                </div>
                <div class="machine_button_con">
                    <button value="${row['id_num']}">수정</button>
                    <button value="${row['id_num']}">삭제</button>
                </div>
            </div>
        </c:forEach>
    </div>
</main>

<form class="test"  method="post" hidden="hidden">
</form>
</body>
</html>
<script>
    const insertBtn = document.querySelector('.btn_div>button');
    const machInputTag = document.querySelector('.machine_input');
    const machines = document.querySelectorAll(".machine_list>.machine_con");
    let insertCheck = true;

    insertBtn.onclick=(event) =>{
        if(insertCheck){
            insertBtn.innerText = "기기 추가";
            machInputTag.style.display ="block";
            insertCheck = false;
        }
        else{
            insertBtn.innerText = "추가";
            machInputTag.style.display ="none";
            insertCheck = true;
            let name = machInputTag.value;
            const form = document.querySelector('.test');
            form.action = "/insert?user_id=${user_id}&machine_name="+name+"&db=machine";
            form.submit();
        }
    }
    machines.forEach(machine=>{
        const [updateBtn,deleteBtn] = machine.querySelectorAll('.machine_button_con>button');
        const stateBtn = machine.querySelector('.machine_state');
        const form = document.querySelector('.test');

        updateBtn.onclick = ()=>{

        }
        stateBtn.onclick = (event)=>{
            let machineId = event.currentTarget.value;
            let state = event.currentTarget.innerText ==="켜짐"?0:1;
            console.log(machineId);
            console.log(state);
            form.action = "/update?id_num=" + machineId+"&state="+state+"&type=state&db=machine";
            form.submit();
        }
        deleteBtn.onclick = (event)=>{
            let machineId = event.currentTarget.value;
            form.action = "/delete?machineId="+machineId+"&db=machine";
            form.submit();
        }
    });

</script>
