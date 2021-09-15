<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>火鍋界Fendi</title>
<link rel="shortcut icon" href="<%=path %>/picture/hotpoticon.jpg">
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=path %>/css/styles.css" />
<link rel="stylesheet" href="<%=path %>/css/takeout.css" />
<script src="<%=path %>/js/jquery-3.4.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>
<link rel="stylesheet" href="<%=path %>/css/smallcart.css" />

<style>


.header{
    background:url('${pageContext.servletContext.contextPath}/picture/pot.jpg');
    max-width:100%;
    height: 500px;
    background-repeat: no-repeat;
    background-size:cover;
    background-position: center;
    position: relative;
    top: -110px;
  }
  
  #logo{
		width:200px;
		}
	

</style>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a href="${pageContext.request.contextPath}/"><img id="logo" alt="" src="${pageContext.servletContext.contextPath}/picture/logo1.png"></a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="${pageContext.request.contextPath}/pages/takeout.typeController">外帶</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="${pageContext.request.contextPath}/reservation">訂位</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="${pageContext.request.contextPath}/pages/fmenu.typeController">菜單</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="${pageContext.request.contextPath}/location">分店資訊</a></li>
				</ul>
			</div>
		</div>
	</nav>
<div class="header">
        <div>

        </div>
    </div>
	<h3>熱門推薦</h3>
	<br>
	<br>
	<ul id="tab">
		<li id="tab1">精選湯頭</li>
		<li id="tab2">精選套餐</li>
		<li id="tab3">精選單點</li>
		<li id="tab4">精選甜點</li>
	</ul>
	<div id="container">
		<div id="content1">
			<ul class="ordermenu ">
			<c:forEach var="worthSoup" items="${type.worthSoup}">
				<li>
					<div class="item">
						<div class="txt" item-id="${worthSoup.i9sId }" item-type="${worthSoup.i9sType }">
							<button type="button" class="btn01" 
								data-target="#myModal">
								<img class="Img" src="${pageContext.request.contextPath}/picture/${worthSoup.i9sPicture}">				    
								<span class="item-name">${worthSoup.i9sName}</span>
								<span class="NT">NT$ </span><span class="item-price">${worthSoup.i9sPrice}</span> 
								<span class="cal">熱量: </span><span class="item-kcal">${worthSoup.kcal}</span>
							</button>
						</div>
		                 <br>
						<div class="clickbtn">
							<span>數量</span>
							<button class="add">+</button>
							<span class="count">1</span>
							<button class="reduce">-</button>
							<a href="javascript:;" class="btn btn-secondary">加入購物車</a>
						</div>
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>

		<div id="content2">
			<ul class="ordermenu ">
				<c:forEach var="meal" items="${type.setMeal}" varStatus="status">
				<li>
					<div class="item">
						<div class="txt" item-id="${meal.id }" item-type="${meal.type }">								
							<button type="button" class="btn01" data-toggle="modal"
								data-target="#myModal">
								<img class="Img" src="${pageContext.request.contextPath}/picture/${meal.picture}">
								<span class="item-name">${meal.name}</span> <br>
								<span class="NT">NT$ </span><span class="item-price">${meal.price}</span> <br>
								<span class="cal">熱量: </span><span class="item-kcal">${meals.totalKcals[status.index]}</span>
								<c:forEach var="items" items="${meals.setMealList[status.index]}">
								<input class="test" type="hidden" value="${items.i9sName}"/>			
								</c:forEach>	
							</button>
						</div>
						<br>
						<div class="item-soup">
							<c:forEach var="freeSoup" items="${type.freeSoup}">
							<label>
							<input name="soup" type="radio" id="freeSoup${freeSoup.i9sId}" value="${freeSoup.i9sId}">${freeSoup.i9sName}</input>
							</label>
							</c:forEach>
						</div>
						<div class="clickbtn">
							<span>數量</span>
							<button class="add">+</button>
							<span class="count">1</span>
							<button class="reduce">-</button>
							<a href="javascript:;" class="btn btn-secondary">加入購物車</a>
						</div>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
	
	
		<div id="content3">
			<ul class="ordermenu">
			<c:forEach var="i9s" items="${type.i9s}">
				<li>
					<div class="item">
						<div class="txt" item-id="${i9s.i9sId }" item-type="${i9s.i9sType }">
							<button type="button" class="btn01" 
								data-target="#myModal">
								
								<img class="Img" src="${pageContext.request.contextPath}/picture/${i9s.i9sPicture}">
								<span class="item-name">${i9s.i9sName}</span> <br>
								<span class="NT">NT$ </span><span class="item-price">${i9s.i9sPrice}</span> <br>
								<span class="cal">熱量: </span><span class="item-kcal">${i9s.kcal}</span>
						
							</button>
						</div>
				         <br>
						<div class="clickbtn">
							<span>數量</span>
							<button class="add">+</button>
							<span class="count">1</span>
							<button class="reduce">-</button>
							<a href="javascript:;" class="btn btn-secondary">加入購物車</a>
						</div>
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>
		
		<div id="content4">
			<ul class="ordermenu">
			<c:forEach var="dessert" items="${type.dessert}">
				<li>
					<div class="item">
						<div class="txt" item-id="${dessert.i9sId }" item-type="${dessert.i9sType }">
							<button type="button" class="btn01" 
								data-target="#myModal">
								<img class="Img" src="${pageContext.request.contextPath}/picture/${dessert.i9sPicture}">
							
								<span class="item-name">${dessert.i9sName}</span> <br>
								<span class="NT">NT$ </span><span class="item-price">${dessert.i9sPrice}</span> <br>
								<span class="cal">熱量: </span><span class="item-kcal">${dessert.kcal}</span>
						
							</button>
						</div>
					    <br>
						<div class="clickbtn">
							<span>數量</span>
							<button class="add">+</button>
							<span class="count">1</span>
							<button class="reduce">-</button>
							<a href="javascript:;" class="btn btn-secondary">加入購物車</a>
						</div>
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>
	</div>
        <img class="carticon" src="<%=path %>/picture/smallcart.png" alt="">
    <div id="smallcart">
        <div class="modal-header">
            <h5 class="modal-title">購物車</h5>
            <button type="button"><span>&times;</span></button>
        </div>
        <table class="modal-body">
                <tr>
                    <td><span>伊比利豬</span>
                    <td> <span>1</span></td>
                    <td><button>&times;</button></td>
                </tr>
        </table>
        <div class="modal-footer">
            <button id="toCart" type="button" class="btn">結帳去</button>
        </div>
    </div>
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title"></h4>
					<button type="button" class="btn" data-dismiss="modal">X</button>
				</div>
				<div class="modal-body">
					<br> <img class="img-fluid rounded mb-5"
						src=""/>
					<ul>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	 <footer class="footer text-center">
            <div class="container">
                <div class="row">
                    <!-- Footer Location-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">地址</h4>
                        <p class="lead mb-0">
                            台中市南屯區公益路二段51號18樓
                        </p>
                    </div>
                    <!-- Footer Social Icons-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">相關網站</h4>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-facebook-f"></i></a>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-twitter"></i></a>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-linkedin-in"></i></a>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-dribbble"></i></a>
                    </div>
                    <!-- Footer About Text-->
                    <div class="col-lg-4">
                        <h4 class="text-uppercase mb-4">聯絡資訊</h4>
                        <p class="lead mb-0">
                           電話: (04)23265860<br>
                        
                           電子郵件:weitsung@iii.org.tw
                        </p>
                    </div>
                </div>
            </div>
        </footer>
        <div class="copyright py-4 text-center text-white">
            <div class="container"><small>Copyright &copy; Your Website 2021</small></div>
        </div>
