<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/headerAboveLinks.jsp"%>
<%@ include file="/WEB-INF/views/special/orderCompleteLinks.jsp"%>
<%@ include file="/WEB-INF/views/common/headerBelowLinks.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>






<!-- bodyWrap -->
<div id="bodyWrap">
	<!--title-->
	<h3 class="cnts_title">
		<span>주문완료</span>
	</h3>
	<div class="sub_container">
		<div class="order_title ">
			<p class="title">주문이 완료되었습니다.</p>
			
	<!--주문번호 -->		
			<p class="s_title">주문번호 :${orderProduct[0].orders.id} 
	<!--주문한 시간 -->	
			(주문일시 : <fmt:formatDate value="${orderProduct[0].orderItem.orderByTime}" pattern="yyyy.MM.dd HH:mm"/>)</p>
			
		<!-- fn:substring은 문자열 자르기를 통해 1번 인덱스만 가져온다 // == '1'이면 은행을 말합니다. '0' 이면 카드입니다. 아래 결제수단에서 나옴  -->	
		<!-- c:if를 통해 카드로 결제를 하면 입금예정 시간이 나오지 않고 실시간 계좌이체로 결제를 진행하면 계좌 입금 남은 시간이 나옵니다.-->
		<c:if test="${fn:substring(orderpayment[0].orders.paymentMethodCode,0,1) == '1'}">
			<p class="ss_title">
			
		<!-- 계좌입금 남은 시간(timeP = +4시간) -->
				<span class="guide_comment">입금 가상계좌로 결제 금액을 
				${timeP} 까지 입금하셔야 주문이 완료됩니다.</span> (입금하지 않으시면 주문이 취소됩니다.) 
			</p>
		</c:if>
		</div>

		<div class="tblwrap">
			<table class="tbl_ltype ">
				<caption>쇼핑백</caption>
				<colgroup>
					<col>
					<col style="width: 85px">
					<col style="width: 105px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">상품정보</th>
						<th scope="col">수량</th>
						<th scope="col">판매가</th>
					</tr>
				</thead>
				<tbody>
	<!-- 선택한 상품 정보 -->
			<c:forEach var="ordercomplete" items="${orderProduct}">
					<tr class="al_middle">
						<td class="frt">
				<!-- 선택한 옷 정보 -->
							<div class="pt_list_all">
								<a href="${ordercomplete.productCommon.id}">
				<!--  선택한 옷 이미지 -->
									<img src="${ordercomplete.productColor.img1}" alt="">
								</a>
								<div class="tlt_wrap">
									<a href="${ordercomplete.productCommon.id}"
										class="basket_tlt"> 
										
			<!-- 선택한 브랜드 이름, 상품 이름 -->			
										<span class="tlt">${ordercomplete.brand.name}</span>
										<span class="sb_tlt">${ordercomplete.productCommon.name}</span>
									</a>
									<p class="color_op">
			<!-- 선택한 상품 컬러와 사이즈 -->
										color : ${ordercomplete.productColor.colorCode}<span class="and_line">/</span> size : ${ordercomplete.productStock.sizeCode}
									</p>
								</div>
							</div> 
						</td>
			<!--  선택한 상품의 수량 -->
						<td>${ordercomplete.orderItem.count}</td>
						<td>
			<!-- 선택한 상품의 판매가  -->
							<div class="price_wrap">
								<span> ₩ <fmt:formatNumber type="number" maxFractionDigits="3" value="${ordercomplete.orderItem.totalPrice}"/></span>
							</div> 
						</td>
					</tr>
				 </c:forEach>
				</tbody>
			</table>
		</div>

	
		<div class="total_wrap order">
			 <div class="total_price_wrap">
				<dl>
					<dt >상품 합계</dt>
					<dd > 
		<!--선택한 상품 합계 가격-->	
					<span> ₩ <fmt:formatNumber type="number" maxFractionDigits="3" value="${bfdcprice}"/></dd></span>
					<dt >한섬 마일리지</dt>
					<dd > 
		<!-- 사용한 마일리지  -->
					<span> -₩ <fmt:formatNumber type="number" maxFractionDigits="3" value="${mileage}"/></span></dd>
				</dl>

		
				<dl class="total">
					<dt >합계</dt>
					<dd >
	  <!--  선택한 상품의 가격과 주문자가 사용한 마일리지의 합계 -->
					<span> ₩ <fmt:formatNumber type="number" maxFractionDigits="3" value="${afdcprice}"/></span></dd>
				</dl>
			</div>
		</div> 
	


		<div class="title_wrap clearfix">
			<h4 class="float_left">결제수단</h4>
		</div>
		<div class="tblwrap mb40">
			<table class="tbl_wtype1">
				<caption>결제수단</caption>
				<colgroup>
					<col style="width: 140px">
					<col>
				</colgroup>
		<!-- 결제수단은 c:if를 사용하여 결제수단이 카드냐, 은행이냐를 나타냅니다. -->
		<!--  카드로 결제를 하면 "결제수단" 쪽에 입금예정 시간이 나오지 않습니다. -->
		<!-- fn:substring은 문자열 자르기를 통해 0번 인덱스만 가져온다 // '0'이면 카드를 보여주고 '1'이면 은행을 보여줍니다  -->
				<c:if test="${fn:substring(orderpayment[0].orders.paymentMethodCode,0,1) == '0'}">
					<tbody>
						<tr>
							<th scope="row" class="th_space">카드</th>
							<td>
						<!-- 카드 회사정보  -->
							${orderpayment[0].paymentMethod.company}카드
						<!--  카드 번호 -->
							${orderpayment[0].orders.paymentInfo}
							</td>
						</tr>
					</tbody>
				</c:if>
		<!-- fn:substring은 문자열 자르기를 통해 1번 인덱스만 가져온다 // '0'이면 카드를 보여주고 '1'이면 은행을 보여줍니다  -->
		<!-- '1'이면 은행 입니다. 가상계좌로 결제를 하면 "결제수단" 쪽에 입금예정 시간이 나옵니다.  -->
				<c:if test="${fn:substring(orderpayment[0].orders.paymentMethodCode,0,1) == '1'}">
					<tbody>
						<tr>
							<th scope="row" class="th_space">가상계좌</th>
							<td>
						<!-- 은행 회사정보 -->
							${orderpayment[0].paymentMethod.company}은행
						<!--  은행 계좌번호 -->
							${orderpayment[0].orders.paymentInfo}
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_space">입금 예정기한</th>
		<!-- '1'이면 은행 입니다. 계좌로 결제를 하면 "결제수단" 쪽에 입금예정 시간이 나옵니다.  -->
							<td>${timeP}까지 입금</td>
						</tr>
					</tbody>
				</c:if>
			</table>
		</div>
		
		<!-- 주문자 정보-->
		<div class="title_wrap clearfix">
			<h4 class="float_left">주문자 정보</h4>
		</div>
		<div class="tblwrap mb40">
			<table class="tbl_wtype1">
				<caption>결제수단</caption>
				<colgroup>
					<col style="width: 140px">
					<col>
				</colgroup>
				<tbody>
					<tr>
			<!-- 주문자 이름 -->
						<th scope="row" class="th_space">주문자</th>
						<td>${member.name}</td>
					</tr>
					<tr>
			<!-- 주문자 휴대폰 번호 -->
						<c:set var="TextValue" value="${member.phone}" />
						<th scope="row" class="th_space">휴대폰</th>
						<td>
		<!-- 주문자 휴대폰 번호를 fn:substring 문자열 자르기를 통해 "010-1234-5678" 이렇게 구현되도록 수정하였습니다 -->
							${fn:substring(TextValue,0,3) } - <!-- 010 부분 -->
							${fn:substring(TextValue,3,7) } - <!-- 1234 부분 -->
							${fn:substring(TextValue,7,11) }<!-- 5678 부분 -->
						</td>
					</tr>
					<tr>
			<!--  주문자 이메일 -->
						<th scope="row" class="th_space">E-MAIL</th>
						<td>${member.email}</td>
					</tr>
				</tbody>
			</table>
		</div>


		<!--배송지 정보-->
		<div class="title_wrap clearfix">
			<h4 class="float_left">배송지 정보</h4>
		</div>
		<div class="tblwrap">
			<table class="tbl_wtype1 ">
				<caption>배송지 정보</caption>
				<colgroup>
					<col style="width: 140px">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" class="th_space">배송지 주소</th>
				<!-- 배송지 주소의 우편 번호 -->
						<td>${orderaddress[0].orders.zipcode}
				<!-- 배송지 주소의 주소-->
							${orderaddress[0].orders.address}
						</td>
					</tr>
					<tr>
				<!-- 배송지 정보의 수령인 -->
						<th scope="row" class="th_space">수령인</th>
						<td>${orderaddress[0].orders.receiver}</td>
					</tr>
					<tr>
				<!-- 배송지 정보의 휴대폰 -->
						<c:set var="TextValue" value="${orderaddress[0].orders.phone}" />
						<th scope="row" class="th_space">휴대폰</th>
						<td>
			<!-- 배송지 휴대폰 번호를 fn:substring 문자열 자르기를 통해 "010 1234 5678" 이렇게 구현되도록 수정하였습니다-->
							${fn:substring(TextValue,0,3) } - <!-- 010 부분 -->
							${fn:substring(TextValue,3,7) } - <!-- 1234 부분 -->
							${fn:substring(TextValue,7,11) }<!-- 5678 부분 -->	
						</td>
					</tr>
					<tr>
				<!--  배송지 정보의 연락처 -->
						<c:set var="TextValue" value="${orderaddress[0].orders.tel}" />
						<th scope="row" class="th_space">연락처</th>
						<td>
			<!-- 배송지 연락처 번호를 fn:substring 문자열 자르기를 통해 "042 456 5678" 이렇게 구현되도록 수정하였습니다-->
							${fn:substring(TextValue,0,3) }  <!-- 042 부분 -->
							${fn:substring(TextValue,3,6) }  <!-- 456 부분 -->
							${fn:substring(TextValue,7,11) } <!-- 5678 부분 -->
						</td>
					</tr>
					<tr>
				<!-- 배송지 정보의 배송 요청사항 -->
						<th scope="row" class="th_space">베송 요청사항</th>
						<td>${orderaddress[0].orders.memo}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!--주문내역조회, 쇼핑계속하기 버튼-->
		<div class="btnwrap order ">
		<!-- 주문내역조회 -->
			<a href="${pageContext.request.contextPath}/member/orderlist" onclick="myordersPage();"><input value="주문내역조회" class="btn wt" type="button"></a> 
		<!-- 쇼핑계속하기 버튼-->
			<a href="${pageContext.request.contextPath}/" onclick="continuePage();"><input value="쇼핑계속하기" class="btn gray mr0" type="button"></a>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>