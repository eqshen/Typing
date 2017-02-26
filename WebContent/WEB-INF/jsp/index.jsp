<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>EQ打字</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script type="text/javascript" src="js/jquery-1.11.3.min.js" ></script>
		<script type="text/javascript" src="js/bootstrap.min.js" ></script>
		<script type="text/javascript">
			var username_g="${session.username}";
			var verifyCode="${token}";
			var usertype="tempuser";
			window.onscroll = function(){ 
			    var t = document.documentElement.scrollTop || document.body.scrollTop;  
			    var top_div = document.getElementById( "top_div" ); 
			    if( t >= 650 ) { 
			    	$("#site-nav").css("background-color","black");
			       
			    }else{
			    	$("#site-nav").css("background-color","transparent");
			    }
			} 
			$(document).ready(function(){
				$("#identityUser").change(function(){
					$("#login_block").show(500);
					$("#select_block").hide(500);
				})
				$("#identityNone").change(function(){//如果不登陆
					$("#login_block").hide(500);
					$("#select_block").show(500);
				})
				//页面初始化时加载英文文章标题列表
				loadArticleTitle($("#optionsRadiosEn"));
				//如果浏览器支持cookie,则获取用户信息，否则提示用户打开cookie
				if(navigator.cookieEnabled){
					ajaxpost('getTempUser_aj.php',{'token':verifyCode},function(data, textStatus){
						if(textStatus=='success')
						{
							var msg=data.msg;
							//alert(msg);
							if(msg!='wrong'){
								$("#username").val(msg);
								//username_g=msg;
								//alert(username_g);
							}
						}
					});
				}else{
					alert("请不要禁用cookie");	
				}
				
				//如果用户已登录，则隐藏登录组件
				if(username_g!=''&&username_g!='wrong'){
					$("#usertype_block").hide();
					$("#showUer_block").text("欢迎使用,"+username_g);
					$("#showUer_block").show(500);
					$("#login_item").hide();
				}else{
					$("#login_item").show();
					$("#logout_item").hide();
				}
				
				
				
			})
			function logout(){
				ajaxpost('logOut_aj.php',{},function(data, textStatus){
					if(textStatus=='success')
					{
						var res=data.msg;
						if(res=="注销成功"){
							window.location.reload();
							alert(res);
						}else{
							alert(res);
						}
					}
				});
			}
			//点击查看更多的时候，滚动条自动滚动
			function moveTo(){
				$(window).scrollTop(600);
			}
			function startTest(){
				$("#startTest").attr("action","test_ty.php").submit();
			}
			
			function loadArticleTitle(obj){
				$("#articleSelect").empty();
				ajaxpost('loadAllArticle_aj.php',{'option_type':$(obj).val()},function(data, textStatus){
					if(textStatus=='success')
					{
						var arry=data.articleJsonArray;
						//alert(arry[0].title);
						//alert($(obj).val());
						for( var item in arry){
							if($("#articleSelect [value="+arry[item].ID+"]").text()==arry[item].title){continue;}
							$("#articleSelect").append("<option value='"+arry[item].ID+"'>"+arry[item].title+"</option>");
						}
					}
				});
			}
			function ajaxpost(url,data_dic,callbackFun){
				$.ajax
			       ({
			           cache: false,
			           async: false,
			           type: 'post',
			           url: url,
			           data:data_dic,
			           success:function(data, textStatus){callbackFun(data,textStatus)}
			       });
			}
			function beforeTest(){
				//检验用户是否存在
				ajaxpost('verifyUserName_aj.php',{'username':$("#username").val()},function(data, textStatus){
					if(textStatus=='success')
					{
						var msg=data.msg;
						if(msg=="false"){
							$("#username_msg").text("用户名不存在");
							return;
						}else if(msg=="user"){
							usertype="user"
							$("#username_msg").text("检测到该用户已经设置密码，请输入密码");
							$("#login_block").show(200);
							$("#startTestBtn").hide();
							$("#startTestBtn").attr("onclick","login()");
						}else{
							usertype="tempuser";
							login();
							$("#select_block").show(200);
							$("#login_item").hide();
							$("#startTestBtn").attr("onclick","startTest()");
						}
						
					}
				});
			}
			function login(){
				var username=$("#username").val();
				var pass=$("#password").val();
				 ajaxpost('login_aj.php',{'username':username,'password':pass,'usertype':usertype},function(data, textStatus){
					 if(textStatus=='success'&&data.msg=='true')
						{
							$("#login_block").hide(500);
							$("#select_block").show(500);
							$("#username").attr("readonly","true");
							$("#identityNone").attr("disabled","disabled");
							$("#startTestBtn").show();
							if(usertype=='user'){
								username_g=username;
							}
							$("#login_item").hide();
							//startTest();
						}else{
							alert("用户名或密码错误");
						}
				 })
				 
				/*$.ajax
			       ({
			           cache: false,
			           async: false,
			           type: 'post',
			           url: "login_aj.php",
			           data:{
			        	   'username':username,
			        	   'password':pass
						  },
			           success: function(data, textStatus){
							if(textStatus=='success'&&data.msg=='true')
							{
								$("#login_block").hide(500);
								$("#select_block").show(500);
								$("#username").attr("readonly","true");
								$("#identityNone").attr("disabled","disabled");
							}	
						}
			       });*/
			}
			
		</script>
		<style type="text/css">
			html {overflow-y:scroll;} 
			body {margin:0; padding:29px00; font:12px"\5B8B\4F53",sans-serif;background:#F2F2F2;} 
			div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,textarea,blockquote,p{padding:0; margin:0;} 
			table,td,tr,th{font-size:12px;} 
			li{list-style-type:none;} 
			img{vertical-align:top;border:0;} 
			ol,ul {list-style:none;} 
			address,cite,code,em,th {font-weight:normal; font-style:normal;} 
			/**/
			
			/*main*/
			main{height: 450px;width:800px;padding:50px;background-color:#fff;margin: 0px auto; border: 5px solid #e8e8e8;}
			#main-partType{margin:0px auto;border-radius:3px;width:700px;padding:20px;font-size:18px;}
			#main-partExe{margin-right: 150px;float: left;border-radius:3px;height:300px;width:500px;padding:20px;font-size:18px;background-color: darkgoldenrod;}
			#login_description{font-size: 40px;text-align: center;width: 100%;height: 80px;font-family: "微软雅黑";}
			.my_btn{width: 120px;}
			#main2{background-color: #EFEFEF;width: 100%;height:00px;}
			footer{height: 150px;}
			#select_block{display:none;}
			#login_div {
            width: 900px;
            height: 355px;
            margin: 0px auto;
            background: #fff;
            border: 5px solid #e8e8e8;
        	}
        	a:HOVER {
				text-decoration: none;
			}
			#head_div{height:100px;}
		</style>
	</head>
	<body>
		<div id="page" >
			
			<header>
				<div id="head_div">
			        <div id="" style="height:100%;line-height: 100px;width:1000px;margin: 0px auto;">
			            <a href="./"><span style="color: green;font-size: 80px;font-family: '微软雅黑';">EQ打字</span></a>
			            <span style="color:#4A4A4A; font-size:44px ;margin-left: 20px;border-left: 1px solid gainsboro;">&nbsp;&nbsp;&nbsp;Welcome to Login</span>
			        </div>
			
			    </div>
			</header>
			<div style="height: 100px;border-top: 2px solid green;"></div>
			<main>
				<!-- <div id="main-partExe">
					
				</div> -->
				
				<div id="main-partType" >
					<div id="login_description" >在线打字测试</div>
					<form id="startTest" class="form-horizontal " method="post">
					<div id="showUer_block" class="form-group" style="disply:none;font-size: 25px;font-family:'微软雅黑';text-align: center;"></div>
					<div id="usertype_block">
						<!-- <div id="" class="form-group">
						  	<label for="identity_type" class="col-sm-4 control-label">用户类型:</label>
						    <div class="radio">
						     <label>
							    <input type="radio" name="identity_type" id="identityNone" value="NoID" checked>游客身份
							 </label>
							 <label>
							    <input type="radio" name="identity_type" id="identityUser" value="hasID" >用户登录
							 </label>
						    </div>
						     
						 </div>-->
						<div class="form-group">
						    <label for="username" class="col-sm-4 control-label">用 户 名:</label>
						    <div class="col-sm-5">
						      <input type="text"name="username" value='${username}' class="form-control" id="username" placeholder="用户名">
						    	<span id="username_msg"></span>
						    </div>
						</div>
					</div>
					<div id="login_block" style="display: none;">
					<div class="form-group" id="password_div" >
					    <label for="password" class="col-sm-4 control-label">密码:</label>
					    <div class="col-sm-5">
					      <input type="password"name="password" class="form-control" id="password" placeholder="密码">
					    </div>
					</div>
					<div class="form-group" id="password_div" >
					    <label for="password" class="col-sm-4 control-label">验证码:</label>
					    <div class="col-sm-5">
					      <input type="password"name="password" class="form-control" id="password" placeholder="密码">
					    </div>
					</div>
					<div class="form-group">
					    <div class="col-sm-offset-2 col-sm-8">
					      <button type="button" class="btn btn-success my_btn" onclick="login()">登录</button>&nbsp;&nbsp;
					      <button type="button" class="btn btn-default my_btn">忘记密码</button>
					    </div>
					  </div>
					</div>
					<div id="select_block">
					  <div class="form-group">
					  	<label for="option_type" class="col-sm-4 control-label">测试类型:</label>
					    <div class="radio">
					     <label>
						    <input type="radio" name="option_type" id="optionsRadiosEn" onchange="loadArticleTitle(this)" value="english" checked>英文打字
						 </label>
						 <label>
						    <input type="radio" name="option_type" id="optionsRadiosCn" onchange="loadArticleTitle(this)" value="chinese" >中文打字
						 </label>
					    </div>
					  </div>
					  <div class="form-group">
					  	<label for="articleSelect" class="col-sm-4 control-label">选择文章:</label>
					    <div class="radio">
					     <label>
						    <select name="articleSelect" id="articleSelect" style="width: 210px;">
						    	<!-- <option  value="aaaa">aaaaa</option> -->
						    </select>
						 </label>
					    </div>
					  </div>
					</div> 
					<div class="form-group">
					    <div class="col-sm-offset-5 col-sm-8">
					      <button id="startTestBtn" type="button" class="btn btn-success my_btn" onclick="beforeTest()">开始测试</button>&nbsp;&nbsp;
					    </div>
					</div> 
					</form>
				</div>
				
			</main>
			<div id="main2">
			
			</div>
			<footer></footer>
		</div>
	</body>
</html>
    