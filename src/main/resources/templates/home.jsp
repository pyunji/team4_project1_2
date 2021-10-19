<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/headerAboveLinks.jsp"%>
<%@ include file="/WEB-INF/views/special/homeLinks.jsp"%>
<%@ include file="/WEB-INF/views/common/headerBelowLinks.jsp"%>
<div id=bodyWrap>
	<!-- 
header에 들어가는 부분
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  </style> -->



	<body>
		<div class="container mt-3">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ul class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ul>

				<!-- The slideshow -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<a href="${pageContext.request.contextPath}/event/detail/1">
							<img src="${pageContext.request.contextPath}/resources/images/mainbanner/eventimg1.jpg" width="100%" height="550vh" />
						</a>
					</div>
					<div class="carousel-item">
						<a href="${pageContext.request.contextPath}/event/detail/2">
							<img src="${pageContext.request.contextPath}/resources/images/mainbanner/eventimg2.JPG" width="100%" height="550vh"/>
						</a>
					</div>
					<div class="carousel-item">
						<a href="">
							<img src="${pageContext.request.contextPath}/resources/images/mainbanner/happy4jo.jpg" width="100%" height="550vh" />
						</a>
					</div>
				</div>
								<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a>
				<a class="carousel-control-next" href="#myCarousel" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
				
			</div>
		</div>
				<section class="py-5">
				<h3 style="text-align: center;font-weight: 600;">현재 품절 임박인 인기 상품들을 만나보세요.</h3>
					<div class="container px-4 px-lg-5 mt-5">
						<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
							<c:set var="check" value="" />
							
							<%-- 여기부터 반복시작--%>
							<c:forEach var="product" items="${products}" varStatus="status">
								<c:if test="${check != product.productColor.id}">
									<c:set var="mycount" value="${status.count}" />
									<!-- 클릭시 이동할 url 넣는부분-->
									<%-- 					<div class="col mb-5" OnClick="location.href='${pageContext.request.contextPath}/event/detail'"> --%>
									<div class="col mb-5" style="cursor: pointer;" onclick="location.href='/product/set/${product.productColor.id}'">
										<%-- <input type="hidden" name="depth1Value" value="${product.category.depth1Name}"></input>
										<input type="hidden" name="depth2Value" value="${product.category.depth2Name}"></input>
										<input type="hidden" name="depth3Value" value="${product.category.depth3Name}"></input> --%>
										<div class="card h-100 border-0">
											<!-- Product image-->
											<img class="card-img-top" src="${product.productColor.img1}" alt="..." />
											<!-- Product details-->
											<div class="card-body p-4">
												<div class="text-center">
													<!-- 브랜드 명-->
													<p>
													<div class="fw-bolder mb-1 brand_name">${product.brand.name}</div>
													</p>
													<!-- 상품명-->
													<p>
													<div class="fw-bolder mb-1 name">${product.productCommon.name}</div>
													</p>
													<!-- 가격-->
													<p>
													<div class="fw-bolder mb-1 price">₩ 
													<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.productColor.price}" />
													</div>
													</p>
													<p class="stock_info">현재 수량: ${product.productStock.stock}개</p>
													<p>
														<input id="productComId${mycount}" type="hidden" value="${product.productColor.productCommonId}">
													<div id="productColorChip${mycount}" class="fw-bolder mb-1"></div>
													</p>
												</div>
											</div>
										</div>
									</div>
									<c:set var="check" value="${product.productColor.id}" />
								</c:if>
							</c:forEach>
							<%-- 여기까지 반복끝--%>
						</div>
					</div>
				</section>



	</body>

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
