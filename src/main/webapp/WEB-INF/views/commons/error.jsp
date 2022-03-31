<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<script type="text/javascript" src="js/cams.front.ui.js"></script>
<link rel="stylesheet" type="text/css" href="css/cams_sub.css" />
<head>
<title>에러페이지</title>
<script type="text/javascript">
	function back() {
		history.back();
	}
	function loginPage(){
		location.href = "<c:url value='/login'/>";
	}
</script>
</head>
<body>
	<!-- wrap -->
	<div id="wrap">
		<!-- S:content -->
		<div id="content">
			<!-- S:error content -->
			<div class="error_group">
				<div class="error_inner">
					<div class="error_body">
						<em>Error Message</em>
						<span>${msg}</span>
						<c:if test="${code eq '401'}">
						<span>5초 뒤 로그인 페이지로 이동합니다.</span>
						</c:if>
					</div>
					<div class="btn_group">
						<c:choose>
							<c:when test="${code eq '401'}">
								<script>
									setTimeout(function(){
										loginPage();
									}, 5000);
								</script>
								<a href="javascript:loginPage();" class="btn_pos">로그인페이지</a>
							</c:when>
							<c:otherwise>
								<a href="javascript:back();" class="btn_pos">돌아가기</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<!-- E:error content -->
		</div>
	</div>
	<!-- //wrap -->	
</body>
</html>

