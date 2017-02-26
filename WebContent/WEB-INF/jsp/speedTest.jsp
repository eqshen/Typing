<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>测速-EQ</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script type="text/javascript" src="js/jquery-1.11.3.min.js" ></script>
		<script type="text/javascript" src="js/bootstrap.min.js" ></script>
		<script type="text/javascript">
			var keyCode=0;//当前的按键
			var returnback=0;//按回退键的次数
			//var rightCode=0;//正确字数
			//var wrongCode=0;
			var typeCount=0;//记录击键数
			var timeuse=0;
			var hour=0,min=0,seconds=0;
			var hasStart=false;
			var article="${option_type}";
			var articleSelect="${articleSelect}"
			var article_length="${article_length}";
			var rows='<s:property value="sentenceList.size"/>';
			var verify_code="${token}";
			$(document).ready(function(){
				setFocus($($("#main-content").children()[0]).find("input"));
				//controlScroll();
				$("input").keydown(function(event){
					keyCode=event.which;
					//alert(keyCode);
					if(keyCode==8){returnback++;}
					//else if(keyCode==123){return false;}//屏蔽f12
				});
				//设置main的高度等于main-content的高度
				$("main").height($("#main-content").height()+100);
				
				setInterval(displayInfo,1000);
				infoBlockRealtive();//左侧显示打字速度的窗口相对顶部定位			
			});
			function typeAuto(object){
				hasStart=true;
				typeCount++;//击键次数++
				strVerify(object);
				autoChangeLine(object);
			}
			//提交表单
			function finish(){
				var data=getRightOrWrongCodeCount();
				$("#timeuse").val(timeuse);
				$("#rightwords").val(data[0]);
				$("#wrongwords").val(data[1]);
				$("#backwords").val(returnback);
				$("#typespeed").val(parseInt((data[0]+data[1])/timeuse*60));
				$("#keyspeed2").val(parseInt((typeCount/timeuse)*60));
				$("#token").val(verify_code);
				$("#finish_form").submit();
				
				
			}
			//显示 打字速度框中的信息
			function displayInfo(){
				var data=getRightOrWrongCodeCount();
				//alert(data[1]);
				if(hasStart==false){
					return;
				}
				var rightPercent=parseInt(data[0]*100/(data[0]+data[1]));
				if((data[0]+data[1])==0){rightPercent=0;}
				$("#rightCount").html("<span style='color:green;'>"+data[0]+"</span>");
				$("#wrongCount").html("<span style='color:red;'>"+data[1]+"</span>");
				$("#backCount").html("<span style='color:#660099;'>"+returnback+"</span>");
				addTime();
				changeTimeToHM();
				$("#timeCount").text(hour+"时:"+min+":分"+seconds+"秒");
				//alert(data[0]*100/(data[0]+data[1]));
				$("#rightPercent").text(rightPercent+"%");
				$("#speed").text(parseInt((data[0]+data[1])/timeuse*60)+" WPM");
				$("#keyspeed").text(parseInt((typeCount/timeuse)*60)+" KPM");
				updateProgressBar(data[0]+data[1]);
				
			}
			/*
			*以下是支持函数
			*
			*/
			function addTime(){
				timeuse++;
			}
			//把整秒转换成小时分秒的格式
			function changeTimeToHM(){
				hour=parseInt(timeuse/3600);
				min=parseInt((timeuse-hour*3600)/60);
				seconds=parseInt((timeuse-hour*3600-min*60));
				if(hour<10){hour="0"+hour;}
				if(min<10){min="0"+min;}
				if(seconds<10){seconds="0"+seconds;}
			}
			
			//统计正确和错误的字数，并返回结果
			function getRightOrWrongCodeCount(){
				var green_count=0,red_count=0;
				var all_divs=$("#main-content").children();
				//alert(all_divs.length);
				for(var i=0;i<all_divs.length;i++){
					var str=$(all_divs[i]).find("input").prev().html().trim();
					var r=new RegExp("<span class=\"span-right\">","gi");
					var ma=str.match(r);
					if(ma!=null){
						green_count+=ma.length;
					}
					var r2=new RegExp("<span class=\"span-wrong\">","gi");
					mb=str.match(r2);
					if(mb!=null){
						//alert(mb.length);
						red_count+=mb.length;
					}	
				}
				//alert(green_count);
				//rightCode=green_count;
				//wrongCode=red_count;
				return [green_count,red_count];
				
			}
			
			
			//$("#div_input"+has_type).oninput=function(){strVerify();}
			/*
			function controlScroll(obj){//input obj
				var distance=90;//两个input之间的距离
				var limit=200;//控制焦点距离顶部不超过limit px
				//var obj=$($("#main-content").children()[2]).find("input");
				var div_top=$("#main-content").offset().top;
				var input_top =$(obj).offset().top //$(obj).offset().top+$(obj).height();
				var mtop=input_top-div_top;
				//alert(input_top);
				var old_sc=$("#main-content").scrollTop();//得到该div滚动条相对div顶部的位置
				//alert(mtop+"   "+$("#main-content").height());
				if(mtop>limit &&mtop<=limit+distance){//如果div滚动条没有达到最大
					$(window).scrollTop(90);
					$("#main-content").scrollTop(old_sc+90);
				}else{
					var pos=$(window).scrollTop()
					$(window).scrollTop(pos+90);
				}
			}*/
			function setFocus(obj){
				$(obj).focus();
			}
			//控制右侧的滚动条
			function controlScroll(){
				var top_val=$(window).scrollTop();
				var input_divHeight=$($("#main-content").children()[0]).height();
				$(window).scrollTop(top_val+input_divHeight)
			}
			//当打字本行结束，且本行的最后一位字符正确，则自动换行
			function autoChangeLine(object){
				var str=$(object).prev().html();
				var userInput=$(object).val();
				var resIndex=new Array();
				str=str.trim();
				str=str.replace(/<.*?>/g,'');
				var ch=str.charAt(str.length-1);
				var ch2=userInput.charAt(str.length-1);
				if(userInput.length>=str.length){//如果本行输完，而且最后一个字符正确&&ch==ch2
					//打字完成，自动提交
					//alert(parseInt(object.id.charAt(object.id.length-1))+" "+(parseInt(rows)-1));
					if(parseInt(object.id.charAt(object.id.length-1))>=(parseInt(rows)-1)){
						finish();
						return;
					}
					//自动换行
					//alert(userInput.charAt(str.length));
					if(keyCode==13||keyCode==32){//如果安空格或者回车
						var objt=$(object).parent().next().find("input");
						setFocus(objt);
						//设置该行可输入
						$(objt).removeAttr("readonly");
						controlScroll();
					}
				}
			}
			//更新进度条
			function updateProgressBar(current_length){
				$("#progress_bar").attr("aria-valuemax",parseInt(article_length));
				$("#progress_bar").attr("aria-valuenow",current_length);
				var m=1;
				if(article=='chinese'){m=parseInt(article_length);}
				else{m=(parseInt(article_length)-parseInt(rows)+1);}
				var val_percent=parseInt((current_length)*100/m)+"%";
				$("#progress_bar").css("width",val_percent);
				$("#progress_bar").text(val_percent);
			}
			//显示速度的div跟随滚动条
			function infoBlockRealtive(){
				var menuYloc = $("#info_div").offset().top; 
		        $(window).scroll(function (){ 
		        	//alert(menuYloc);
		            var offsetTop =$(window).scrollTop() +"px"; 
		            $("#info_div").css({top : offsetTop}); 
		        }); 
			}
			//检验每次输入的字符是否正确
			function strVerify(object){
				var str=$(object).prev().html();
				var userInput=$(object).val();
				var resIndex=new Array();
				str=str.trim();
				str=str.replace(/<.*?>/g,'');
				var ch='',uch='';
				for(var i=0;i<userInput.length;i++){
					ch=str.charAt(i);
					uch=userInput.charAt(i);
					if(ch!=uch){
						//if(uch==''){resIndex[i]}
						resIndex[i]=false;
					}else{
						resIndex[i]=true;
					}
				}
				var resStr='';
				for(var i=0;i<str.length;i++){
					//alert(resIndex[i]);
					if(resIndex[i]==false){resStr=resStr+"<span class='span-wrong'>"+str.charAt(i)+"</span>";}
					else if(resIndex[i]==true){resStr=resStr+"<span class='span-right'>"+str.charAt(i)+"</span>";}
					else{resStr+=str.charAt(i);}
				}
				$(object).prev().html(resStr);	
			}
			
			
			
		</script>
		<style type="text/css">
			html {overflow-y:scroll;} 
			body {margin:0; padding:29px00; font:12px"\5B8B\4F53",sans-serif;background:#ffffff;} 
			div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,textarea,blockquote,p{padding:0; margin:0;} 
			table,td,tr,th{font-size:12px;} 
			li{list-style-type:none;} 
			img{vertical-align:top;border:0;} 
			ol,ul {list-style:none;} 
			address,cite,code,em,th {font-weight:normal; font-style:normal;} 
			/**/
			#header{height:80px;}
			nav ul li{font:bold 20px "微软雅黑",Arial,Times;color: white;}
			#site-nav{background-color: black;}
			#nav-div1{float:right;margin-right: 30px;}
			/*.mynav-li{padding-left: 15px;padding-right: 15px;}*/
			/*背景半透明*/
			.harf-tou{
				background-color:rgba(8,8,8,0.5);
			}
			@media \0screen\,screen\9 {/* 只支持IE6、7、8 */
			  .harf-tou{
			    background-color:#080808;
			    filter:Alpha(opacity=50);
			    position:static; /* IE6、7、8只能设置position:static(默认属性) ，否则会导致子元素继承Alpha值 */
			    *zoom:1; /* 激活IE6、7的haslayout属性，让它读懂Alpha */
			  } 
			}/*半透明结束*/
			/*nav导航*/
			.mynav{border-color: transparent;border: 0px;}
			/*main*/
			main{background-color:#D4E7FC;position: relative;top: 50px;width:1349px;height: 1000px;}
			#main-left{float: left;width: 200px;height: 100%;}/*background-color: #4CAE4C;*/
			#main-content{float: left;width:949px;padding: 10px;}
			#main-right{float: left;width: 200px;height: 100%;}
			/*打字部分*/
			#main-content div{background-color: whitesmoke; border: solid 1px #D5D5D5;width: 98%;height: 80px;margin: 0px auto;margin-top: 10px;border-radius:5px;}
			.main-content_div_span{font-family:'楷体';font-size: 26px;margin-left: 10px;background-color:;}
			#main-content div input{font-family:'楷体';background-color: whitesmoke;border:0px;font-size:26px;margin-left: 10px;margin-top:5px;width:95%;}
			.span-wrong{color:red;margin-left:0px;}
			.span-right{color:green;margin-left:0px;}
			table td{font-size: 14px;}
		</style>
	</head>
	<body oncontextmenu="return false" onselectstart="return false">
		<div id="page" >
			<header id="header">
				<%@ include  file="part/nav.jsp"%>
			</header>
			<main>
				<div id="main-left">
					<div id="info_div" style="position:absolute;top:0px;border-radius:5px;width:210px;height:250px;background: white;margin-top: 20px;font-size: 20px;">
						<table  class="table table-hover">
							<tr>
								<td>用时</td>
								<td><span id="timeCount">00时:00分:00秒</span></td>
							</tr>
							<tr>
								<td>正确字数:</td>
								<td><span id="rightCount">0</span></td>
							</tr>
							<tr>
								<td>错误字数:</td>
								<td><span id="wrongCount">0</span></td>
							</tr>
							<tr>
								<td>退格:</td>
								<td><span id="backCount">0</span></td>
							</tr>
							<tr>
								<td>打字速度:</td>
								<td><span id="speed">0  WPM</span></td>
							</tr>
							<tr>
								<td>击键速度:</td>
								<td><span id="keyspeed">0 KPM</span></td>
							</tr>
							<tr>
								<td>正确率:</td>
								<td><span id="rightPercent">0 %</span></td>
							</tr>
						</table>
						<div class="progress">
						  <div id="progress_bar" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="0" style="width: 0%;">
						    0%
						  </div>
						</div>
						注：WPM=字/分钟，<br>
						&nbsp;&nbsp;KPM=击键数/分钟<br>
					</div>
					
				</div>
				<div id="main-content" >
					<!--  <div>
						<span id="" style="">
							盼望着，盼望着东风来了，春天的脚步进了...一切都像刚睡醒的样子
						</span>
						<input maxlength="30" style="" type="text" name="" id="" value="" />
					</div>-->
					
					<s:iterator value="sentenceList" id="tempstr" status="st">
						<div>
							<span class="main-content_div_span" id="div_span<s:property value='#st.index'/>">
								<s:property value="tempstr"/>
							</span>
							<s:if test="%{#st.index==0}">
            					<input  onkeyup="typeAuto(this)" id="div_input<s:property value='#st.index'/>" maxlength="70"  style="" type="text" />
        					</s:if>
							<s:elseif test="%{#st.index!=0}">
								<input readonly="readonly" onkeyup="typeAuto(this)" id="div_input<s:property value='#st.index'/>" maxlength="70"  style="" type="text" />
							</s:elseif>
						</div>
					</s:iterator>
					
				</div><!--end main content -->
				<form id="finish_form" method="post" action="finishType_ty.php">
					
					<input type="hidden" id="timeuse" name="timeuse" value=""/>
					<input type="hidden" id="rightwords" name="rightwords" value=""/>
					<input type="hidden" id="wrongwords" name="wrongwords" value=""/>
					<input type="hidden" id="backwords" name="backwords" value=""/>
					<input type="hidden" id="typespeed" name="typespeed" value=""/>
					<input type="hidden" id="keyspeed2" name="keyspeed" value=""/>
					<input type="hidden" id="token" name="token" value=""/>
					<input type="hidden" id="articleSelect" name="articleSelect" value=""/>
				</form>
				<div id="main-right">
					
				</div>
			</main>
			<footer>
					<div style="margin-top:120px;background: transparent;text-align: center;border: 0px;font-size: 40px;">
						<p>恭喜你，完成打字</p>
					</div>
			</footer>
		</div>
	</body>
</html>
