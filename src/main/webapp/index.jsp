<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>全国农业市场信息大数据分析平台</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="images/yn.png"  />
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<link rel="stylesheet" type="text/css" href="css/nongye_price.css" />
	<link rel="stylesheet" type="text/css" href="css/buttonstyle.css" />
    <link rel="stylesheet" type="text/css" href="css/textStyle.css">

<style>
	.a1 {
		height: 350px;
		width: 700px;
		margin-top: 20px;
		margin-right: 20px;
        margin-bottom: 30px;
        margin-left: 10px;
		float:left;
	}
	.a2{
        height: 200px;
		width: 420px;
		float: left;
        margin-top: 100px;
        margin-right: 30px;
        margin-bottom: 100px;
        margin-left: 20px;
	}
	.a3{
		height: 200px;
		width: 420px;
		float: left;
        margin-top: 100px;
        margin-right: 20px;
        margin-bottom: 100px;
        margin-left: 30px;
	}
	.a4{
        height: 350px;
        width: 700px;
        margin-top: 20px;
        margin-right: 10px;
        margin-bottom: 30px;
        margin-left: 20px;
        float:left;
	}
    .a5{
        height: 350px;
        width: 700px;
        margin-top: 20px;
        margin-right: 20px;
        margin-bottom: 30px;
        margin-left: 10px;
        float:left;
    }
    .a6{
        height: 200px;
        width: 420px;
        float: left;
        margin-top: 100px;
        margin-right: 30px;
        margin-bottom: 100px;
        margin-left: 20px;
    }
</style>
</head>
<body >

<!----------------------------- 导航栏部分----------------------- -->
<jsp:include page="top.jsp"></jsp:include>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
<script type="text/javascript" src="js/radialIndicator.min.js"></script>
<script type="text/javascript" src="js/jquery.dialogBox.js"></script>
<script type="text/javascript" src="js/echarts.js"></script>
<script type="text/javascript" src="js/animalbuttoncolor.js"></script>

<!--  -->
<script type="text/javascript" src="js/koala.min.1.5.js"></script>
<div class="main">
	<div class="main_center" >
		<jsp:include page="foto.jsp"></jsp:include><%--新页面导入--%>


				<div id="bMap" style="width: 1200px;height:1200px;">
                    <video src="video/xcp.mp4" width="1180" height="680" controls="controls"></video>
					<div class ="a1" >
                        <img src="./images/JK.jpg" style="border-radius:20px"  height="350" width="650"/>
				</div>
					<div class ="a2"  style="text-align:center;">
                        <div class="container">
                            <div class="coolText">
                                <div class="left">
                                    <div class="content">
                                        <h1 style="font-size: 20px">数据监控</h1>
                                        <p style="font-size: 15px">监控爬取数量</p>
                                        <p style="font-size: 15px">查询历史信息</p>
                                        <p style="font-size: 15px">针对市场详细查询</p>
                                        <p style="font-size: 15px">获取更多的数据，掌握市场快人一步</p>
                                    </div>
                                </div>

                                <div class="right">
                                    <div class="content">
                                        <h1 style="font-size: 20px">数据监控</h1>
                                        <p style="font-size: 15px">监控爬取数量</p>
                                        <p style="font-size: 15px">查询历史信息</p>
                                        <p style="font-size: 15px">针对市场详细查询</p>
                                        <p style="font-size: 15px">获取更多的数据，掌握市场快人一步</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
					<div class="a3" style="text-align:center;">
                        <div class="container">
                            <div class="coolText">
                                <div class="left">
                                    <div class="content">
                                        <h1 style="font-size: 20px">数据查询</h1>
                                        <p style="font-size: 15px">获取市场历史数据</p>
                                        <p style="font-size: 15px">区域行情对比</p>
                                        <p style="font-size: 15px">动态对比详细数据</p>
                                        <p style="font-size: 15px">静态参照历史数据</p>
                                        <p style="font-size: 15px">彻底掌握市场行情，全面了解发展趋势</p>
                                    </div>
                                </div>

                                <div class="right">
                                    <div class="content">
                                        <h1 style="font-size: 20px">数据查询</h1>
                                        <p style="font-size: 15px">获取市场历史数据</p>
                                        <p style="font-size: 15px">区域行情对比</p>
                                        <p style="font-size: 15px">动态对比详细数据</p>
                                        <p style="font-size: 15px">静态参照历史数据</p>
                                        <p style="font-size: 15px">彻底掌握市场行情，全面了解发展趋势</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
					<div class="a4">
                        <img src="./images/CX.jpg" style="border-radius:20px" height="350" width="650"/>
					</div>
                    <div class="a5">
                        <img src="./images/YC.jpg" style="border-radius:20px" height="350" width="650"/>
                    </div>
                    <div class="a6" style="text-align:center;">
                        <div class="container">
                            <div class="coolText">
                                <div class="left">
                                    <div class="content">
                                        <h1 style="font-size: 20px">价格预测</h1>
                                        <p style="font-size: 15px">采用指数移动平均加权算法，权威预测未来行情</p>
                                        <p style="font-size: 15px">预测价格，掌握未来，迈向成功</p>
                                    </div>
                                </div>

                                <div class="right">
                                    <div class="content">
                                        <h1 style="font-size: 20px">价格预测</h1>
                                        <p style="font-size: 15px">采用指数移动平均加权算法，权威预测未来行情</p>
                                        <p style="font-size: 15px">预测价格，掌握未来，迈向财富</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
	</div>
		<jsp:include page="bottom.jsp"></jsp:include>
