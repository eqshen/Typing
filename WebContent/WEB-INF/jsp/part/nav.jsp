<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <style>
 		nav ul li{font:bold 20px "微软雅黑",Arial,Times;color: black;}
		#site-nav{background-color: black;}
		#nav-div1{float:right;margin-right: 30px;}
 </style>   
 <script>
 	var userinfo="${session.username}";
 	
 </script>
<nav style="background:#f4f4f4;height:60px;border-bottom: 1px solid #d8e1e6;">
					<!-- <a class="navbar-brand image-anchor">
						<img src="img/logo.png"/>
					</a> -->
					<span style="font-size:25px;line-height: 60px;font-family: 微软雅黑">欢迎使用, ${session.username}</span>
					<div  id="nav-div1" >
						<ul id="nav-menu" class="nav navbar-nav">
							<li class="mynav-li"><a href="#">键位练习</a></li>
							<li class="mynav-li"><a href="./">打字测试</a></</li>
							<!--<li class="mynav-li dropdown" >
								<a class="dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"" href="#">
									更多
									<span class="caret"></span>
								</a>
								<ul style="" class="harf-tou dropdown-menu" aria-labelledby="dropdownMenu1">
									<li id="login_item">登录</li>
									<li id="logout_item">注销</li>
								</ul>
							</li> -->
							<!-- <li class="mynav-li"><a href="#">Info</a></</li>
							<li class="mynav-li"><a href="#">More</a></</li> -->
						</ul>
					</div>
				</nav>