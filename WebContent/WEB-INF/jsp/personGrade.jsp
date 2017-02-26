<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>成绩-释怀打字</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script type="text/javascript" src="js/jquery-1.11.3.min.js" ></script>
		<script type="text/javascript" src="js/bootstrap.min.js" ></script>
		<style type="text/css">
			#main{padding:100px;background:white ;height:642px;}
		</style>
</head>
<body>
	<header id="header">
		<%@ include  file="part/nav.jsp"%>
	</header>
	<div style="margin: 0px auto;width: 100%;text-align: center;">
			<img alt="" src="./img/smile.jpg">
		</div>
	<div id="main">
		
		<div id="info_div" style="border-radius:5px;width:610px;height:380px;background: white;margin-top: 20px;font-size: 20px;margin: 0px auto;">
						<table  class="table table-hover">
							<tr>
								<td>用时</td>
								<td><span id="timeCount">${timeuse}秒</span></td>
							</tr>
							<tr>
								<td>正确字数:</td>
								<td><span id="rightCount">${rightwords}个</span></td>
							</tr>
							<tr>
								<td>错误字数:</td>
								<td><span id="wrongCount">${wrongwords}个</span></td>
							</tr>
							<tr>
								<td>退格:</td>
								<td><span id="backCount">${backwords}次</span></td>
							</tr>
							<tr>
								<td>打字速度:</td>
								<td><span id="speed">${typespeed}  WPM</span></td>
							</tr>
							<tr>
								<td>击键速度:</td>
								<td><span id="keyspeed">${keyspeed} KPM</span></td>
							</tr>
							<tr>
								<td>正确率:</td>
								<td><span id="rightPercent">${rightPercent} %</span></td>
							</tr>
							<tr>
								<td>注:</td>
								<td><span >WPM=字/分钟，<br>KPM=击键数/分钟</span></td>
							</tr>
						</table>
						<a href="./">再来一次</a>
		</div>
		
	</div>
</body>
</html>