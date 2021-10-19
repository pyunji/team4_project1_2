<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/headerAboveLinks.jsp"%>
<%@ include file="/WEB-INF/views/special/homeLinks.jsp"%>
<%@ include file="/WEB-INF/views/common/headerBelowLinks.jsp"%>
<div id=bodyWrap>
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:set var="check" value="" />
				<%-- 여기부터 반복시작--%>
				<c:forEach var="product" items="${products}" varStatus="status">
					<c:if test="${check != product.productColor.id}">
						<c:set var="mycount" value="${status.count}" />
						<!-- 클릭시 이동할 url 넣는부분-->
						<%-- 					<div class="col mb-5" OnClick="location.href='${pageContext.request.contextPath}/event/detail'"> --%>
						<div class="col mb-5" style="cursor: pointer;" onclick="location.href='/product/${product.category.depth1Name}/${product.category.depth2Name}/${product.category.depth3Name}/${product.productColor.id}'">
							<input type="hidden" name="depth1Value" value="${product.category.depth1Name}"></input>
							<input type="hidden" name="depth2Value" value="${product.category.depth2Name}"></input>
							<input type="hidden" name="depth3Value" value="${product.category.depth3Name}"></input>
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
										<div class="fw-bolder mb-1 price">
											₩
											<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.productColor.price}" />
										</div>
										</p>

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

	<%-- 페이징 처리 부분--%>
	<div class="row-vw d-flex">
		<div class="mx-auto">
			<c:set var="urlcontainer" value="${pageContext.request.contextPath}/product/${str}" />

			<a class="paginigBtn" href="${urlcontainer}?pageNo=1">처음</a>
			<c:if test="${pager.groupNo>1}">
				<a class="paginigBtn" href="${urlcontainer}?pageNo=${pager.startPageNo-1}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				<c:if test="${pager.pageNo !=i}">
					<a class="paginigBtn" href="${urlcontainer}?pageNo=${i}">${i}</a>
				</c:if>
				<c:if test="${pager.pageNo ==i}">
					<a class="paginigBtn check" style="border: 1px solid; padding: 5px; border-radius: 20%; background-color: #295F39; color: #ffffff; font-weight: bold;" href="${urlcontainer}?pageNo=${i}">${i}</a>
				</c:if>
			</c:forEach>

			<c:if test="${pager.groupNo<pager.totalGroupNo}">
				<a class="paginigBtn" href="${urlcontainer}?pageNo=${pager.endPageNo+1}">다음</a>
			</c:if>
			<a class="paginigBtn" href="${urlcontainer}?pageNo=${pager.totalPageNo}">맨끝</a>
		</div>
	</div>

	<script>
	 	function insertImgChip(){
			for(let i=1; i<= ${mycount}; i++){
				var temp = "#productComId"+i;
				var pcommonId = $(temp).val();
				var id_color = "#productColorChip" + i;
				$.ajax({
					url : "/product/selectColors",
					async: false,
					method : "post",
					data : {"pcommonId":pcommonId},
					success : function(result) {
						$(id_color).html(result);
					}
				})
			}
	    }
	
	 	/*author : 채연*/
		/* 카테고리 활성화 */
		$(window).ready(function(){
			let currDepth=${currDepth};
			//카테고리1 활성화 시각화
			let depth1 = $('input[name=depth1Value]').val();
			let depth1Id="#"+depth1;
			let CategoryNameId = "#"+depth1+"Category";
			$(depth1Id).css("color", "gray");
			
			//카테고리2 활성화 시각화
			if(currDepth >= 2){
				let depth2 = $('input[name=depth2Value]').val();
				//depth2중 '공백'과 '.'을 제거한다.
				depth2 = depth2.replace(" ", "");
				depth2 = depth2.replace(".", "");
				let depth2Id = CategoryNameId + " #"+depth2;
				$(depth2Id).css("color", "gray");
			}
			
			insertImgChip();
		})
		
	</script>

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
