<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" CONTENT="Wed, 26 Feb 2016 08:21:57 GMT">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="images/yn.png" />
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<link href="css/index.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="css/nongye_price.css" />
	<link href="css/tab.css" rel="stylesheet" type="text/css">
	<link href="css/loginUser.css" rel="stylesheet" media="all"><%--登录css--%>
	<style type="text/css">
		#se {
			position: absolute;
			top: 220px;
			margin: 20px auto 0px;
			width: 800px;
			height: 250px;
			left: 122px;
		}
		#type {
			position: absolute;
			top: 230px;
			margin: 20px auto 0px;
			width: 400px;
			height: 250px;
			left: 798px
		}
		#type a {
			position: absolute;
			padding: 3px 6px;
			font-family: Microsoft YaHei;
			color: #fff;
			TOP: 0px;
			font-weight: bold;
			text-decoration: none;
			left: 0px
		}
		#type a:hover {
			border: #eee 1px solid;
		}
		#type .red {
			color: black
		}
		#highcharts-8{
			top:40px;
		}
		.price_3{
			width:1200px;
		}
		.content_left{
			float:left;
			width:49%;
			margin-left:8px;
			border-right: 1px solid #dfdfdf;
			border-top:1px solid #dfdfdf;
		}
		.content_right{
			float:left;
			width:49%;
			border-top:1px solid #dfdfdf;
		}
		.content h3{
			/* margin-left:30px; */
			text-align: center;
			margin-top:20px;
		}
		.kind_nav{
			display: flex;
			width: 1180px;
			height: 500px;
		}
		#pie{
			flex:1 1 auto;
			width: 100%;
			height: 400px;
		}
		#ndgr{
			flex:1 1 auto;
			width: 100%;
			height: 400px;
		}
	</style>

	<%--登录弹窗CSS--%>
	<style type="text/css">
		.overCurtain {
			border-top:1px solid rgb(230,245,255);
			position:absolute;
			height:674px;
			width:100%;
			left:0px;
			top:0px;
			opacity:0.7;
			display:none;
			background-color:rgb(230,245,255);
		}
		.hide-center {
			width:308px;
			height:300px;
			position:absolute;
			right:0;
			left:0;
			bottom:0;
			top:0;
			margin:auto;
			display:none;
			z-index:1;
		}
		.hide-center #formhead {
			width:300px;
			height:42px;
			margin:0;
			padding-top:12px;
			padding-bottom:-30px;
			border-top-left-radius:10px;
			border-top-right-radius:10px;
			background-color:#101010;
		}
		.hide-center #formhead-title {
			width:100px;
			height:24px;
			margin-left:106px;
			margin-right:36px;
			color:#bfbfbf;
			font-weight:900;
			display:inline-block;
		}
		.hide-center #close {
			width:35px;
			height:20px;
			border:0;
			border-radius:20%;
			background-color:red;
			color:white;
			display:inline-block;
		}
		.hide-center #formbody {
			width:300px;
			height:245px;
			background-color:#1e1e1e;
			border-bottom-left-radius:10px;
			border-bottom-right-radius:10px;
		}
		.hide-center .loginHead {
			margin-right:-8px;
			padding:13px;
			width:25px;
			height:28px;
			background-color:#141414;
			vertical-align:middle;
		}
		.hide-center .loginInput {
			height:52px;
			width:230px;
			padding-left:10px;
			border:0;
			background-color:#141414;
			color:aliceblue;
		}
		.hide-center .loginUserName {
			padding-left:30px;
			padding-top:30px;
		}
		.hide-center .login1 #img-topleft-loginHead {
			border-top-left-radius:5px;
		}
		.hide-center .login1 #input-topright-loginInput {
			border-top-right-radius:5px;
		}
		.hide-center .login1 #img-bottomleft-loginHead {
			border-bottom-left-radius:5px;
		}
		.hide-center .login1 #input-bottomright-loginInput {
			border-bottom-right-radius:5px;
		}
		.hide-center .loginPassword {
			padding-left:30px;
		}
		.hide-center #formfoot {
			margin-top:30px;
			margin-left:30px;
		}
		.hide-center #BSignIn {
			border:0;
			background:#329d90;
			color:#ffffff;
			width:240px;
			height:40px;
			border-bottom-left-radius:5px;
			border-bottom-right-radius:5px;
			border-top-left-radius:5px;
			border-top-right-radius:5px;
		}
	</style>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/highcharts.js"></script>
	<script type="text/javascript" src="js/radialIndicator.min.js"></script>
	<script type="text/javascript" src="js/jquery.dialogBox.js"></script>
	<script type="text/javascript" src="js/echarts.js"></script>
	<script type="text/javascript" src="js/animalbuttoncolor.js"></script>
	<script type="text/javascript" src="js/koala.min.1.5.js"></script>
	<script>
        jQuery(document).ready(function($) {
            $('.theme-login').click(function(){
                $('.theme-popover-mask').fadeIn(100);
                $('.theme-popover').slideDown(200);
            })
            $('.theme-poptit .close').click(function(){
                $('.theme-popover-mask').fadeOut(100);
                $('.theme-popover').slideUp(200);
            })

        })
	</script>
