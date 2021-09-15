<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>
  <script src="<%=path %>/js/jquery.datetimepicker.full.min.js"></script>
  <script src="https://www.gstatic.com/firebasejs/4.12.1/firebase.js"></script>
  <script src="https://www.gstatic.com/firebasejs/4.12.1/firebase-firestore.js"></script>
  <link rel="stylesheet" href="<%=path %>/css/jquery.datetimepicker.css" />
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<title>鍋奉行購物車</title>
<style>
.btn {
   float: right;
 }
th {
	font-size: 20px;
}
.cartlist>td {
	font-size: 18px;
}
.cartlist>.item-qty {
	padding-left: 200px;
} 
.cartlist>.item-price, .total-amount {
	text-align: right;
	padding-right: 320px !important;
}
p {
	margin-left: 1px;
}
body {
	margin-top: 10px;
}
</style>

</head>
<body>
<div class="container">
  <h2>購物車清單</h2><button type="button" class="btn btn-secondary" id="emptyCart" style="margin-bottom:10px">清空購物車</button>
  <p>您欲外帶的品項如下</p> 
  <table class="table">
    <c:if test="${cartDetail.setMealList.size()>0 }">
	    <thead class="thead-dark">
	      <tr class="row">
	        <th class="col">套餐</th>
	        <th class="col">數量</th>
	        <th class="col">金額</th>
	      </tr>
	    </thead>
	    <tbody>
	    <c:forEach var="setMeal" items="${cartDetail.setMealList }">
	      <tr class="row cartlist">
	        <td class="col">
		        <dl>
		        	<dt style="font-size:20px">${setMeal[0].name }</dt>
		        	<dd style="text-indent: 2em; color:gray"><${setMeal[1] }></dd>
		        </dl>
	        </td>
	        <td class="item-qty col">${setMeal[2] }</td>
	        <td class="item-price col">${setMeal[0].price }</td>
	      </tr>
	    </c:forEach>
    </c:if>
    <c:if test="${cartDetail.i9sList.size()>0 }">
	     <tr class="thead-light row">
	        <th class="col">單點</th>
	        <th class="col">數量</th>
	        <th class="col">金額</th>
	      </tr>
		  <c:forEach var="i9s" items="${cartDetail.i9sList }">
		    <tr class="row cartlist">
		      <td class="col">${i9s[0].i9sName }</td>
		      <td class="item-qty col">${i9s[1] }</td>
		      <td class="item-price col">${i9s[0].i9sPrice }</td>
		    </tr>
		  </c:forEach>
  	</c:if>
	    <tr class="row">
          <td class="col"><strong style="font-size:20px">總金額</strong></td>
          <td class="col"></td>
          <td class="col total-amount"><strong style="font-size:20px">${cartDetail.total[0] }</strong></td>
        </tr>
    </tbody>
  </table>
  <table class="table">
      <thead class="thead-dark">
      <tr class="row">
        <th class="col">備註</th>
        <th class="col"></th>
      </tr>
    </thead>
    <tbody>
      <tr class="row">
        <td class="col">總熱量</td>
        <td class="col">${cartDetail.total[1] } Kcal</td>
      </tr>
      <tr class="row">
        <td class="col">請選擇取餐的分店</td>
        <td class="col">
        	<select id="branch">
        		<option>台中北屯店</option>
        		<option>台中龍井店</option>
        		<option>彰化員林店</option>
        		<option>彰化旗艦店</option>
        		<option>嘉義西區店</option>
        	</select>
        	<span></span>
        </td>
      </tr>
      <tr class="row">
        <td class="col">預計領取餐點時間</td>
        <td class="col"><input id="datetimepicker" type="text" ><span></span></td>
      </tr>
      <tr class="row">
        <td class="col">手機號碼</td>
        <td class="col"><input id="mobile" type="tel"><span></span></td>
      </tr>
    </tbody>
  </table>
  <button type="button" class="btn btn-secondary" id="returnTakeOut" style="float:left">返回訂餐</button>
  <button type="button" class="btn btn-secondary" id="placeOrder">確認訂餐</button>
  <script>
    $(function() {
        // Your web app's Firebase configuration
        // For Firebase JS SDK v7.20.0 and later, measurementId is optional
        let firebaseConfig = {
			apiKey: "AIzaSyCZud6389peJs9Ns2gWNbgbPWuAd3d1p6o",
			authDomain: "fendishabu-c6e6d.firebaseapp.com",
			databaseURL: "https://fendishabu-c6e6d-default-rtdb.firebaseio.com",
			projectId: "fendishabu-c6e6d",
			storageBucket: "fendishabu-c6e6d.appspot.com",
			messagingSenderId: "215823760498",
			appId: "1:215823760498:web:e44e3ea9c96182a1b316eb",
			measurementId: "G-4L3K47YRJ0"
		};
        // Initialize Firebase
        firebase.initializeApp(firebaseConfig);
    	let userinfo = (Cookies.get("user")!=undefined)?JSON.parse(decodeURIComponent(Cookies.get("user"))):null;
    	(userinfo==null)?$("#mobile").attr("placeholder", "0912345678"):$("#mobile").val(userinfo.mobile);
    	const rules = /^09\d{8}$/;
    	$("#mobile").on("change blur", function(){
   			$("#mobile").siblings("span").empty();
    		if (!rules.test($("#mobile").val())){
    			$("#mobile").siblings("span").text(" 手機格式有誤").css("color", "red");
    		} else {
    			$("#mobile").siblings("span").html(" "+'<i class="fa fa-check" aria-hidden="true" style="color:green; font-size:20px"></i>');
    		}
    	});
   		$("#datetimepicker").on("change", function(){
   			$("#datetimepicker").siblings("span").empty();
   			if ($("#datetimepicker").val()==""){
   			$("#datetimepicker").siblings("span").text(" 請選擇領取餐點時間").css("color", "red");
	   		} else {
	   			$("#datetimepicker").siblings("span").html(" "+'<i class="fa fa-check" aria-hidden="true" style="color:green; font-size:20px"></i>');
	   		}
   		});
    	$("#returnTakeOut").on("click", function() {
    		window.location.href='/shabushabu/pages/takeout.typeController';
    	});
    	$("#emptyCart").on("click", function() {
    		Cookies.remove("cart");
    		alert("購物車已清空");
    		window.location.href='/shabushabu';
    	})
    	// 計算品項金額
    	let items = $(".item-qty").length;
    	for(let i=0; i<items; i++) {
	    	let qty = parseInt($(".item-qty").eq(i).text());
	    	let unitpx = parseInt($(".item-price").eq(i).text());
	    	let totalpx = (qty * unitpx).toString();
	    	totalpx = totalpx.split(/(?=(?:...)*$)/);
	    	totalpx = totalpx.join(",");
	    	$(".item-price").eq(i).text("$ "+totalpx);
    	}
    	let totalAmount = $(".total-amount>strong").text();
    	totalAmount = totalAmount.split(/(?=(?:...)*$)/);
    	totalAmount = totalAmount.join(",");
    	$(".total-amount>strong").text("$ "+totalAmount);
    	
    	$("#placeOrder").on("click", function() {
   			let pickupTime = $("#datetimepicker").val();
   			let checkMobile = rules.test($("#mobile").val());
    		let branch = $("#branch").val();
   			let data = {};
   			data.pickupTime = pickupTime;
   			data.branch = branch;
    		if (!pickupTime=="" && checkMobile){
    			// 把新的手機號碼更改到cookie & firebase displayName
    			let mobile = $("#mobile").val()
    			userinfo.mobile = mobile;
    			Cookies.set("user", encodeURIComponent(JSON.stringify(userinfo)),{expires:0.1});
    		    let user = firebase.auth().currentUser;
    		    console.log(user);
    		    let displayName = mobile;
   		        user.updateProfile({
   		         	displayName: displayName
   		        });
    			$.ajax({
	    			type: "post",
	    			url: "/shabushabu/orders",
	    			data: JSON.stringify(data),
	    			contentType: "application/json"
	    		}).then(function(data) {
	    			if ("下單成功！"===data) {
	    				alert(data);
	    				Cookies.remove("cart");
	    				Cookies.remove("user");
						window.location.href='/shabushabu';
	    			} else if ("下單失敗！"===data) {
	    				alert(data);
	    			}
	    		})
    		}
    		if (pickupTime=="") {
    			$("#datetimepicker").siblings("span").text(" 請選擇領取餐點時間").css("color", "red");
    		}
    		if (!checkMobile) {
	    		$("#mobile").siblings("span").text(" 手機格式有誤").css("color", "red");
    		}
    	})
    	
    $('#datetimepicker').datetimepicker({
        minDate: new Date(),
        maxDate: new Date(),
        minTime: 0,
        maxTime: "22:00",
        step: 15,
      });
    });
  </script>
</div>
</body>
</html>