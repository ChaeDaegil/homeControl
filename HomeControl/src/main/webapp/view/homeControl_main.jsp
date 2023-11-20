<%@ page import="com.example.homecontrol.DB.DBManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
    String user_id = (String)session.getAttribute("userid");
    DBManager.newInstance();
    ResultSet res =null;
    try {
        res = DBManager.getInstance().getDbMachine().SelectDBMachine(user_id);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
%>

<html>
<head>
    <title>Title</title>
    <link href="css/homControl_main.css?after" rel="stylesheet" type="text/css">
</head>
<body>
<main>
    <div class="btn_div">
        <div class="message"></div>
        <input class="machine_input" type="text">
        <button class="refreshBtn">새로고침</button>
        <button class="insertBtn" value="<%=user_id%>">추가</button>
    </div>
    <div class="machine_list">
        <%
            int index = 0;
            while (res.next()){
                String machine_name = res.getString("machine_name");
                String id_num = res.getString("id_num");
                String machine_state = res.getString("machine_state");
        %>
        <div class="machine_con">
            <div class="machine_title">
                <input value="<%=machine_name%>"  style="display: none" type="text">
                <span><%=machine_name%></span>
            </div>
            <div class="machine_state_con">
                <button class="machine_state" value="<%=id_num%>">
                    <%
                        if(machine_state.equals("1")){
                    %>
                        켜짐
                    <%
                        }
                        else {
                    %>
                        꺼짐
                    <%
                        }
                    %>

                </button>
            </div>
            <div class="machine_button_con">
                <button class="update_btn" value="<%=id_num%>,<%=index%>">수정</button>
                <button value="<%=id_num%>">삭제</button>
            </div>
        </div>
        <% index++;   }
        %>

    </div>
</main>
<form class="test"  method="post" hidden="hidden">
</form>
</body>
</html>
<script>
    const insertBtn = document.querySelector('.insertBtn');
    const refreshBtn = document.querySelector('.refreshBtn');
    const machInputTag = document.querySelector('.machine_input');
    const machines = document.querySelectorAll(".machine_list>.machine_con");
    let insertCheck = true;
    refreshBtn.onclick = ()=>{
        location.reload();
    }
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
            form.action = "/insert?user_id=<%=user_id%>&machine_name="+name+"&db=machine";
            form.submit();
        }
    }
    machines.forEach(machine=>{
        const [updateBtn,deleteBtn] = machine.querySelectorAll('.machine_button_con>button');
        const stateBtn = machine.querySelector('.machine_state');
        const form = document.querySelector('.test');

        updateBtn.onclick = (event)=>{
            let machineId = event.currentTarget.value.split(",")[0];
            let index = event.currentTarget.value.split(",")[1];
            const box = machines.item(Number(index));
            const con = box.querySelector('.machine_title');
            const inputTag = box.querySelector('input');
            const spanTag = box.querySelector('span');

            if(event.currentTarget.innerText==="수정"){
                spanTag.innerText = "";
                inputTag.style.display = "block";
                event.currentTarget.innerText = "저장";
            }
            else{
                spanTag.innerText = inputTag.value;
                inputTag.style.display = "none";
                event.currentTarget.innerText = "수정";
                form.action = "/update?id_num=" + machineId+"&name="+inputTag.value+"&type=name&db=machine";
                form.submit();
            }
        }
        stateBtn.onclick = (event)=>{
            let machineId = event.currentTarget.value;
            let state = event.currentTarget.innerText ==="켜짐"?0:1;
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
