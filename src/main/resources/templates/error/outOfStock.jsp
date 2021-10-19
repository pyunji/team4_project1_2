<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/headerAboveLinks.jsp"%>
<%@ include file="/WEB-INF/views/common/links.jsp"%>
<%@ include file="/WEB-INF/views/special/headerErrorBelowLinks.jsp"%>

<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="No-Cache">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=1, target-densitydpi=medium-dpi">
<title>상품 매진</title>
<!-- ie8 미디어쿼리 사용하기위해 스크립트보다 상위에 위치해야 함 -->
<link rel="stylesheet" type="text/css" href="/WEB-INF/views/common/css/common.css" media="all">
<link rel="stylesheet" type="text/css" href="/WEB-INF/views/common/css/layout.css" media="all">
<link rel="stylesheet" type="text/css" href="/WEB-INF/views/common/css/contents.css" media="all">
<link rel="stylesheet" type="text/css" href="/WEB-INF/views/common/css/popup.css" media="all">
<script type="text/javascript" src="/_ui/desktop/common/js/jquery-1.11.2.js"></script>

</head>

<body>
<div id="bodyWrap">
	<div class="sub_container error_container">
		<%-- outhor : 채연 한국어 에러페이지 --%>
		<div class="errorwrap" id="ko" style="display:block;">
			<div class="top_error">
                <button class="btn btn-outline-danger" onclick="china()">中文</button>
               	<button class="btn btn-outline-danger" onclick="eng()">ENGLISH</button>
                <button class="btn btn-outline-danger" onclick="kor()">한국어</button>
            </div>
            <div class="con_error">
	            <p>주문하신 상품중 재고가 부족한 상품이 있습니다 !</p>
	            <span>구매하시려는 상품의 수량이 올바르지 않습니다.<br>재고보다 많은 수량을 구매하여 생기는 오류입니다.<br><br>재고보다 적은 수의 상품을 구매해주시기 바랍니다. 감사합니다.</span>
            </div>
            <div class="btnwrap">
                <a href="/" class="btn wt_ss">더한섬닷컴 메인으로</a>
            </div>
        </div>
        <%-- 영어 에러페이지 --%>
        <div class="errorwrap" id="en" style="display:none;">
        	<div class="top_error">
                <button class="btn btn-outline-danger" onclick="china()">中文</button>
               	<button class="btn btn-outline-danger" onclick="eng()">ENGLISH</button>
                <button class="btn btn-outline-danger" onclick="kor()">한국어</button>
            </div>
            <div class="con_error">
	            <p>We are sorry for any inconvenience caused by the recent service.</p>
	            <span>The quantity of the product is not correct.<br>This error is caused because more order than the stock.<br><br>Make sure the quantity is correct and try again.</span>
            </div>
            <div class="btnwrap">
                <a href="/" class="btn wt_ss">Go to thehandsome.com</a>
            </div>
		</div>            
		
		<%-- 중국어 에러페이지 --%>
		<div class="errorwrap" id="zh" style="display:none;">   
			<div class="top_error">
                <button class="btn btn-outline-danger" onclick="china()">中文</button>
               	<button class="btn btn-outline-danger" onclick="eng()">ENGLISH</button>
                <button class="btn btn-outline-danger" onclick="kor()">한국어</button>
            </div>            	
            <div class="con_error">
	            <p>这次服务给您添麻烦了，非常抱歉。</p>
	            <span>产品数量不正确<br>这个错误是因为订单多于库存。<br><br>请确认数量正确后再试一次。</span>
            </div>
            <div class="btnwrap">
                <a href="/" class="btn wt_ss">返回thehandsome.com首</a>
            </div>
		</div>
		
		
		<script>
			//outhor : 채연
			//중국어 에러페이지 버튼 클릭시
			function china(){
				$("#zh").css("display", "block");
				$("#en").css("display", "none");
				$("#ko").css("display", "none");
			}
			
			//영어 에러페이지 버튼 클릭시
			function eng(){
				$("#zh").css("display", "none");
				$("#en").css("display", "block");
				$("#ko").css("display", "none");
			}
			
			//한국어 에러페이지 버튼 클릭시
			function kor(){
				$("#zh").css("display", "none");
				$("#en").css("display", "none");
				$("#ko").css("display", "block");
			}
		</script>
	</div>
</div>

</body></html>