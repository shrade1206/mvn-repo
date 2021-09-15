<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reservation</title>

<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.datetimepicker.full.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/order.css">

<script
	src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery.datetimepicker.css" />
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="banner">
		<img src="${pageContext.servletContext.contextPath }/img/banner.jpg"
			alt="" class="banner-box">
	</div>
	<p style="font-size: 30px">FENCI SHABUSHABU</p>
	<p>408台中市南屯區公益路二段51號18樓</p>
	<div class="info01">
		<img src="${pageContext.servletContext.contextPath }/img/phone.png"
			alt="">04-2291-8833 <img
			src="${pageContext.servletContext.contextPath }/img/location.png"
			alt=""><a href="#restaurantplace">查看地圖</a>
	</div>
	<hr>


	<div class="place">
		<div class="left">

			<h2>請選擇訂位資訊</h2>
			<h3>用餐人數</h3>
			<select class="cookie" name="people" id="people" required="required">
				<option value="" disabled selected>請選擇你的用餐人數</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
			</select>
			<h3>訂位日期</h3>
			<input class="cookie" name="date" id="date" placeholder="請選擇訂位日期"
				required="required" />
			<h3>用餐時段</h3>
			<select class="cookie" name="time" id="time"
				style="vertical-align: text-top;" required>
				<option value="11:30" selected>11:30</option>
				<option value="12:00">12:00</option>
				<option value="12:30">12:00</option>
				<option value="17:30">17:30</option>
				<option value="18:00">18:00</option>
				<option value="18:30">18:30</option>
				<option value="19:00">19:00</option>
				<option value="19:30">19:30</option>
				<option value="20:00">20:00</option>
				<option value="20:30">20:30</option>
				<option value="21:00">21:00</option>
			</select>


			<h3>用餐門市</h3>
			<select class="cookie" name="brench" id="brench" required>
				<option value="台中北屯店"
					pb="!1m18!1m12!1m3!1d3640.067312126196!2d120.6952483148239!3d24.16937198438444!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346917e59c559963%3A0x9c04a29df563b24f!2zNDA25Y-w5Lit5biC5YyX5bGv5Y2A5YyX5bGv6LevMjMwLTXomZ8!5e0!3m2!1szh-TW!2stw!4v1630669912236!5m2!1szh-TW!2stw"
					selected>台中北屯店</option>
				<option value="台中龍井店"
					pb="!1m18!1m12!1m3!1d3639.160979530066!2d120.52110021482454!3d24.20114098436913!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x34696aabc93bb3ad%3A0x658bf36dda9ad63!2zNDM05Y-w5Lit5biC6b6N5LqV5Y2A5Lit5aSu6Lev5LiA5q61MTkz6Jmf!5e0!3m2!1szh-TW!2stw!4v1630670285893!5m2!1szh-TW!2stw">台中龍井店</option>
				<option value="彰化員林店"
					pb="!1m18!1m12!1m3!1d3646.0686776626494!2d120.5684463148195!3d23.958011484487464!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346936592f2293e3%3A0xa43cfea1e49e3035!2zNTEw5b2w5YyW57ij5ZOh5p6X5biC5Lit5bGx6Lev5LiA5q61Nzc36Jmf!5e0!3m2!1szh-TW!2stw!4v1630670451219!5m2!1szh-TW!2stw">彰化員林店</option>
				<option value="彰化旗艦店"
					pb="!1m18!1m12!1m3!1d3642.4883027137075!2d120.53510961482216!3d24.08431768442586!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x34693899bb39ae19%3A0x7915b2fec190bcc5!2zNTAw5b2w5YyW57ij5b2w5YyW5biC6L6t5L-u6LevMjA26Jmf!5e0!3m2!1szh-TW!2stw!4v1630670566674!5m2!1szh-TW!2stw">彰化旗艦店</option>
				<option value="嘉義西區店"
					pb="!1m18!1m12!1m3!1d3659.88579690359!2d120.4331150148096!3d23.464583584730992!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346e96a0811780d3%3A0x3d7bc2df53ac9f9f!2zNjAw5ZiJ576p5biC6KW_5Y2A6Yym5bee5LqM6KGXMjjomZ8!5e0!3m2!1szh-TW!2stw!4v1630670774923!5m2!1szh-TW!2stw">嘉義西區店</option>
			</select> <br /> <br />
			<button id="submit" class="btn">下一步填寫聯絡資訊</button>

		</div>
	</div>
	
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<div>
	<h5>配合政府防疫措施，5人以上貴賓或有包廂需求請致電。</h5>
	<h5>如有訂位以外的需求，請撥打電話與我們聯繫04-2291-8833</h5>
	</div>
	<hr />
	
	<h2>餐廳資訊</h2>
	<div class="place2" id="restaurantplace">
		<section class="iframe">

			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3640.067312126196!2d120.6952483148239!3d24.16937198438444!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346917e59c559963%3A0x9c04a29df563b24f!2zNDA25Y-w5Lit5biC5YyX5bGv5Y2A5YyX5bGv6LevMjMwLTXomZ8!5e0!3m2!1szh-TW!2stw!4v1630669912236!5m2!1szh-TW!2stw"
				width="500" height="300" frameborder="0" style="border: 0;"
				"
				loading="lazy"></iframe>
		</section>


		<section class="right">
			<br>
			<div class="info">
				<img
					src="${pageContext.servletContext.contextPath }/img/location.png"
					alt="">位置<br>406台中市北屯區北屯路230-5號 <br> <img
					src="${pageContext.servletContext.contextPath }/img/phone.png"
					alt="">電話<br>04-2291-1111 <br> <img
					src="${pageContext.servletContext.contextPath }/img/clock.png"
					alt="">營業時間<br>星期一至星期日<br> 11:30-14:00 17:30-22:30
			</div>
			<div class="info1">
				<img
					src="${pageContext.servletContext.contextPath }/img/location.png"
					alt="">位置<br>434台中市龍井區中央路一段193號 <br> <img
					src="${pageContext.servletContext.contextPath }/img/phone.png"
					alt="">電話<br>04-2291-2222 <br> <img
					src="${pageContext.servletContext.contextPath }/img/clock.png"
					alt="">營業時間<br>星期一至星期日<br> 11:30-14:00 17:30-22:30
			</div>
			<div class="info2">
				<img
					src="${pageContext.servletContext.contextPath }/img/location.png"
					alt="">位置<br>510彰化縣員林市中山路一段777號 <br> <img
					src="${pageContext.servletContext.contextPath }/img/phone.png"
					alt="">電話<br>04-2291-3333 <br> <img
					src="${pageContext.servletContext.contextPath }/img/clock.png"
					alt="">營業時間<br>星期一至星期日<br> 11:30-14:00 17:30-22:30
			</div>
			<div class="info3">
				<img
					src="${pageContext.servletContext.contextPath }/img/location.png"
					alt="">位置<br>500彰化縣彰化市辭修路206號 <br> <img
					src="${pageContext.servletContext.contextPath }/img/phone.png"
					alt="">電話<br>04-2291-4444 <br> <img
					src="${pageContext.servletContext.contextPath }/img/clock.png"
					alt="">營業時間<br>星期一至星期日<br> 11:30-14:00 17:30-22:30
			</div>
			<div class="info4">
				<img
					src="${pageContext.servletContext.contextPath }/img/location.png"
					alt="">位置<br>600嘉義市西區錦州二街28號 <br> <img
					src="${pageContext.servletContext.contextPath }/img/phone.png"
					alt="">電話<br>04-2291-8833 <br> <img
					src="${pageContext.servletContext.contextPath }/img/clock.png"
					alt="">營業時間<br>星期一至星期日<br> 11:30-14:00 17:30-22:30
			</div>
		</section>
	</div>


	<hr>

	<div class="annocement">
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
	</div>

	<script>
		//日期選擇器
		$(function() {
			$("#date").datepicker();

		});
	</script>
	<script type="text/javascript">
		$(function() {
			$(".info").show();
			$(".info").siblings().hide();
			$("#brench").change(function(val) {
				if ($("#brench").val() === "台中龍井店") {
					$(".info1").show();
					$(".info1").siblings().hide();
				} else if ($("#brench").val() === "彰化員林店") {
					$(".info2").show();
					$(".info2").siblings().hide();

				} else if ($("#brench").val() === "彰化旗艦店") {
					$(".info3").show();
					$(".info3").siblings().hide();

				} else if ($("#brench").val() === "嘉義西區店") {
					$(".info4").show();
					$(".info4").siblings().hide();
				} else {
					$(".info").show();
					$(".info").siblings().hide();
				}
			});
			$("#brench").on(
					"change",
					function() {
						let reservation = {};
						let brench = $("#brench").val();
						let a = "option:contains(" + brench + ")";
						let pb = $(a).attr("pb");
						reservation.pb = pb;
						console.log(reservation);
						Cookies.set("reservation", encodeURIComponent(JSON
								.stringify(reservation)));
						$("iframe").prop("src",
								"http://www.google.com/maps/embed?pb=" + pb);
					});
			$("#submit").click(
						      function doCookieSetUp() {
							   let reservation = Cookies.get("reservation")!=undefined?JSON.parse(decodeURIComponent(Cookies.get("reservation"))):{};
						       reservation.people = $("#people").val();
						       reservation.date = $("#date").val();
						       reservation.time = $("#time").val();
						       reservation.brench = $("#brench").val();
						       console.log(reservation);
						       console.log(JSON.stringify(reservation));
						       Cookies.set("reservation", encodeURIComponent(JSON
						         .stringify(reservation)));
						       window.location.href = "/shabushabu/contact";
				})
		})
	</script>

</body>

</html>