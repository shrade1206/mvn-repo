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
<link rel="stylesheet" href="<%=path %>/css/location.css" />
<script src="<%=path %>/js/jquery-3.4.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>


<style>
	

.header{
    background:url('${pageContext.servletContext.contextPath}/picture/location.jpg');
    max-width:100%;
    height: 500px;
    background-repeat: no-repeat;
    background-size:cover;
    background-position: center;
  
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
    <h3>美味據點</h3>

    <ul id="tab">
        <li id="tab0">所有分店</li>
        <li id="tab1">台中</li>
        <li id="tab2">彰化</li>
        <li id="tab3">嘉義</li>

    </ul>
    <div class="branch">
     
        <ul class="place">
             
            <li class="place01">
                <div><img class="Img" src="${pageContext.servletContext.contextPath }/picture/tapei.jpg"
					alt=""></div>
                <p><span>台中北屯店</span><br>
                    位置&emsp;406台中市北屯區北屯路230-5號 <br>
                    時間&emsp;週一至日 11:30-14:00 17:30-22:30<br>
                     專線&emsp;04-2291-1111
                 </p>
             
        
            </li>
           <li class="place01">
                <div><img class="Img" src="${pageContext.servletContext.contextPath }/picture/taichung02.jpg"
					alt=""></div>
                <p><span>台中龍井店</span><br>
                    位置&emsp;434台中市龍井區中央路一段193號
 <br>
                    時間&emsp;週一至日 11:30-14:00 17:30-22:30<br>
                     專線&emsp;04-2291-2222



                 </p>
        
            </li>



            <li class="place02">
                <div><img class="Img" src="${pageContext.servletContext.contextPath }/picture/taichung.jpg"
					alt=""></div>
                <p><span>彰化員林店</span><br>
                    位置&emsp;510彰化縣員林市中山路一段777號<br>
                    時間&emsp;週一至日11:30-14:00 17:30-22:30
                                       <br>
                     專線&emsp;04-2291-3333


                 </p>
        
            </li>

          


            <li class="place02">
                <div><img class="Img" src="${pageContext.servletContext.contextPath }/picture/taichung03.jpg"
					alt=""></div>
                <p><span>彰化旗艦店</span><br>
                    位置&emsp;500彰化縣彰化市辭修路206號<br>
                    時間&emsp;週一至日 11:30-14:00 17:30-22:30<br>
                     專線&emsp;04-2291-4444



                 </p>
        
            </li>


            <li class="place03">
                <div><img class="Img" src="${pageContext.servletContext.contextPath }/picture/kaohsiung.jpg"
					alt=""></div>
                <p><span>嘉義西區店</span><br>
                    位置&emsp;600嘉義市西區錦州二街28號<br>
                    時間&emsp;週一至日 11:30-14:00 17:30-22:30<br>
                     專線&emsp;04-2291-8833



                 </p>
        
            </li>

        </ul>


    </div>
    
   <!-- Footer-->
    <footer class="footer text-center" style="background-color: black;">
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
                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><i
                            class="fab fa-fw fa-facebook-f"></i></a>
                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-twitter"></i></a>
                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><i
                            class="fab fa-fw fa-linkedin-in"></i></a>
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
 <div class="copyright py-4 text-center text-white" style="background-color:black">
            <div class="container"><small>Copyright &copy; Your Website 2021</small></div>
        </div>
    <script>

        $(document).ready(function () {
        	 $("#tab0").addClass("current");
            $("#tab0").on("click", function () { 
                $('.place01').show();
                $(this).addClass("current").siblings().removeClass("current");
                $('.place02').show();
                $('.place03').show();
            })

            $("#tab1").on("click", function () {
                $('.place01').show();
                $(this).addClass("current").siblings().removeClass("current");
                $('.place02').hide();
                $('.place03').hide();
               

            })
            $("#tab2").on("click", function () {
                $('.place02').show();
                $(this).addClass("current").siblings().removeClass("current");
                $('.place03').hide();
                $('.place01').hide();
               
            })
            $("#tab3").on("click", function () {
                $('.place03').show();
                $(this).addClass("current").siblings().removeClass("current");
                $('.place01').hide();
                $('.place02').hide();
               
            })
        });
    </script>










 



</body>
</html>