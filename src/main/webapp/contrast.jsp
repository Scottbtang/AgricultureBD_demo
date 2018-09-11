<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
 	<title>全国农业市场信息大数据分析平台</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="images/yn.png" />
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<link rel="stylesheet" type="text/css" href="css/nongye_price.css" />
	<link href="css/tab.css" rel="stylesheet" type="text/css">
	<link href="css/buttonstyle.css" rel="stylesheet" type="text/css">
	<style type="text/css">
		#se {
			position: absolute;
			top: 220px;
			margin: 20px auto 0px;
			width: 800px;
			height: 250px;
			left: 122px;
		}
		#highcharts-8{
			top:40px;
		}

		.content h3{
			margin-left:30px;
			margin-top:60px;
		}
		#price-zhu{
			height:640px; width: 340px; margin-left:-30px;margin-top:-60px;
					 float:left; z-index: 100;
		}
		#price-map{
			height:560px; width: 950px; float:left;
			margin-left:-60px;
		}
	</style>

	</head>
  <body>
  	<!----------------------------- 导航栏部分----------------------- -->
	<jsp:include page="top.jsp"></jsp:include>
	<%--<div class="top_t">--%>
		<%--<div class="top_tittle">--%>
			<%--<div class="logo" style="font-size: 22px">--%>
				<%--<font color="white">全国农业市场信息大数据分析平台 </font>--%>
			<%--</div>--%>
			<%--<span style="display: none"> </span>--%>
			<%--<c:if test="${user!=null }">--%>
				<%--<div class="login_register" style="font-size: 12px">--%>
					<%--<a href="./user.do?method=quit">退出系统</a>--%>
				<%--</div>--%>
			<%--</c:if>--%>
			<%--<c:if test="${user==null }">--%>
				<%--<div class="login_register" style="font-size: 12px">--%>
					<%--<a href="javascript:" onclick="loginUser()">登录系统</a>--%>
				<%--</div>--%>
			<%--</c:if>--%>
			<%--<div class="nav">--%>
				<%--<ul>--%>
					<%--<li><a href="./index.jsp">首页</a></li>--%>
					<%--<li><a href="./control.jsp" >数据监控</a></li>--%>
					<%--<li><a href="./contrast.jsp" class="nav_aclick">数据查询</a></li>--%>
					<%--<li><a href="./forecast.jsp">价格预测</a></li>--%>
					<%--<li><a href="./EnterpriseMap.jsp">企业地图</a></li>--%>
				<%--</ul>--%>
			<%--</div>--%>
		<%--</div>--%>
	<%--</div>--%>
	<!------------------------------- 结束 ----------------------------->
    <div class="main">
		<div class="main_center" >
			<%--此处强行加长了div标签，前端美化的时候可以对此处进行美化--%>
			<div class="price_1" style="width: 1200px;height:1500px;background:#FFF;">

				<div class="title">
					<!-- <br />
					<h2>
						<font color="black" size="4" ><b>区域行情</b>
						</font>
					</h2> -->
					<div id="box">  
				     <ul id="tab">  
				         <li class="four on" id="tab_1" onClick="switchTab(this,0)">区域行情</li>
				         <li class="four" id="tab_2" onClick="switchTab(this,1)">动态对比</li>
				         <li class="four" id="tab_3" onClick="switchTab(this,2)">静态对比</li>
						 <li class="four" id="tab_4" onClick="switchTab(this,3)">数据查询</li>
						 <!-- <li class="three" id="tab_4" onClick="switchTab(this,3)" style="margin:0;">价格走势</li>   -->
				     </ul>
				   </div> 
				</div>
				<div class="content box_content_block">
                    <jsp:include page="areaPrice.jsp"></jsp:include>
				</div>
				<div class="content box_content_hidden">
					<div id="container" style="height:800px;width:1200px;" >
                        <jsp:include page="animateVisual.jsp"></jsp:include>
					</div>
				</div>
				<div class="content box_content_hidden">
						<jsp:include page="dataCompare.jsp"></jsp:include>
				</div>
				<div class="content box_content_hidden" >
					<jsp:include page="datePrice.jsp"></jsp:include>
                </div>
			</div>
			<jsp:include page="bottom.jsp"></jsp:include>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery.min.js"></script> 
	<script type="text/javascript" src="js/highcharts.js"></script>
	<script type="text/javascript" src="js/echarts.js"></script>
	<script type="text/javascript" src="js/highcharts-3d.js"></script> 
	<script type="text/javascript">



		// Step:3 conifg ECharts's path, link to echarts.js from current page.
	    // Step:3 为模块加载器配置echarts的路径，从当前页面链接到echarts.js，定义所需图表路径
	    // require.config({
	    //     paths: {
	    //         echarts: './js'
	    //     }
	    // });
	    




        function switchTab(obj,i){
            $(obj).addClass("on");
            $(obj).siblings().removeClass("on");
            $(".content").eq(i).removeClass("box_content_hidden").addClass("box_content_block");
            $(".content").eq(i).siblings().removeClass("box_content_block").addClass("box_content_hidden");
        }
	</script>


  </body>
</html>
