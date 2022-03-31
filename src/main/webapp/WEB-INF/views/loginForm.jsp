<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>로그인 페이지</title>

<!-- jquery js/css
		================================================== -->
	<script type="text/javaScript" src="js/jquery/jquery-1.12.4.min.js"></script><!-- 20160726 수정 -->
	<script type="text/javaScript" src="js/jquery/jquery-ui-1.10.3.custom.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/jquery/jquery-ui-1.10.3.custom.min.css" />
	
	<!-- Glim common ui js/css 
		================================================== -->
	<script type="text/javascript" src="js/cams.front.ui.js"></script>	
	<link rel="stylesheet" type="text/css" href="css/cams_sub.css" />
	
	<!-- popup common
		================================================== -->
	<script type="text/javaScript" src="js/common.popup.js"></script>

	<script type="text/javascript">
		<!-- 테스트 함수  -->
		<!-- GNB 메뉴 활성화 페이지 내에  -->
		var _mnbSelectId=[];//비활성화
		var _mnbSelectId=[1,0];//활성화 - 0부터 시작 
		<!-- //테스트 함수  -->
		$(document).ready(function(){
			$("#goLogin").click(function(){
				$("#loginForm").submit();
			})
		});
		
		if ("<c:out value='${param.error}'/>" != null
				&& "<c:out value='${param.error}'/>" != "") {
			var msg = "";
			var error = "<c:out value='${param.error}'/>";
			console.log("error 정보" + error);
			var failcount = "<c:out value='${param.count}'/>";
			var count = 5 - failcount;
			switch (error) {
			case "0001":
				msg = "아이디 또는 비밀번호를 잘못 입력하셨습니다. \n 남은 비밀번호 입력횟수는 " + count
							+ "회 입니다.";
				break;
			case "0011":
				msg = "입력하신 아이디는 존재하지 않습니다.";
				break;
			case "0003":
				msg = "만료된 계정입니다.\n관리자에게 문의하시기 바랍니다.";
				break;
			case "0004":
				msg = "5회이상 로그인에 실패하였습니다.\n관리자에게 문의하시기 바랍니다."
				break;
			case "0005":
				msg = "5회이상 로그인에 실패하여 관리자에 의해 잠금된 계정입니다.\n관리자에게 문의하시기 바랍니다.";
				break;
			case "0006":
				msg = "이미 로그인한 관리자입니다.\n다른 관리자로 로그인 해주세요";
				break;
			case "0009":
				msg = "시스템 오류가 발생 했습니다.\n관리자에게 문의하시기 바랍니다.";
				break;
			}
			alert(msg);

		}
		
	</script>
</head>

<body>
	<!-- login wrap -->
	<div id="loginWrap">
		<!-- S:content -->
		<div class="login_group">
			<div class="login_box">
				<h1 class="login_logo"><img src="images/cams/login_logo.png" alt="" /></h1>
				<div class="lg_body">
					<form action="/loginProcess" method="post" id="loginForm">
					<div class="input_form">
						<label class="input_box ip_id">
							<input type="text" name="username" placeholder="아이디를 입력하세요" />
						</label>
						<label class="input_box ip_pw">
							<input type="password" name="password" placeholder="비밀번호를 입력하세요" />
						</label>
					</div>
					
					<div class="save_id">
						<input type="checkbox" name="saveId" id="saveId" /><label for="saveId">아이디 저장</label>
					</div>
					
					</form>
					<div class="btn_group">
						<a class="btn_login" id="goLogin">로그인</a>
					</div>
					 <input name="${_csrf.parameterName}" type="hidden" value="${_crsf.token}">
				</div>
				<div class="lg_footer">
					<span class="copyright">Copyright ⓒ 2016 LG Electronics.<br />All Rignts Reserved.</span>
				</div>
			</div>
		</div>
		<!-- E:content -->
		<!-- footer -->
	</div>
	<!-- //login wrap -->
	
	
</body>
</html>
