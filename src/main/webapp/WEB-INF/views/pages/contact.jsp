<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/order.css">
<script
	src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://smtpjs.com/v3/smtp.js">
</script>
<style>
.cookie {
	border-style: none;
}
</style>


</head>

<body>
	<div class="banner">
		<img src="${pageContext.servletContext.contextPath }/img/banner.jpg"
			alt="" class="banner-box">
	</div>

	<p style="font-size: 30px;">FENCI SHABUSHABU</p>
	<p>408台中市南屯區公益路二段51號18樓</p>
	<div class="info01">
		<img src="${pageContext.servletContext.contextPath }/img/phone.png"
			alt="">04-22918833 <img
			src="${pageContext.servletContext.contextPath }/img/location.png"
			alt=""><a href="#restaurantplace">查看地圖</a>
	</div>
	<hr>
	<h2>請確認訂位與聯絡資訊</h2>
	<div class="place1">

		<div class="placeleft">
			<div class="left1">
				<h3>訂位資訊</h3>
				<input type="text" id="uid" name="uid" class="cookie"
					style="display: none"> <label for="people">訂位人數</label> <input
					type="text" id="people" name="people" class="cookie"
					readonly="readonly"><br /> <label for="date">訂位日期</label>
				<input type="text" id="date" name="date" class="cookie"
					readonly="readonly"><br /> <label for="time">用餐時段</label>
				<input type="text" id="time" name="time" class="cookie"
					readonly="readonly"><br /> 
					<label for="brench">用餐分店</label>
				<input type="text" id="brench" name="brench" class="cookie"
					readonly="readonly"><br />
					 <a
					href="/shabushabu/reservation"><button class="btn2">回上一步</button></a>
			</div>
		</div>
		<br />
		<div class="placeright">
			<div class="right1">
				<h3>聯絡資訊</h3>
				<label for="rName">訂位姓名</label> <input type="text" id="rName"
					name="rName" value="${rName}"> <br /> <label for="mobile">連絡電話</label>
				<input type="text" id="mobile" name="mobile" value="${mobile}">
				<br /> <label for="email">電子信箱</label> <input type="text"
					id="email" name="email" value="${email}"> <br> <br>
				<button id="btn" class="btn3">確認訂位</button>
				<br> <br>
				<div>
					<a href="/shabushabu/login"><button id="btn1" class="btn">會員登入</button></a>
				</div>



			</div>
		</div>
	</div>

	<hr />
	<h2>餐廳資訊</h2>
	<div class="place2" id="restaurantplace">
		<section class="iframe" >
	<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3640.067312126196!2d120.6952483148239!3d24.16937198438444!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346917e59c559963%3A0x9c04a29df563b24f!2zNDA25Y-w5Lit5biC5YyX5bGv5Y2A5YyX5bGv6LevMjMwLTXomZ8!5e0!3m2!1szh-TW!2stw!4v1630669912236!5m2!1szh-TW!2stw"
				width="500" height="300" frameborder="0" style="border: 0;" allowfullscreen=""
				loading="lazy"></iframe>
		</section>