<script>
	$(function() {
		$(".modal-footer>#toCart").on("click", function() {
			if (Cookies.get("user")!=undefined && Cookies.get("cart")!=undefined) {
				window.location.href="/shabushabu/cartlist";
			} else if (Cookies.get("cart")==undefined) {
				alert("請選擇餐點！");
			} else if (Cookies.get("cart")!=undefined && Cookies.get("user")==undefined) {
				alert("請先登入會員");
				window.location.href='/shabushabu/login';
			}
		})
		function refreshCart() {
	        let endpoint = "/shabushabu/cartdetail"
			$("#smallcart>.modal-body").empty();
			$.ajax({
				type: "get",
				url: endpoint
			}).then(function(data) {
				let setMealList = data.setMealList;
				let i9sList = data.i9sList;
				for(let i=0; i<setMealList.length; i++) {
					$("#smallcart>.modal-body").append(
							"<tr class='row'>"+ 
								"<td class='col-6'>" + "<span>"+ setMealList[i][0] +"</span>" + "</td>" + 
								"<td class='col-3'>" + "<span>"+ setMealList[i][1] +"</span>" + "</td>" + 
								"<td class='col-3'>" + "<button>&times;</button>" + "</td>" + 
							"</tr>");
				}
				for(let i=0; i<i9sList.length; i++) {
					$("#smallcart>.modal-body").append(
							"<tr class='row'>"+ 
								"<td class='col-6'>" + "<span>"+ i9sList[i][0] +"</span>" + "</td>" + 
								"<td class='col-3'>" + "<span>"+ i9sList[i][1] +"</span>" + "</td>" + 
								"<td class='col-3'>" + "<button>&times;</button>" + "</td>" + 
							"</tr>");
				}
			    // 從購物車移除品項，資料出現才能綁定事件   
			    $("#smallcart>.modal-body>tr>td>button").on("click", function() {
			    	let cart = JSON.parse(decodeURIComponent(Cookies.get("cart")));
			    	let cart_item = cart[0];
			    	let itemName = $(this).parent().siblings("td").eq(0).children("span").text();
			    	let idx = cart_item.map(item => item.itemName).indexOf(itemName);
			    	cart_item.splice(idx, 1);
			    	if(cart_item.length==0){
			    		Cookies.remove("cart");
			    	} else {
				    	cart.splice(0, 1, cart_item); // 把舊的cart_item刪掉後將新的cart_item放進cart裡面
				    	Cookies.set("cart", encodeURIComponent(JSON.stringify(cart)));
			    	}
			    	refreshCart();
			    });
			})
		}
	    refreshCart();
		$(".clickbtn > .btn").on("click", function() {
			// 還需要往購物車加入總金額 & 總熱量
			if (Cookies.get("cart") == undefined) {
		         // Cookie沒有購物車新增一個給Cookie
		         // 將選取的東西加入item物件
		         let item = {};
		         item.itemId = parseInt($(this).parent().siblings(".txt").attr("item-id"));
		         item.itemName = $(this).parent().siblings(".txt").children().children(".item-name").text();
		         item.typeId = parseInt($(this).parent().siblings(".txt").attr("item-type"));
		         if (item.typeId == 2) {
		        	item.soupId = parseInt($(this).parent().siblings(".item-soup").children("label").children("input[name='soup']:checked").val());
		         }
		         item.qty = parseInt($(this).siblings(".count").text());
		         console.log(item.qty);
		         // 放購物車品項
		         let cart_item = [];
		         cart_item.push(item);
		         // 放總金額 & 總熱量
		         cart_total = {};
		         let unitPrice = parseInt($(this).parent().siblings(".txt").children().children(".item-price").text());
		         let unitKcal = parseInt($(this).parent().siblings(".txt").children().children(".item-kcal").text());
		         cart_total.totalAmount = unitPrice * item.qty;
		         cart_total.totalKcal = unitKcal * item.qty;
		         let cart = [];
		         cart.push(cart_item);
		         cart.push(cart_total);
		         Cookies.set("cart", encodeURIComponent(JSON.stringify(cart)));
		         refreshCart();
		         $("#smallcart").toggle();
		       } else {
		         let cart = JSON.parse(decodeURIComponent(Cookies.get("cart")));
		         let cart_item = cart[0];
		         let cart_total = cart[1];
		         let itemId = parseInt($(this).parent().siblings(".txt").attr("item-id"));
		         let itemName = $(this).parent().siblings(".txt").children().children(".item-name").text();
		         let unitPrice = parseInt($(this).parent().siblings(".txt").children().children(".item-price").text());
		         let unitKcal = parseInt($(this).parent().siblings(".txt").children().children(".item-kcal").text());
		         let addQty = parseInt($(this).siblings(".count").text());
		         let typeId = parseInt($(this).parent().siblings(".txt").attr("item-type"));
		         // 找出品項是否有在購物車
		         let idx = cart_item.map(item => item.itemName).indexOf(itemName);
		         if (idx !== -1) {
		           // 如果購物車有相同品項，檢查套餐是不是選同一個鍋底
		           if (cart_item[idx].typeId == 2) {
		        	   let selectedSoup = cart_item[idx].soupId;
		        	   let addSoup = parseInt($(this).parent().siblings(".item-soup").children("label").children("input[name='soup']:checked").val());
		        	   if (addSoup == selectedSoup) {
			           	   cart_item[idx].qty += addQty;
			           	   cart_total.totalAmount += addQty * unitPrice;
			           	   cart_total.totalKcal += addQty * unitKcal;
		        	   } else {
		        		// 沒有的話就把該品項加到cart_item[]
				           let item = {};
				           item.itemId = itemId;
				           item.itemName = itemName;
				           item.typeId = typeId;
					       item.soupId = addSoup;
				           item.qty = addQty;
				           cart_item.push(item);
				           cart_total.totalAmount += addQty * unitPrice;
				           cart_total.totalKcal += addQty * unitKcal;
		        	   }
			           Cookies.set("cart", encodeURIComponent(JSON.stringify(cart)));
			           refreshCart();
		           } else {
				           cart_item[idx].qty += addQty;
				           cart_total.totalAmount += addQty * unitPrice;
				           cart_total.totalKcal += addQty * unitKcal;
				           Cookies.set("cart", encodeURIComponent(JSON.stringify(cart)));
				           refreshCart();
		           }
		         } else {
		           // 沒有的話就把該品項加到cart_item[]
		           let item = {};
		           item.itemId = itemId;
		           item.itemName = itemName;
		           item.typeId = typeId;
		           if (item.typeId == 2) {
			       		item.soupId = parseInt($(this).parent().siblings(".item-soup").children("label").children("input[name='soup']:checked").val());
			       }
		           item.qty = addQty;
		           cart_item.push(item);
		           console.log(cart_item);
		           cart_total.totalAmount += addQty * unitPrice;
		           cart_total.totalKcal += addQty * unitKcal;
		           Cookies.set("cart", encodeURIComponent(JSON.stringify(cart)));
		           refreshCart();
		         }
		       }
		})
		$('.btn01').click(function(){
			var image = $(this).children("img").prop('src');
			var mealName = $(this).children("p").eq(0).text();
			var mealId = $(this).children("input").val();
			var i9sList = $(this).children('input[class="test"]').length;
			$('#myModal ul').empty();
			for(let i=0;i<i9sList;i++){
				var i9s = $(this).children('input[class="test"]').eq(i).val();
				$('#myModal ul').append('<li>'+i9s+'</li>');
			}
			$('#myModal h4').text(mealName)
			$('#myModal img').prop('src',image)
		})
		$('.add').click(function() {
			var n = $(this).next().html();
			var num = parseInt(n) + 1;
			$(this).next().html(num);

		});
		$('.reduce').click(function() {
			var n = $(this).prev().html();
			var num = parseInt(n) - 1;
			if (num == 0) {
				return;
			}
			$(this).prev().html(num);
		});
		$("#tab1").on("click", function(){
		   $('#content1').show();
		   $('#content2').hide();
		   $('#content3').hide();
		   $('#content4').hide();
		})   
		$("#tab2").on("click", function(){
		   $('#content2').show();
		   $('#content1').hide();
		   $('#content3').hide();
		   $('#content4').hide();  
		})
		$("#tab3").on("click", function(){
		   $('#content3').show();
		   $('#content1').hide();
		   $('#content2').hide();
		   $('#content4').hide();
		})  
		$("#tab4").on("click", function(){
		   $('#content4').show();
		   $('#content1').hide();
		   $('#content2').hide();
		   $('#content3').hide();
		}) 
	  $(".carticon").click(function () {
            $("#smallcart").toggle();
        });
      $(" .modal-header button").click(function () {
           $("#smallcart").hide();
      });
	});
</script>
</body>
</html>