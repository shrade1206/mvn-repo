<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html, body {
	padding: 0;
	margin: 0;
}

#lineChart {
	margin: auto;
	margin-top: 50px;
	display: inline;
}
#pieChart {
	margin: auto;
	margin-top: 200px;
	display: inline;
}

body {
	margin: 0;
	font-family: "Lato", sans-serif;
}

.input-group {
  width: 30%;
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
	padding: 1px 16px;
	height: auto;
}

@media screen and (max-width: 700px) {
	.sidebar {
		width: 100%;
		height: auto;
		position: relative;
	}
	.sidebar a {
		float: left;
	}
	div.content {
		margin-left: 0;
	}
}

@media screen and (max-width: 400px) {
	.sidebar a {
		text-align: center;
		float: none;
	}
}
.month {
	text-align: center;
}
.dropdown-toggle {
	color: gray;
	float: right;
	padding: 30px !important;
	font-size: 24px;
	
}
#branch>a:focus{
    color: #262626!important;
    background-color: lightgray!important;
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

.title {
  width: 100px;
  height: 50px;
  padding: 0;
  margin: 0;
}

.line {
  width: 112px;
  height: 47px;
  border-bottom: 1px solid white;
  transform: translateY(-20px) translateX(5px) rotate(27deg);
  position: absolute;
  z-index: 1;
}

.title>div {
  position: relative;
  height: 100%;
  width: 100%;
  top: -11px;
  left: -13px;
}

.bottom {
  position: absolute;
  bottom: -20px;
  left: 8px;
  font-size: 16px;
}

.top {
  position: absolute;
  top: 0px;
  right: -14px;
  font-size: 16px;
}

#logo{
	width:200px;
	position:absolute;
	bottom:0;
}