<section class="right">
			<br>
			<div class="info">
				<img
					src="${pageContext.servletContext.contextPath }/img/location.png"
					alt="">位置<br>406台中市北屯區北屯路230-5號

			
			<br> 
			
				<img src="${pageContext.servletContext.contextPath }/img/phone.png"
					alt="">電話<br>04-2291-1111
			
			<br> 
			
				<img src="${pageContext.servletContext.contextPath }/img/clock.png"
					alt="">營業時間<br>星期一至星期日<br> 11:30-14:00 17:30-22:30
			</div>
			<div class="info1">
				<img
					src="${pageContext.servletContext.contextPath }/img/location.png"
					alt="">位置<br>434台中市龍井區中央路一段193號

			
			<br> 
			
				<img src="${pageContext.servletContext.contextPath }/img/phone.png"
					alt="">電話<br>04-2291-2222
			
			<br> 
			
				<img src="${pageContext.servletContext.contextPath }/img/clock.png"
					alt="">營業時間<br>星期一至星期日<br> 11:30-14:00 17:30-22:30
			</div>
			<div class="info2">
				<img
					src="${pageContext.servletContext.contextPath }/img/location.png"
					alt="">位置<br>510彰化縣員林市中山路一段777號

			
			<br> 
			
				<img src="${pageContext.servletContext.contextPath }/img/phone.png"
					alt="">電話<br>04-2291-3333
			
			<br> 
			
				<img src="${pageContext.servletContext.contextPath }/img/clock.png"
					alt="">營業時間<br>星期一至星期日<br> 11:30-14:00 17:30-22:30
			</div>
			<div class="info3">
				<img
					src="${pageContext.servletContext.contextPath }/img/location.png"
					alt="">位置<br>500彰化縣彰化市辭修路206號

			
			<br> 
			
				<img src="${pageContext.servletContext.contextPath }/img/phone.png"
					alt="">電話<br>04-2291-4444
			
			<br> 
			
				<img src="${pageContext.servletContext.contextPath }/img/clock.png"
					alt="">營業時間<br>星期一至星期日<br> 11:30-14:00 17:30-22:30
			</div>
			<div class="info4">
				<img
					src="${pageContext.servletContext.contextPath }/img/location.png"
					alt="">位置<br>600嘉義市西區錦州二街28號

			
			<br> 
			
				<img src="${pageContext.servletContext.contextPath }/img/phone.png"
					alt="">電話<br>04-2291-8833
			
			<br> 
			
				<img src="${pageContext.servletContext.contextPath }/img/clock.png"
					alt="">營業時間<br>星期一至星期日<br> 11:30-14:00 17:30-22:30
			</div>
		</section>
  </div>

	<hr>
	<section>
		<br>
		<p>【內用開放公告】</p>
		<p>非常感謝各位貴賓的耐心等候！ 合各縣市政府店內用餐指引 麻辣鍋各門店已開放內用 (詳細開放訂位依各門店資訊為準)</p>
		<p style="font-size: 14px">
			● 台中門店內用採單點消費(無提供套餐)，請依服務人員帶位入座<br> ● 用餐區域採隔板、梅花座保持安全距離<br>
			● 服務人員將全程配戴面罩及口罩<br> ● 貴賓離席後桌面、菜單皆全面消毒<br>

			※各門店供應餐點及用餐方式請電洽門店由專人為您服務。
		</p>
		<p>
		<p>【訂位須知】 需於用餐前24小時訂位；線上開放60天內預約訂位。</p>
		<p style="font-size: 14px">
			*用餐時間限90分鐘，訂位保留10分鐘，逾時將自動取消座位。<br>
			*訂位完成後，系統恕不接受用餐當日更改訂單，如需更改請致電各營業據點。<br>
			*本店無電梯，訂位不指定座位，如有特別需求請提前致電告知，您的需求將視現場實際座位狀況安排。<br>
			*如遇訂位相關問題歡迎電洽各營業據點，由專人為您服務。<br>
		</p>
	</section>
	<script>

	

		$(function() {
				
			 
			
			//Cookie 資料填入表格
			if (Cookies.get("reservation") != undefined) {
				let info = JSON.parse(decodeURIComponent(Cookies
						.get("reservation")));
				console.log(info); // typeof JSONobject
				if (info != null) {
					let people = info.people;
					$("#people").val(people);
					let date = info.date;
					$("#date").val(date);
					let time = info.time;
					$("#time").val(time);
					let brench = info.brench;
					$("#brench").val(brench);
					let pb = info.pb;
					$("iframe").prop("src","http://www.google.com/maps/embed?pb="+pb);
				}
			}
	
			$(".info").show();
			 $(".info").siblings().hide();
		      
		     if ($("#brench").val() === "台中龍井店") {
		      	$(".info1").show();
		      	$(".info1").siblings().hide();
		      	
		     }else if ($("#brench").val() === "彰化員林店") {
		  	    $(".info2").show();
		  	    $(".info2").siblings().hide();
		        
		 
		  	 }else if ($("#brench").val() === "彰化旗艦店") {
			  	$(".info3").show();
			    $(".info3").siblings().hide();
		      
		     }else if ($("#brench").val() === "嘉義西區店") {
			    $(".info4").show();
			    $(".info4").siblings().hide();
		     }else {
		    	$(".info").show();
		    	$(".info").siblings().hide();
		     }
			//Cookie 資料填入表格
			if (Cookies.get("user") != undefined) {
				let userInfo = JSON.parse(decodeURIComponent(Cookies
						.get("user")));
				let uid = userInfo.uid;
				if (uid != null) {
					$("#uid").val(uid);
				}
			}

			// 傳入資料庫
			$("#btn").on("click",
					
					function insertForm() {
								//JSON
								let data = {};
								data.uid = $("#uid").val();
								data.people = $("#people").val();
								data.date = $("#date").val();
								data.time = $("#time").val();
								data.brench = $("#brench").val();
								data.rName = $("#rName").val();
								data.mobile = $("#mobile").val();
								data.email = $("#email").val();

								console.log(data);
								$.ajax({
											type : "POST",
											url : "${pageContext.request.contextPath }/pages/contact.controller",
											data : JSON.stringify(data),
											contentType : "application/json; charset=utf-8",
											success : function(res) {
												console.log(res);
												Email.send({
								                    Host: "smtp.gmail.com",
								                    Username: "fendishabu@gmail.com",
								                    Password: "FendiShabu333",
								                    To: 'ken95168@gmail.com',
								                    From: "fendishabu@gmail.com",
								                    Subject: "訂位成功",
								                    Body: "<h5>您好，</h5><p>"+$("#rName").val()+"(先生/小姐)在Fenci Shabushabu預定"+$("#date").val()+"  "+$("#time").val()+"  "+$("#people").val()+"位用餐</p><p>已為您安排訂位，謝謝</p><p>Fenci Shabushabu 團隊</p>"
								                }).then( 
								                );
												alert("訂位成功，您的訂位資訊已通過Email寄送，謝謝");
												Cookies.remove("reservation");
												Cookies.remove("user");
												window.location.href="/shabushabu/";
												

											},
											error : function(e) {
												alert("Error" + e);
											}
										});
							})

		})
	</script>
</body>

</html>