</div>
	<%--客服--%>
	<style type="text/css">
		*{margin:0;padding:0;list-style-type:none;}
		a,img{border:0;}

		/* suspend */
		.suspend{width:40px;height:198px;position:fixed;top:200px;right:0;overflow:hidden;z-index:9999;}/*客服标签*/
		.suspend dl{width:120px;height:198px;border-radius:25px 0 0 25px;padding-left:40px;box-shadow:0 0 5px #e4e8ec;}
		.suspend dl dt{width:40px;height:198px;background:url(images/suspend.png);position:absolute;top:0;left:0;cursor:pointer;}
		.suspend dl dd.suspendQQ{width:120px;height:85px;background:#ffffff;}
		.suspend dl dd.suspendQQ a{width:120px;height:85px;display:block;background:url(images/suspend.png) -40px 0;overflow:hidden;}
		.suspend dl dd.suspendTel{width:120px;height:112px;background:#ffffff;border-top:1px solid #e4e8ec;}
		.suspend dl dd.suspendTel a{width:120px;height:112px;display:block;background:url(images/suspend.png) -40px -86px;overflow:hidden;}
	</style>
	<div class="suspend">
		<dl>
			<dt class="IE6PNG"></dt>
			<dd class="suspendQQ"><a href="http://shang.qq.com/wpa/qunwpa?idkey=cb91b633f1db596a948828f4f333dbb7394ceda014c958cf" target="_blank"></a></dd>
			<dd class="suspendTel"><a href="javascript:void(0);"></a></dd>
		</dl>
	</div><%--客服链接--%>


<script type="text/javascript">
    $(document).ready(function(){

        $(".suspend").mouseover(function() {
            $(this).stop();
            $(this).animate({width: 160}, 400);
        })

        $(".suspend").mouseout(function() {
            $(this).stop();
            $(this).animate({width: 40}, 400);
        });

        $.ajax({
            type:"GET",
            url:"/agriculture/monitor",
            success:function (data) {
                var mydata = [];
                console.log(data);
                var arrayAllData = data.split("\n");
                console.log(arrayAllData);//272
                for(var num=0;num<arrayAllData.length-1;num++){
                    console.log(arrayAllData[num]);
                    var arrayData=arrayAllData[num].split(",");
                    var Data={
                        type:null,
                        market:null,
                        price:null,
                        date:null
                    };
                    Data.type=arrayData[0];
                    Data.market=arrayData[1];
                    Data.price=arrayData[2];
                    Data.date=arrayData[3];
                    mydata.push(Data);
                }
                localStorage.setItem('mydata',JSON.stringify(mydata));
            }
        })
    });
</script><%--客服脚本--%>
</body>

<script type="text/javascript" src="js/textWord1.js"></script>

</html>