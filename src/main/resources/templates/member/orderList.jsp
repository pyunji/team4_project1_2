<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/special/orderListLinks.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body oncontextmenu="return false">
	<div id="bodyWrap">
	
		<%-- 상단 중앙 페이지 제목--%>
		<h3 class="cnts_title">
			<span id="menuTitle">주문/취소/배송</span>
		</h3>
		
		<div class="sub_container">
			<%-- 마이페이지 왼쪽 네비게이션바 시작--%>
			<div class="lnb_wrap">
				<h4>
					<a href="/">마이페이지<!-- 마이페이지 --></a>
				</h4>
				<div class="lnb">
					<dl>
		<%-- 마이페이지 분류1--%>
						<dt>주문조회</dt>
						<dd>
			<!--  오른쪽 네이비게이션 바 경로표시 -->
							<a href="${pageContext.request.contextPath}/member/orderlist">주문/취소</a>
						</dd>
					</dl>
				</div>
			</div>
			<%-- 마이페이지 왼쪽 네비게이션바 끝--%>
			
			
			<div class="sub_cnts">				
				<div class="title_wrap mt50">
					<h4>
						상품 주문 목록
				<!-- 상품 주문목록 -->
					</h4>
				</div>
				
				<!-- table -->
				<div class="tblwrap lncl1812">
					<table id= "forRowspan" class="tbl_ltype review_betterment1905">
						<caption>상품 주문 목록</caption>
						<colgroup class="interval1812">
							<col style="width: 120px">
							<col>
							<col style="width: 43px">
							<col style="width: 112px">
							<col style="width: 89px">
							<col style="width: 111px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">주문번호<!-- 주문번호 --></th>
								<th scope="col">상품정보<!-- 상품정보 --></th>
								<th scope="col" style="padding: 15px 0">수량<!-- 수량 --></th>
								<th scope="col">판매가<!-- 판매가 --></th>
								<th scope="col">주문상태<!-- 주문상태 --></th>
								<th scope="col">배송상태<!-- 배송상태 --></th>
								<th scope="col">구분<!-- 구분 --></th>
							</tr>
						</thead>
						<tbody id="listBody">
			<!--  상품 주문 목록 리스트 c:forEach 시작 -->
						<c:forEach var="orderx" items="${orderProduct}">
							<tr class="al_middle">
								<td class="ono">
									<p class="num">
							<!-- 주문번호와 // 상픔 정보의 대한 경로  -->
									<a href="/order/ordercomplete?p=${orderx.orders.id}" style="text-decoration: underline;">${orderx.orders.id}</a></p>
							<!-- 주문한 날짜 bytime = 주문한 날짜 입니다. -->	
									<script>console.log("${bytime}")</script>
									<span class="sum_date"><fmt:formatDate value="${orderx.orderItem.orderByTime}" pattern="yyyy.MM.dd"/></span>
								</td>
								<td>
									<div class="pt_list_all">
										<a href="/product/set/${orderx.productColor.id}">
									<!-- 상품 이미지 -->
										<img src="${orderx.productColor.img1}"
											alt="상품 이미지"></a>
										<div class="tlt_wrap">
											<a href="/product/set/${orderx.productColor.id}" class="basket_tlt">
									<%-- 상품의 브랜드명 자리--%>
												<span class="tlt">${orderx.brand.name}</span> 
									<%-- 상품 정보의 이름--%>
												<span class="sb_tlt">${orderx.productCommon.name}</span>
											</a>
									<%-- 색상명, 사이즈 자리--%>
											<p class="color_op">
												color : ${orderx.productColor.colorCode} <span class="and_line">/</span> size : ${orderx.productStock.sizeCode}
											</p>
										</div>
									</div>
								</td>
						<%-- 수량 자리--%>
								<td>${orderx.orderItem.count}</td>
						<%-- 가격 자리--%>
								<td><span> ₩ <fmt:formatNumber type="number" maxFractionDigits="3" value="${orderx.orderItem.totalPrice}"/></span></td>
						<%-- 주문상태 --%>
								<td class="oStatus">${orderx.orders.status}<span class="sum_date">
					<!--  주문 상태의 날짜 // 취소를 하면 취소한 날짜로 변함 -->
								<fmt:formatDate value="${orderx.orderItem.orderDeleteTime}" pattern="yyyy.MM.dd"/></span></td>
						<!--배송 싱테 --> 
								<td class="oDelivery">${orderx.orders.deliveryStatus}</td>
								<td class="oCancelBtn">
								<div class="btn_wrap">
								
				<!-- 만약 status가 취소완료가 아니면 보이고 취소완료 이면 보이지 않습니다. (구분에 있는 주문취소버튼)-->
					<!--  주문취소를 클릭하면 수량, 판매가, 주문상태, 배송상태가 변한다.
							수량은0, 판매가0, 주문상태는 취소완료, 배송상태는 배송 취소로  -->
									<c:if test="${orderx.orders.status != '취소완료'}">
										<form method="post" action="/order/cancel" name="hidden_field">
											<input type="hidden" name="hidden_ordersId" value="${orderx.orders.id}" />
									<!-- closest을 통해 실행 // closest은 가장 가까운 form을 찾아서 실행하는 것 -->
											<a onclick="cancelOrder(this)" class="" style="border:1px solid; border-radius:10%; font-size:15px; padding=20px; background-color: gray; color:#ffffff;">주문취소</a>
										</form>	
									</c:if>
									</div>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- //table -->
					 
				<!-- Guide Table -->
				<div class="gd_wrap">
					<div class="delivery_step">
						<p class="title">
							주문/배송프로세스
							<!-- 주문 / 배송 프로세스 -->
						</p>
						<ol>
							<li>
								<p class="step">
									<span>STEP 1</span> 1. 입금대기중
									<!-- 입금 대기중 -->
								</p>
								<p class="txt">
									가상계좌를 선택 하셨다면 결제를 완료해 주세요.
									<!-- 가상계좌를 선택 하셨다면<br>결제를 완료해 주세요. -->
								</p>
							</li>
							<li>
								<p class="step">
									<span>STEP 2</span> 2. 주문완료
									<!-- 주문완료 -->
								</p>
								<p class="txt">
									주문정보를 확인하고 있습니다.
									<!-- 주문정보를 확인 하고<br>있습니다. -->
								</p>
							</li>
							<li>
								<p class="step">
									<span>STEP 3</span> 3. 배송준비중
									<!-- 배송 준비중 -->
								</p>
								<p class="txt">
									상품의 배송을 준비하고 있습니다.
									<!-- 상품의 배송을 준비하고<br>있습니다. -->
								</p>
							</li>
							<li>
								<p class="step">
									<span>STEP 4</span> 4. 배송중
									<!-- 배송중 -->
								</p>
								<p class="txt">
									물품이 발송되어 고객님께 배송 중 입니다.
									<!-- 물품이 발송되어 고객님께<br>배송 중 입니다. -->
								</p>
							</li>
							<li>
								<p class="step">
									<span>STEP 5</span> 5. 배송완료
									<!-- 배송완료 -->
								</p>
								<p class="txt">
									배송이 완료 되었습니다.
									<!-- 배송이 완료 되었습니다.-->
								</p>
							</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	function cancelOrder(thing){
		// closest= 가장 가까운 form을 찾아 처리함
		$(thing).closest("form").submit();
	}
	
	
	
	/* [Author: KHY]
		jquery로 class=ono인 것들을 모두 가져왔다. 
		each.로 같은 text를 담고 있는 것을 가져오고 길이가 1초과인경우, 즉 text가 같은경우
		첫번째 것의(eq:(0)) rowspan을 length길이로 설정하고 나머지는 모두  td element를 지운다.
	*/
	$(function(){
		$(".ono").each(function(){
			var ordersIdRow = $(".ono:contains('"+$(this).text()+"')");
			if(ordersIdRow.length >1){
				ordersIdRow.eq(0).attr("rowspan", ordersIdRow.length);
				ordersIdRow.siblings(".oStatus").eq(0).attr("rowspan", ordersIdRow.length);
				ordersIdRow.siblings(".oDelivery").eq(0).attr("rowspan", ordersIdRow.length);
				ordersIdRow.siblings(".oCancelBtn").eq(0).attr("rowspan", ordersIdRow.length);

				
				console.log(ordersIdRow.siblings(".oStatus").not(":eq(0)"));
				console.log(ordersIdRow.siblings(".oDelivery").not(":eq(0)"));
				console.log(ordersIdRow.siblings(".oCancelBtn").not(":eq(0)"));
				console.log(ordersIdRow.not(":eq(0)"));
				
				ordersIdRow.siblings(".oDelivery").not(":eq(0)").remove();
				ordersIdRow.siblings(".oStatus").not(":eq(0)").remove();
				ordersIdRow.siblings(".oCancelBtn").not(":eq(0)").remove();
				ordersIdRow.not(":eq(0)").remove();
			}
		});
	});
	
	
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>