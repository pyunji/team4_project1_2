<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>SpringFramework</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-4.6.0-dist/css/bootstrap.min.css"/>
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js"></script>
	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/brand.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font_80.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart/print.css"/>
	</head>
	<body>
	
		<%-- headerWrap 시작 --%>
		<div id="headerWrap">
			<div class="header header_fixed header_main1903"> 
				<div class="top_nav topnav1903">
					<div class="top_nav_wrap clearfix">
			            <div class="brand_menu brand_menu1903">
				            <ul class="clearfix">
				                <!-- 선호 브랜드 없음 -->
				                        <li>
					                        <span class="on">
					                        	<a href="">HOME</a>
					                        </span>
				                        </li>
				                        <!-- 로그인 상태 -->
												<!-- 비로그인 상태 -->
				              <p class="brand_menu_guide_text">패션의 완성 THE HANDSOME</p>
							</ul>
			       		</div>
			    		<div class="gnb_sh_wrap" style="display:none;">
							<div class="gnb_sh_box">
								<input type="text" class="input" id="gnbsearchwords" title="검색어 입력" value="" onkeypress="if(event.keyCode==13) {EnterSearchHeader(); return false;}">
								<a href="" id="gnbsearch">검색</a>
							</div>
						</div>				
		                <div class="util_menu" style="display:block;">
							<ul class="clearfix">
								<li>
									<a href="">로그인</a>
								</li>
								<li>
									<a href="">마이페이지</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
		
				<div class="gnbwarp com clearfix">
			        <h1 class="logo logo1903">
			            <a href="/ko/main" onclick="GA_Event('공통', '로고', '상단');">thehandsome.com</a>
			        </h1>
			        <div class="gnb_nav gnb_nav1903 hscene1906 hscene1910">
			            <h2 class="invisible">주메뉴</h2>
			            <ul class="cate_m cate_banner gnbul1" id="cate_m_main">
				            <li><a href="" class="gnb_brand" onclick="GA_Event('공통','GNB','브랜드');">브랜드<span class="arr">arrow</span></a>
				            </li>            
				            <li><a href="" class="">여성<span class="arr">arrow</span></a>            
				            </li>
				            <li><a href="" class="">남성<span class="arr">arrow</span></a>            
				            </li>
				            <li><a href="" class="">키즈<span class="arr">arrow</span></a>            
				            </li>
				            <li><a href="" class="">뷰티<span class="arr">arrow</span></a>            
				            </li>
				            <li><a href="" class="">라이프스타일<span class="arr">arrow</span></a>            
				            </li>
			            </ul>
			        
				        <ul class="cate_m cate_banner gnbul2" id="cate_m_main" style="float:right;">
				            <li><a href="" class="">기획전<!-- 기획전 --></a></li>
				            <li><a href="" class="">이벤트</a></li>
				            <li><a href="" class="magazine1803">THE 매거진<!-- 매거진 --><span class="arr">arrow</span></a></li>
				            <li><a href="" class="">편집샵</a></li>
				            <li><a href="" class="">룩북</a></li>
				            <li><a href="" class="">아울렛</a></li>
				        </ul>
			        </div>
				    <div class="util_menu util_menu1803">
				        <ul class="clearfix">
				            <li><a href=""><span class="ico_sh">search</span></a></li>
				            <li><a href=""><span class="ico wishlist">wish list</span> <span class="count">(<span id="wishlistCount">0</span>)</span></a></li>
				            <li><a href=""><span class="ico cart">장바구니</span> <span class="count">(<span id="cartCount">0</span>)</span></a></li>
				        </ul>
				    </div>
				</div>  
		    </div>
		</div>
		<%-- headerWrap 끝 --%>
	
		