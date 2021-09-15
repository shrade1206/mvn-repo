<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>火鍋界Fendi</title>
	<link rel="shortcut icon" href="picture/hotpoticon.jpg">
	<!-- Font Awesome icons (free version)-->
	<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
		crossorigin="anonymous"></script>
	<!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
		rel="stylesheet" type="text/css" />
	<link
		href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
		rel="stylesheet" type="text/css" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link rel="stylesheet" href="css/styles.css" />
	<style type="text/css">
		#logo{
		width:200px;
		}
	
		
		
	</style>
</head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top"><img id="logo" alt="" src="${pageContext.servletContext.contextPath}/picture/logo1.png"></a>
                <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
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
        <!-- Masthead-->
        <header class="masthead bg-primary">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image-->
                <img class="masthead-avatar " src="picture/hotpot.jpg" alt="..." style="width:100vw;"/>
            </div>
        </header>
        
        <section class="page-section portfolio" id="portfolio">
            <div class="container">
                
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">熱門推薦</h2>

               <br><br>
                <div class="row justify-content-center">
                    <!-- Portfolio Item 1-->
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"></div>
                            </div>
                            <img class="img-fluid" src="${pageContext.servletContext.contextPath }/picture/4Z4A3011.jpg" alt="..." />
                        </div>
                    </div>
                 
                    <!-- Portfolio Item 4-->
                    <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal4">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"></div>
                            </div>
                            <img class="img-fluid" src="${pageContext.servletContext.contextPath }/picture/4Z4A2967.jpg" alt="..." />
                        </div>
                    </div>
                    <!-- Portfolio Item 5-->
                    <div class="col-md-6 col-lg-4 mb-5 mb-md-0">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal5">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"></div>
                            </div>
                            <img class="img-fluid" src="${pageContext.servletContext.contextPath }/picture/4Z4A2986.jpg" alt="..." />
                        </div>
                    </div>
                       <!-- Portfolio Item 2-->
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal2">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-black font-weight-bold" ></div>
                            </div>
                            <img class="img-fluid" src="picture/Gianttiger.jpg" alt="..." />
                        </div>
                    </div>
                    <!-- Portfolio Item 3-->
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal3">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-black font-weight-bold" ></div>
                            </div>
                            <img class="img-fluid" src="picture/newzealandlamb.jpg" alt="..." />
                        </div>
                    </div>
                    <!-- Portfolio Item 6-->
                    <div class="col-md-6 col-lg-4">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal6">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-black font-weight-bold"></div>
                            </div>
                            <img class="img-fluid" src="picture/vegetarian.jpg" alt="..." />
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- About Section-->
        <section class="page-section bg-primary text-white mb-0" id="about">
            <div class="container">
                <!-- About Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-white">美味據點</h2>
             <br><br>
                <!-- About Section Content-->
                <div class="row">
                    
                    <div class="col-lg-4 ms-right"><img src="${pageContext.servletContext.contextPath}/picture/4Z4A3075.jpg"><class class="lead"></class></div>
                    <div class="col-lg-4 ms-auto" ><class class="lead"></class>
                     <span style="font-size:23px;line-height:50px;">
                    <br><br>
                     彰化旗艦店<br><br>
                     總店專線&emsp;04-2291-4444 <br>
                      總店地址&emsp;500彰化縣彰化市辭修路206號<br>
                     營業時間&emsp;星期一至星期日 <br>
                        <span style="font-size:20px">
                        &emsp;&emsp;&emsp;&emsp;&emsp; 
                        【11:30-14:00 17:30-22:30】</span></span>
                    <div class="text-center mt-4"></div>
                    <a class="btn btn-xl btn-outline-light" href="${pageContext.request.contextPath}/location">
                    更多據點
                    </a>
                </div></div>
                </div>
                <!-- About Section Button-->
        </section>
     
        <section class="page-section" id="contact">
            <div class="container">
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">關於我們</h2>
                <br><br>
                <div class="row justify-content-center"> 
                 <img src="picture/關於我們.jpg" style="width:80%"alt="">
                    <div class="col-lg-8 col-xl-7">
                    <br><span style="line-height:40px;">
                        創辦人林楷傑先生最感念的家鄉，因著年少在工作疲憊之餘那一碗熱湯所帶來的感動，這份感動起了將溫暖
                        傳遞給更多人的意念， 一步一腳印地努力讓溫暖的種子在北台灣慢慢慢拓展開來。除了提供品質嚴選的海鮮，更創造獨有的石頭火鍋湯底，為此創辦人特
                        地前往名店取經，經過不斷試煉，創造出精、粹、醇、厚，喝了讓人回味的湯底，美味的石頭湯底成了鎖住客人回籠的獨門配方，
                        新鮮的食材，最高的性價比滿足顧客需求。</span>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
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
        <!-- Copyright Section-->
        <div class="copyright py-4 text-center text-white">
            <div class="container"><small>Copyright &copy; Your Website 2021</small></div>
        </div>
        <!-- Portfolio Modals-->
        <!-- Portfolio Modal 1-->
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" aria-labelledby="portfolioModal1" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">日本A5和牛</h2>
                                  <br>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="${pageContext.servletContext.contextPath }/picture/4Z4A3011.jpg" alt="..." />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-4">
                                        擁有日本產的和牛才會有的「Wagyu」標記
                                          桃紅色肉質色澤為最佳，搭配雪白色的脂肪色澤為極品。<br>
                                          肉質鬆軟，咬一口入口即化。
                                          濃郁獨特的香味，是擄獲老饕們味蕾的神級逸品。
                                    </p>
                                  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio Modal 2-->
        <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" aria-labelledby="portfolioModal2" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">巨無霸草蝦鍋</h2>
                                   
                                 <br>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="picture/Gianttiger.jpg" alt="..." />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-4">巨無霸草蝦又稱黑虎蝦，肉多緊實彈牙、微甜，含較高的蝦青素，有“蝦中之王”的美譽<br>
                                        另附：蛤蜊、鮮蚵，鯛魚、牛肉、豬肉、羊肉【擇一】</p>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio Modal 3-->
        <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" aria-labelledby="portfolioModal3" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">紐西蘭嫩羊肩鍋</h2>
                                   <br>
                                 
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="picture/newzealandlamb.jpg" alt="..." />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-4">肩背部位
                                        嚴選鮮嫩彈牙、無腥臊味的頂級嫩羊肩，來自純淨無污染的紐西蘭草原，   <br>
                                        以天然放牧方式養成，每塊羊肩排的油脂分佈均勻，肉質香甜！</p>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio Modal 4-->
        <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" aria-labelledby="portfolioModal4" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">海陸總匯套餐</h2>
                                  <br>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="${pageContext.servletContext.contextPath }/picture/4Z4A2967.jpg" alt="..." />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-4">包含：梅花豬肉片、高級魚丸、魚包蛋、美味蟹肉棒、新鮮高麗菜
                                            <br>註:鍋底三選一  麻辣,鴛鴦,酸菜白肉鍋

                                                 </p>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio Modal 5-->
        <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" aria-labelledby="portfolioModal5" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">松坂豬肉套餐</h2>
                                    <br>
                                 
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="${pageContext.servletContext.contextPath }/picture/4Z4A2986.jpg" alt="..." />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-4">
                                        如大理石紋般的油花，裡頭蘊藏橡樹果實的芳香，<br>
                                        口感媲美頂級谷飼和牛，肉質達到生食級標準，七分熟口感最佳！</p>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio Modal 6-->
        <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" aria-labelledby="portfolioModal6" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">素食鍋</h2>
                                    <br>

                                  
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mb-5" src="picture/vegetarian.jpg" alt="..." />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-4">提供給素食者的美味選擇 
                                     </p>
                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
