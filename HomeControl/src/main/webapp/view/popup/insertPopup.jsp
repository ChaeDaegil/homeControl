<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <div>
        기기 이름 : <input type="text"> <button>추가</button>
    </div>
</body>
</html>
<script>
    const insertBtn = document.querySelector('button');
    const searchParams = new URLSearchParams(location.search);
    let userid;
    for (const param of searchParams) {
        if(param[0]==="id"){
            userid = param[1];
        }
    }
    insertBtn.onclick = ()=>{

    };
</script>