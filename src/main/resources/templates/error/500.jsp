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
<title> 서비스 이용에 불편을 드려서 죄송합니다! | THE HANDSOME.COM </title>
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
		<div class="errorwrap" id="ko">
			<div class="top_error">
			<div class="top_error">
                <button class="btn btn-outline-danger" onclick="china()">中文</button>
               	<button class="btn btn-outline-danger" onclick="eng()">ENGLISH</button>
                <button class="btn btn-outline-danger" onclick="kor()">한국어</button>
            </div>                </div>
            <div class="con_error">
	            <p>서비스 이용에 불편을 드려서 죄송합니다!</p>
	            <span>방문하시려는 페이지의 주소가 잘못 입력되었거나,<br>페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.<br><br>입력한 주소가 정확한지 다시 한번 확인해주시길 바랍니다.</span>
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
	            <span>The webpage cannot be found.<br>This error is caused because the website address is typed incorrectly,<br>has been deleted, or changed.<br><br>Make sure the address is correct and try again.</span>
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
	            <p>非常抱！</p>
	            <span>入的址无法。<br>此不存在或址已更。<br><br>再次地址。</span>
            </div>
            <div class="btnwrap">
                <a href="/" class="btn wt_ss">thehandsome.com</a>
            </div>
		</div>
		<script>
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