<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src='js/jquery-3.3.1.min.js'></script>
    <link rel="stylesheet" href="css/register.css" type="text/css" media="screen"/>


    <style>
        span.reference {
            position:fixed;
            left:5px;
            top:5px;
            font-size:10px;
            text-shadow:1px 1px 1px #fff;
        }
        span.reference a {
            color:#555;
            text-decoration:none;
            text-transform:uppercase;
        }
        span.reference a:hover {
            color:#000;
        }
        h1 {
            color:#ccc;
            font-size:36px;
            text-shadow:1px 1px 1px #fff;
            padding:20px;
        }
    </style>
</head>
<script>
    function sub() {
        $.ajax({
            cache: true,
            type: "POST",
            url:"http://localhost:8080/agriculture/doRegister",
            data:$('#registerForm').serialize(),// 你的formid
            async: false,
            error: function() {
                alert("error:注册过程出错");
            },
            success: function(data) {
                alert(data);
                if (data=="用户名已存在"){
                    window.location.reload();
                }else{
                    window.location.href="http://localhost:8080/agriculture/index.jsp";
                }

            }
        });
    }

</script>
<body>
<jsp:include page="top.jsp"></jsp:include>
    <div class="main_center1" style="width: 1180px;
         height:700px;
         margin: 0px auto;
         position: relative;">
        <div id="content">
            <h1>&nbsp;</h1>

            <div id="wrapper">
                <div id="steps">
                    <form id="registerForm" name="formElem" action="http://localhost:8080/agriculture/doRegister" method="post" onsubmit="return sub();">
                        <fieldset class="step">
                            <legend>注册</legend>
                            <p>
                                <label for="username">用户名</label>
                                <input id="username" name="username" />
                            </p>
                            <p>
                                <label for="password">密码</label>
                                <input id="password" name="password" type="password" AUTOCOMPLETE=OFF />

                            </p>
                            <p>
                                <label for="password">确认密码</label>
                                <input id="realPassword" name="password" type="password" AUTOCOMPLETE=OFF />
                            </p>
                        </fieldset>
                        <fieldset class="step">
                            <legend>确认</legend>
                            <p> 请确认您的信息已经正确填写，我们将为您注册一个账号。 </p>
                            <p class="submit">
                                <button id="registerButton" type="button" onclick="sub()">注册</button>
                            </p>
                        </fieldset>
                    </form>
                </div>
                <div id="navigation" style="display:none;">
                    <ul >
                        <li class="selected"> <a href="#">用户信息</a> </li>
                        <li > <a href="#">确认</a> </li>
                    </ul>
                </div>
            </div>
        </div>
     <jsp:include page="bottom.jsp"></jsp:include>
    </div>
</body>
</html>
