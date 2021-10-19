<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/headerAboveLinks.jsp"%>
<%@ include file="/WEB-INF/views/special/homeLinks.jsp"%>
<%@ include file="/WEB-INF/views/common/headerBelowLinks.jsp"%>

<body oncontextmenu="return false">
	<div id="bodyWrap" style="padding-bottom:0;">
		<div class="main_banner" style="background-image: URL(http://www.thehandsome.com/medias/A-outerevent-04-PC.gif?context=bWFzdGVyfGltYWdlc3w0MzY5MDd8aW1hZ2UvZ2lmfGltYWdlcy9oNmEvaDU0LzkyMzgyMDA2ODA0NzguZ2lmfGM3MWM0MGNlNDBmYTNkNzE2MWIzZmQyYTFmYzJmNjcyNzJkZDI0ZmY3MjBmZmU4NjViZjU0YTEyNGNkM2ZjZTY); background-repeat: no-repeat; background-position: center center; 	margin:0 auto;
	width:60%;
	height:60vh;">
			<span class="main_event_title" style=" position: absolute;
  top: 47%;
  left: 45%;
  transform: translate(-50%,-50%);
  font-size:30px;
  width:38%;
  color:white;">9월 마지막주 선착순 30% 할인쿠폰 이벤트</span>
			<span class="main_event_content" style="  position: absolute;
  top: 52%;
  left: 52%;
  transform: translate(-50%,-50%);
  font-size:25px;
  width:38%;
  color:yellow;
  font-family:'Georgia, "맑은 고딕", serif';">전품목 / 9월 30일 10:00</span>
			<div class="main_banner_button" OnClick="location.href='${pageContext.request.contextPath}/event/detail'" style="  position: absolute;
  top: 60%;
  left: 50%;
  transform: translate(-50%,-50%);
  background-color:black;
  width:150px;
  height:40px;
  text-align:center;">
				<span style="color:white;   position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
  font-size:17px;
  cursor: pointer;" class="main_banner_couponbutton">쿠폰 받기</span>
			</div>
		</div>


		<div class="main_container">
            <div class="product_list1903">
                <div class="nbe_cnt new">
                    <div class="nbe_cnt_inner_wrap">
	                    <div class="nbe_cnt_inner swiper-container swiper-container-horizontal swiper-container-wp8-horizontal" id="newListSlider">	
		                    <ul class="items_list swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">

								<c:forEach var="product" items="${boards}">
									<li class="swiper-slide">
										<div class="item_box" style="box-sizing: initial;">
											<a href="${pageContext.request.contextPath}/test/detail?productColorId=${product.productColor.id}" class="item_info1">
												<span class="item_img">
													<img src="${product.productColor.img1}" width="234" height="353" alt="" name="펄 돌먼 점퍼" class="respon_image">
												</span>
											</a>
											<a href="${pageContext.request.contextPath}/test/detail?productColorId=${product.productColor.id}" class="item_info2">
												<span class="brand">${product.brand.name}</span>
												<span class="name">${product.productCommon.name}</span>
												<span class="price">${product.productColor.price}</span>
											</a>
										</div>
									</li>
								</c:forEach>

								<li class="swiper-slide swiper-slide-active">			
		                    		<div class="item_box" style="box-sizing:initial;">				
		                    			<a href="${pageContext.request.contextPath}/product/detail" class="item_info1">	
		       								<span class="item_img">	
												<img src="${pageContext.request.contextPath}/resources/images/womanouter/CS2B9QJC005WCJ_BK_T01.jpg" width="234" height="353" alt="" name="펄 돌먼 점퍼" class="respon_image">					
											</span>				
										</a>				
										<a href="${pageContext.request.contextPath}/product/detail" class="item_info2">
											<span class="brand">O'2nd</span>
											<span class="name">오버사이즈 더블 재킷</span>
											<span class="price">₩598,000</span>
										</a>	
									</div>
								</li>
								
								<li class="swiper-slide swiper-slide-next">	
									<div class="item_box">	
										<a href="${pageContext.request.contextPath}/product/detail" class="item_info1">
											<span class="item_img">
												<img src="${pageContext.request.contextPath}/resources/images/womanouter/CS2B9QJC006WCJ_GE_T01.jpg" width="234" height="353" alt="" name="패널 번아웃 블라우스" class="respon_image">
											</span>
										</a>
										<a href="${pageContext.request.contextPath}/product/detail" class="item_info2">
											<span class="brand">LÄTT</span>
											<span class="name">부클레 멜란지 재킷</span>
											<span class="price">₩375,000</span>
										</a>
									</div>
								</li>
								
								<li class="swiper-slide">
									<div class="item_box">				
										<a href="${pageContext.request.contextPath}/product/detail" class="item_info1">
											<span class="item_img">						
												<img src="${pageContext.request.contextPath}/resources/images/womanouter/CS2B9WJC003WLV_CM_T01.jpg" width="234" height="353" alt="" name="홀가먼트 캐시미어 니트 드레스" class="respon_image">					
											</span>				
										</a>				
									<a href="${pageContext.request.contextPath}/product/detail" class="item_info2">					
										<span class="brand">the CASHMERE</span>
										<span class="name">멜란지 더블 재킷</span>				
										<span class="price">₩675,000</span>				
									</a>			
								</div>		
								</li>		
								
								<li class="swiper-slide">			
									<div class="item_box">				
										<a href="${pageContext.request.contextPath}/product/detail" class="item_info1">					
											<span class="item_img">						
												<img src="${pageContext.request.contextPath}/resources/images/womanouter/IL2B9WJC412W_DG_T01.jpg" width="234" height="353" alt="" name="돌먼 슬리브 재킷" class="respon_image">					
											</span>				
										</a>				
										<a href="${pageContext.request.contextPath}/product/detail" class="item_info2">					
											<span class="brand">SYSTEM</span>
											<span class="name">캐시미어 블레드 크롭 재킷</span>					
											<span class="price">₩559,000</span>				
										</a>			
									</div>		
								</li>		
								
		                   	</ul>
	                   	</div>
                   	</div>
                </div>
                
                <div class="nbe_cnt new">
                    <div class="nbe_cnt_inner_wrap">
	                    <div class="nbe_cnt_inner swiper-container swiper-container-horizontal swiper-container-wp8-horizontal" id="newListSlider">	
		                    <ul class="items_list swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">	
		                    
		                    	<li class="swiper-slide swiper-slide-active">			
		                    		<div class="item_box">				
		                    			<a href="${pageContext.request.contextPath}/product/detail" class="item_info1">	
		       								<span class="item_img">	
												<img src="${pageContext.request.contextPath}/resources/images/womanouter/LC2B9FJC951W_DN_T01.jpg" width="234" height="353" alt="" name="펄 돌먼 점퍼" class="respon_image">					
											</span>				
										</a>				
										<a href="${pageContext.request.contextPath}/product/detail" class="item_info2">
											<span class="brand">O'2nd</span>
											<span class="name">디테쳐블 칼라 재킷</span>
											<span class="price">₩598,000</span>
										</a>	
									</div>
								</li>
								
								<li class="swiper-slide swiper-slide-next">	
									<div class="item_box">	
										<a href="${pageContext.request.contextPath}/product/detail" class="item_info1">
											<span class="item_img">
												<img src="${pageContext.request.contextPath}/resources/images/womanouter/LC2B9WJC443W_GY_T01.jpg" width="234" height="353" alt="" name="패널 번아웃 블라우스" class="respon_image">
											</span>
										</a>
										<a href="${pageContext.request.contextPath}/product/detail" class="item_info2">
											<span class="brand">LÄTT</span>
											<span class="name">스티치 포켓 재킷</span>
											<span class="price">₩375,000</span>
										</a>
									</div>
								</li>
								
								<li class="swiper-slide">
									<div class="item_box">				
										<a href="${pageContext.request.contextPath}/product/detail" class="item_info1">
											<span class="item_img">						
												<img src="${pageContext.request.contextPath}/resources/images/womanouter/MN2B8WOT724WM_IN_T01.jpg" width="234" height="353" alt="" name="홀가먼트 캐시미어 니트 드레스" class="respon_image">					
											</span>				
										</a>				
									<a href="${pageContext.request.contextPath}/product/detail" class="item_info2">				
										<span class="brand">the CASHMERE</span>
										<span class="name">칼라리스 더블 재킷</span>				
										<span class="price">₩675,000</span>				
									</a>			
								</div>		
								</li>		
								
								<li class="swiper-slide">			
									<div class="item_box">				
										<a href="${pageContext.request.contextPath}/product/detail" class="item_info1"">					
											<span class="item_img">						
												<img src="${pageContext.request.contextPath}/resources/images/womanouter/SJ2B9RJC264W_LE_T01.jpg" width="234" height="353" alt="" name="돌먼 슬리브 재킷" class="respon_image">					
											</span>				
										</a>				
										<a href="${pageContext.request.contextPath}/product/detail" class="item_info2">				
											<span class="brand">SYSTEM</span>
											<span class="name">체크 크롭 재킷</span>				
											<span class="price">₩559,000</span>				
										</a>			
									</div>		
								</li>		
								
		                   	</ul>
	                   	</div>
                   	</div>
                </div>
            </div>
        </div>
    </div>
</body>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
