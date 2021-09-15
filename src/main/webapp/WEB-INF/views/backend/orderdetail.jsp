<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>鍋奉行後台</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.js"></script>
<style>
body {
  margin: 0;
  font-family: "Lato", sans-serif;
}

.sidebar {
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: #f1f1f1;
  position: fixed;
  height: 100%;
  overflow: auto;
}

.sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}
 
.sidebar a.active {
  background-color: #04AA6D;
  color: white;
}

.sidebar a:hover:not(.active) {
  background-color: #555;
  color: white;
}

div.content {
  margin-left: 200px;
  padding: 0 15px;
  height: auto;
}

@media screen and (max-width: 700px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
  .sidebar a {float: left;}
  div.content {margin-left: 0;}
}

@media screen and (max-width: 400px) {
  .sidebar a {
    text-align: center;
    float: none;
  }
}

.row {
	text-align: center;
}
.items {
	text-align: right !important;
	padding-right: 265px !important;
}


#navbar a:hover {background-color: #ddd;}
.dropdown:hover #navbar {display: block;}
#navbar {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 90px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  height: 200px;
  top: 1px;
  left:110px;
  text-align:center;
}

#navbar a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

#logo{
	width:200px;
	position:absolute;
	bottom:0;
}

#backToPrev {
    position: fixed;
    bottom: 0;
    right: 0;
    margin-bottom: 250px;
    margin-right: 200px;
}

.thead-dark tr th {
 height:80px;
}

h3,p{
margin-top:8px;
margin-bottom:0px;
}

.ttt{
font-size:20px;
}

.ttt1{
font-size:26px;
}
</style>
</head>
<body>
<div class="sidebar">
  <h1><a href="#home" class="active">後台管理</a></h1>
  <div class="dropdown">
    <a href="${pageContext.servletContext.contextPath}/pages/i9s/1" class="dropdown">餐點管理</a>
    <div id="navbar" class="dropdown-menu">
      <a href="${pageContext.servletContext.contextPath}/pages/type1">食材</a>
      <a href="${pageContext.servletContext.contextPath}/backend/selectAllMeal.controller">套餐</a>
      <a href="${pageContext.servletContext.contextPath}/pages/type3">湯底</a>  
      <a href="${pageContext.servletContext.contextPath}/pages/type4">甜點</a> 
    </div>
  </div>
  <a href="${pageContext.servletContext.contextPath }/cms/orders/page/1">訂單管理</a>
  <a href="${pageContext.servletContext.contextPath }/cms/table.controller/page/1">訂位管理</a>
  <a href="${pageContext.servletContext.contextPath }/backend/sales">業績管理</a>
  <a href="${pageContext.servletContext.contextPath }/logout">登出</a>
  <img id="logo" alt="" src="${pageContext.servletContext.contextPath}/picture/11.png">
</div>

<div class="content">
	<table class="table">
	    <thead class="thead-dark">
	      <tr class="row">
	        <th style="vertical-align:middle; border:0;" class="col"><h3>訂單號碼</h3></th>
	        <th style="vertical-align:middle; border:0;" class="col"><h3>會員手機</h3></th>
	        <th style="vertical-align:middle; border:0;" class="col"><h3>分店</h3></th>
	        <th style="vertical-align:middle; border:0;" class="col"><h3>取餐時間</h3></th>
	        <th style="vertical-align:middle; border:0;" class="col"><h3>金額</h3></th>
	      </tr>
	    </thead>
	    <tbody>
		  <tr class="row ttt">
	        <td class="col">${orderList.id }</td>
	        <td class="col">${orderList.userMobile }</td>
	        <td class="col">${orderList.takeoutStore }</td>
	        <td class="col orderDate">${orderList.orderDate }</td>
	        <td class="col price total">${orderList.totalAmount }</td>
		  </tr>
		</tbody>
	</table>
	<table class="table">
    <c:if test="${orderDetails.orderSetMeal.size()>0 }">
    <thead class="thead-light">
      <tr class="row ttt1">
        <th style="vertical-align:middle; border:0;" class="col-4"><p>套餐</p></th>
        <th style="vertical-align:middle; border:0;" class="col-4"><p>數量</p></th>
        <th style="vertical-align:middle; border:0;" class="col-4"><p>金額</p></th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="orderSetMeal" items="${orderDetails.orderSetMeal }" varStatus="i">
    	  <tr class="row ttt">
     		  <td class="col-4">${orderSetMeal.name }</td>
      		  <td class="col-4 item-qty">${orderQtys.orderSetMealQty[i.index] }</td>
       		  <td class="col-4 price items">${orderSetMeal.price }</td>
      	  </tr>
    </c:forEach>
    </tbody>
    </c:if>
    <c:if test="${orderDetails.orderI9s.size()>0 }">
    <thead class="thead-light">
      <tr class="row ttt1">
        <th style="vertical-align:middle; border:0;" class="col-4">單點</th>
        <th style="vertical-align:middle; border:0;" class="col-4">數量</th>
        <th style="vertical-align:middle; border:0;" class="col-4">金額</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="orderI9s" items="${orderDetails.orderI9s }" varStatus="i">
    	  <tr class="row ttt">
     		  <td class="col-4">${orderI9s.i9sName }</td>
      		  <td class="col-4 item-qty">${orderQtys.orderI9sQty[i.index] }</td>
       		  <td class="col-4 price items">${orderI9s.i9sPrice }</td>
      	  </tr>
    </c:forEach>
    </tbody>
    </c:if>
  </table>
  <button type="button" class="btn btn-secondary" id="backToPrev">返回訂單管理</button>
</div>
<script>
	//金額加上會計格式
	let items = $(".price").length;
	for(let i=0; i<items; i++) {
		let total = $(".price").eq(i).text();
		total = total.split(/(?=(?:...)*$)/);
		total = total.join(",");
		$(".price").eq(i).text("$ "+total);
	}
	
	$("#backToPrev").on("click", function() {
        history.back();
    })
    
     let orderLength = $(".orderDate").length;
     for (let i=0; i<orderLength; i++) {
         let orderDate = new Date($(".orderDate").eq(i).text());
         let formateDate = moment(orderDate).format("YYYY-MM-DD hh:mm");
         $(".orderDate").eq(i).text(formateDate);
     }
</script>
</body>
</html>