</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script>
	

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
        <a class="dropdown-toggle" data-toggle="dropdown" href="javasacript:;">分店</a>
	    <div id="branch" class="dropdown-menu">
		    <a class="dropdown-item" href="javascript:;">台中北屯店</a>
		    <a class="dropdown-item" href="javascript:;">台中龍井店</a>
		    <a class="dropdown-item" href="javascript:;">彰化員林店</a>
		    <a class="dropdown-item" href="javascript:;">彰化旗艦店</a>
		    <a class="dropdown-item" href="javascript:;">嘉義西區店</a>
	    </div>
	    <div class="row">
		    <div class="col-3">
		  		<canvas id="pieChart" width="400px" height="400px"></canvas>
		    </div>
	    	<div class="col-9" id="lineChartParent">
		  		<canvas id="lineChart" width="1000px" height="600px"></canvas>
		    </div>
	    </div>
		  <br> <br>
		  <table class="table table-bordered">
		    <thead class="thead-dark month">
		      <tr>
		        <th class="title">
		        	<div>
		        		<span class="bottom">年份</span>
		        		<span class="top">月份</span>
		        		<div class="line"></div>
		        	</div>
		        </th>
		        <th>一月</th>
		        <th>二月</th>
		        <th>三月</th>
		        <th>四月</th>
		        <th>五月</th>
		        <th>六月</th>
		        <th>七月</th>
		        <th>八月</th>
		        <th>九月</th>
		        <th>十月</th>
		        <th>十一月</th>
		        <th>十二月</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr></tr>
		      <tr></tr>
    		  <tr></tr>
		    </tbody>
		  </table>
  </div>
	<script>
  	$(function() {
		let data = {};
		// 圓餅圖
		$.ajax({
  			type:"get",
  			url: "/shabushabu/cms/salesforbranches",
  			contentType: "application/json"
  		}).then(function (data) {
			let ctx = document.getElementById("pieChart").getContext("2d");
			let chart = new Chart(ctx, {
  		        type: "pie",
  		        data: {
  		            labels: data.map(x=>x[0]),
  		            datasets: [{
  		                data: data.map(x=>x[1]),
  		                backgroundColor: [ 
  		                'rgba(255, 99, 132, 0.2)',
  		                'rgba(54, 162, 235, 0.2)',
  		                'rgba(255, 206, 86, 0.2)',
  		                'rgba(75, 192, 192, 0.2)',
  		                'rgba(153, 102, 255, 0.2)']
  		            }],
  		        },
  		        options: {
  		        	title: {
  		                display: true,
  		                text: "分店業績占比",
  		                position: "top",
  		                fontSize: 20,
  		                fontStyle: "normal",
  		                fontFamily: "Century Gothic"
  		            },
  		            legend: {
  		            	display: false
  		            },
  		          	tooltips: {
		  	            enabled: true,
		  	            // 同時顯示x軸上的數據
		  	            // 這裡鼠標移到對應點上會同時顯示2020和2021的業績
		  	            mode: 'index',
		  	          	backgroundColor: 'rgba(0, 0, 0, 0.5)',
		  	          	titleFontSize: 24,
		  	          	bodyFontSize: 20,
		  	            // 通過回調修改tooltips的標題
		  	            callbacks: {
		  	              title: function () {
		  	                return new Date().getFullYear() + "年業績總和"
		  	              },
			  	          label: function (t, d) {
			  	              const label = d.labels[t.index];
			  	              let value = d.datasets[t.datasetIndex].data[t.index];
			  	              value = value.toString();
			  	              value = value.split(/(?=(?:...)*$)/);
			  	              value = value.join(",");
			  	              return label + ' : $ ' + value;
			  	          }
		  	            }
		  	        },
  		        	plugins: {
	  		        	labels: [
		  		        	{
		  		        		render: "percentage",
		  		        		position: 'border',
		  		        		textMargin: 1000,
		  		        		fontSize: 20
		  		        	}, 
		  		        	{
		  		        		render: "label",
		  		        		fontSize: 16,
		  		        	}
	  		        	]
  		        	},
  		        	responsive: false
  		        }
  		    })
  		})
  		function salesfigure(data) {
	  		let endpoint = "/shabushabu/cms/salesfigures";
	  		let branch = data.branch;
	  		$.ajax({
	  			type:"get",
	  			url: endpoint,
	  			data: data,
	  			contentType: "application/json"
	  		}).then(function (data) {
	  			$("#lineChart").remove();
	  			$('#lineChartParent').append('<canvas id="lineChart" width="1000px" height="600px"></canvas>');
	  			$("tbody>tr").empty();
				let thisYear = data.thisYear;
				let labelsThisYear = [];
				let dataThisYear = [];
				let lastYear = data.lastYear;
				let labelsLastYear = [];
				let dataLastYear = [];
				// 先插入年份
				if (thisYear.length>0){
					$("tbody>tr").eq(0).append("<td>"+ thisYear[0].month.substring(0,4) +"</td>");
					labelsThisYear = thisYear.map(x=>x.month.substring(5,7));
					dataThisYear = thisYear.map(y=>y.sales);
				}
				if (lastYear.length>0){
					$("tbody>tr").eq(1).append("<td>"+ lastYear[0].month.substring(0,4) +"</td>");
					labelsLastYear = lastYear.map(x=>x.month.substring(5,7));
					console.log(lastYear[0].sales);
					dataLastYear = lastYear.map(y=>y.sales);
				}
				$("tbody>tr").eq(2).append("<td class='title'>"+"YoY"+"</td>");
				$("tbody>tr").css("text-align", "center");
				for (let i=0; i<lastYear.length; i++) {
					// 再插入月業績
					let lastYearSales = lastYear[i].sales.toString();
					lastYearSales = lastYearSales.split(/(?=(?:...)*$)/);
					lastYearSales = lastYearSales.join(",");
					if (thisYear[i] == undefined) {
						$("tbody>tr").eq(0).append("<td>"+"</td>");
						$("tbody>tr").eq(2).append("<td class='yoy'>"+"</td>");
					} else {
						let thisYearSales = thisYear[i].sales.toString();
						thisYearSales = thisYearSales.split(/(?=(?:...)*$)/);
						thisYearSales = thisYearSales.join(",");
						$("tbody>tr").eq(0).append("<td>"+ "$ " + thisYearSales +"</td>");
						let yoy = Math.round(((parseInt(thisYear[i].sales) / parseInt(lastYear[i].sales)) -1 )*10000)/100;
						$("tbody>tr").eq(2).append("<td class='yoy'>"+ yoy + "%" +"</td>");
						if(parseInt(yoy)>=0) {
							$("td[class='yoy']").eq(i).css("color", "blue");
						} else {
							$("td[class='yoy']").eq(i).css("color", "red");
						}
					}
					$("tbody>tr").eq(1).append("<td>"+ "$ " + lastYearSales +"</td>");
				}
				let ctx = document.getElementById("lineChart").getContext("2d");
				let chart = new Chart(ctx, {
	  		        type: "line",
	  		        data: {
	  		            labels: labelsLastYear,
	  		            datasets: [{
	  		                label: new Date().getFullYear(),
	  		                data: dataThisYear,
	  		                lineTension: 0,
	  		                backgroundColor: "#e79822",
	  		                borderColor: "#e79822",
	  		                fill: false,
	  		                borderWidth: 2,
	  		                pointRadius: 5,
	  		                pointHoverRadius: 7
	  		            },
	  		            {
	  		                label: new Date().getFullYear()-1,
	  		                data: dataLastYear,
	  		                lineTension: 0,
	  		                backgroundColor: "#29B171",
	  		                borderColor: "#29B171",
	  		                fill: false,
	  		                borderWidth: 2,
	  		                pointRadius: 5,
	  		                pointHoverRadius: 7
	  		            }
	  		            ],
	  		
	  		        },
	  		        options: {
	  		            title: {
	  		                display: true,
	  		                text: ["Fenci 業績表", (branch==undefined)?"":branch],
	  		                position: "top",
	  		                align: "start",
	  		                fontSize: 36,
	  		                fontStyle: "normal",
	  		                fontFamily: "Century Gothic"
	  		            },
	  		            legend: {
	  		                display: true,
	  		              	labels:{
	  		              		fontSize:24
	  		              		}
	  		            },
	  		          	scales: {
	  		          		xAxes: [{
	  		          			ticks: {
	  		          				fontSize: 16
	  		          			}
	  		          		}],
		  	                yAxes: [{
		  	                    ticks: {
		  	                        // Include a dollar sign in the ticks
		  	                        callback: function(value, index, values) {
		  	                            value = value.toString();
		  	                            value = value.split(/(?=(?:...)*$)/);
		  	                            value = value.join(",");
		  	                            return '$' + value;
		  	                        },
		  	                      	fontSize: 18
		  	                    },
		  	                    // 將y軸的原點標示拿掉
		  	                    afterTickToLabelConversion: function (scaleInstance) {
		  	                       	// set the first and last tick to null so it does not display
		  	                        // note, ticks[0] is the last tick and ticks[length - 1] is the first
		  	                        scaleInstance.ticks[scaleInstance.ticks.length - 1] = null;
		  	                        // need to do the same thing for this similiar array which is used internally
		  	                        scaleInstance.ticksAsNumbers[scaleInstance.ticksAsNumbers.length - 1] = null;
		  	                    }
		  	                }]
		  	            },
			  	        tooltips: {
			  	            enabled: true,
			  	            // 同時顯示x軸上的數據
			  	            // 這裡鼠標移到對應點上會同時顯示2020和2021的業績
			  	            mode: 'index',
			  	          	backgroundColor: 'rgba(0, 0, 0, 0.5)',
			  	          	titleFontSize: 24,
			  	          	bodyFontSize: 20,
			  	            // 通過回調修改tooltips的標題
			  	            callbacks: {
			  	              title: function (item) {
			  	                return item[0].xLabel + "月業績"
			  	              },
				  	          label: function (t, d) {
				  	              const label = d.datasets[t.datasetIndex].label;
				  	              let value = d.datasets[t.datasetIndex].data[t.index];
				  	              value = value.toString();
				  	              value = value.split(/(?=(?:...)*$)/);
				  	              value = value.join(",");
				  	              return label + ' : $' + value;
				  	          }
			  	            }
			  	        },
	  		            responsive: false,
	  		        }
	  		    })
	  		})
  		}
  		$(".dropdown-item").on("click", function() {
			data.branch = $(this).text();
			salesfigure(data);
		});
		salesfigure(data);
  	})
  </script>
</body>
</html>