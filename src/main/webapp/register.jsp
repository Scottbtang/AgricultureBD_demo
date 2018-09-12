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
    <div class="main_center78"
         style="width: 1180px;
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

                            <div id="tip" style="margin-top: 270px;color:  red;">

                            </div>
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

                        <li id="confirmInformation">  </li>

                    </ul>
                </div>
            </div>
        </div>
     <jsp:include page="bottom.jsp"></jsp:include>
    </div>
<script type="text/javascript">

    var fieldsetCount = $('#formElem').children().length;


    var current 	= 1;


    var stepsWidth	= 0;
    var widths 		= new Array();
    $('#steps .step').each(function(i){
        var $step 		= $(this);
        widths[i]  		= stepsWidth;
        stepsWidth	 	+= $step.width();
    });
    $('#steps').width(stepsWidth);



    $('#formElem').children(':first').find(':input:first').focus();


    $('#navigation').show();




    $("#realPassword").bind("input propertychange", function() {
        var tipText=document.getElementById('tip');
        var confirmInformation=document.getElementById('confirmInformation');
        var password1=$('#password').val();
        var password2=$('#realPassword').val();
        console.log(password1);
        console.log(password2);

        if(password1 != password2){
            tipText.innerText="您两次密码不一致！";
            confirmInformation.innerHTML="";
        }else{
            tipText.innerText="两次密码一致！";
            var aLink=document.createElement('a');
            aLink.href='#';
            aLink.innerText="确认";
            confirmInformation.appendChild(aLink);
        }


        $('#navigation a').bind('click',function(e){
            var $this	= $(this);
            var prev	= current;
            $this.closest('ul').find('li').removeClass('selected');
            $this.parent().addClass('selected');

            current = $this.parent().index() + 1;

            $('#steps').stop().animate({
                marginLeft: '-' + widths[current-1] + 'px'
            },500,function(){
                if(current == fieldsetCount)
                    validateSteps();
                else
                    validateStep(prev);
                $('#formElem').children(':nth-child('+ parseInt(current) +')').find(':input:first').focus();
            });
            e.preventDefault();
        });


        $('#formElem > fieldset').each(function(){
            var $fieldset = $(this);
            $fieldset.children(':last').find(':input').keydown(function(e){
                if (e.which == 9){
                    $('#navigation li:nth-child(' + (parseInt(current)+1) + ') a').click();
                    /* force the blur for validation */
                    $(this).blur();
                    e.preventDefault();
                }
            });
        });


        function validateSteps(){
            var FormErrors = false;
            for(var i = 1; i < fieldsetCount; ++i){
                var error = validateStep(i);
                if(error == -1)
                    FormErrors = true;
            }
            $('#formElem').data('errors',FormErrors);
        }

        /*
        validates one fieldset
        and returns -1 if errors found, or 1 if not
        */
        function validateStep(step){
            if(step == fieldsetCount) return;

            var error = 1;
            var hasError = false;
            $('#formElem').children(':nth-child('+ parseInt(step) +')').find(':input:not(button)').each(function(){
                var $this 		= $(this);
                var valueLength = jQuery.trim($this.val()).length;

                if(valueLength == ''){
                    hasError = true;
                    $this.css('background-color','#FFEDEF');
                }
                else
                    $this.css('background-color','#FFFFFF');
            });
            var $link = $('#navigation li:nth-child(' + parseInt(step) + ') a');
            $link.parent().find('.error,.checked').remove();

            var valclass = 'checked';
            if(hasError){
                error = -1;
                valclass = 'error';
            }
            $('<span class="'+valclass+'"></span>').insertAfter($link);

            return error;
        }

        /*
        if there are errors don't allow the user to submit
        */
        $('#registerButton').bind('click',function(){
            if($('#formElem').data('errors')){
                alert('Please correct the errors in the Form');
                return false;
            }
        });
    });
</script>
</body>
</html>
