<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div id="bodyWrap" class="login_form">
	<h3 class="cnts_title">
		<span id="menuTitle">로그인</span>
	</h3>
	<div class="sub_container">
		<div class="login_wrap">
				<div class="login_section">
					<div class="card-body">
						<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
							<div class="alert alert-danger mb-2" role="alert">
								<c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'Bad credentials'}">
									아이디 또는 비밀번호가 틀립니다.
								</c:if>
							  	<c:if test="${fn:contains(SPRING_SECURITY_LAST_EXCEPTION.message, 'principal exceeded')}">
									인증 횟수가 초과되었습니다.
								</c:if>
							</div>
						</c:if>
						<form method="post" action="${pageContext.request.contextPath}/login" class="login_wrap">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<div class="form-group">
							    <label for="mid" class="id">아이디</label>
							    <input type="text" class="form-control" id="mid" name="id">
							</div>
							<div class="form-group">
								<label for="mpassword" class="password">패스워드</label>
								<input type="password" class="form-control" id="mpassword" name="password">
							</div>
							<button class="loginbtn">로그인</button>
						</form>	
					</div>
				</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>