</head>
<body>
<!----------------------------- 导航栏部分----------------------- -->
<div id="type-dialogBox"></div>
<div class="top_t">
	<div class="top_tittle">
		<div class="logo" style="font-size: 22px">
			<font color="white">全国农业市场信息大数据分析平台 </font>
		</div>
		<span style="display: none"> </span>
			<div class="theme-popover">
				<div class="theme-poptit">
					<a href="javascript:;" title="关闭" class="close">×</a>
					<h3>登录</h3>
				</div>
				<div class="theme-popbod dform">
					<%--<li>--%>
					<%--<li><h4>欢迎登录全国农业市场信息大数据分析平台</h4></li>--%>
					<%--<li><strong>用户名：</strong><input class="ipt" type="text" name="log" value="" size="20" id="inputAccount" /></li>--%>
					<%--<li><strong>密  码：&nbsp</strong><input class="ipt" type="password" name="pwd" value="" size="20" id="inputPassword"/></li>--%>
						<%--&lt;%&ndash;<li><input class="btn btn-primary" type="submit" name="submit" value=" 登 录 " id="loginButton"/></li>&ndash;%&gt;--%>
					<%--<li><button id="loginButton">登 录</button>--%>
						<%--<button id="registerButton">注 册</button></li>--%>
					<%--</li>--%>
							<table border="0" align="center">
								<h3>欢迎登录全国农业市场信息大数据分析平台</h3>
								<tr>
									<th><strong>用户名：</strong></th>
									<th><input class="ipt" type="text" name="log" value="" size="20" id="inputAccount" /></th>
								</tr>
								<tr>
									<td><strong>密  码：&nbsp</strong></td>
									<td><input class="ipt" type="password" name="pwd" value="" size="20" id="inputPassword"/></td>
								</tr>
								<tr>
									<td><button id="loginButton">登 录</button></td>
									<td><button id="registerButton">注 册</button></td>
								</tr>
							</table>
				</div>
			</div>



		<div class="nav">
			<ul>
				<li><a href="./index.jsp">首页</a></li>
				<%--<li><a href="./control.jsp" class="nav_aclick">数据监控</a></li>--%>
				<li><a href="./control" >数据监控</a></li>
				<li><a href="./contrast" >数据查询</a></li>
				<li><a href="./forecast">价格预测</a></li>
				<li><a href="./EnterpriseMap">企业地图</a></li>

				<li id="login-btn"> <a class="btn btn-primary btn-large theme-login" href="javascript:;">登录系统</a></li>
				<li id="logout-btn"> <a class="btn btn-primary btn-large" href="javascript:;" name="logout">退出登录</a></li>

			</ul>
		</div>
	</div>
</div>
<!------------------------------- 结束 ----------------------------->
<script>
    $(document).ready(function(){
        // 点击退出登录按键
        $("a[name='logout']").click(function(){
            localStorage.removeItem('agiculture-status');
            $.ajax({
                type:"GET",
                url:"http://localhost:8080/agriculture/doLogout",
                contentType:"application/x-www-form-urlencoded",
				data:{
                    method:"logout"
				},
                success:function (data) {
                    alert(data);
                },error:function () {
                    alert("退出系统错误");
                }
            });
            window.location.href="http://localhost:8080/agriculture/index.jsp";
        });
        // 点击登录按键
		function doLogin(){
            var account = $("#inputAccount").val();
            var password = $("#inputPassword").val();
            console.log(account+":"+password);
            $.ajax({
                type:"POST",
                url:"http://localhost:8080/agriculture/doLogin",
                contentType:"application/x-www-form-urlencoded",
                data:{
                    log:account,
                    pwd:password
                },
                success:function (data) {
                    alert(data);
					localStorage.setItem('agiculture-status',data);
                    window.location.reload();
                },error:function () {
                    alert("登录提交错误");
                }
            });
		}
        $("#loginButton").click(doLogin);

		function doRegister(){
            window.location.href="http://localhost:8080/agriculture/register.jsp";
		}
        $("#registerButton").click(doRegister);

		if(localStorage.getItem('agiculture-status')){
			$("#login-btn").hide();
            $("#logout-btn").show();
        }else{
            $("#logout-btn").hide();
            $("#login-btn").show();
        }

    });
</script>
</body>
</html>