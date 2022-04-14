<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp"%>
<%@page import="kr.co.lotson.utils.SecurityUtil"%>
<%@page import="kr.co.lotson.model.TbRoleMenu"%>

<!-- 시큐리티 세션에 담긴 값을 가져와서 사용하기 -->
<sec:authentication property="principal.username" var="userId" />
<sec:authentication property="principal.name" var="name" />
<sec:authentication property="principal.authorities" var="role"/>

<!DOCTYPE html>
<html lang="kr">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>LG PAY Partners</title>
	
	<!-- jquery js/css
		================================================== -->
	<script type="text/javaScript" src="js/jquery/jquery-1.12.4.min.js"></script><!-- 20160725 수정 -->
	<script type="text/javaScript" src="js/jquery/jquery-ui-1.10.3.custom.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/jquery/jquery-ui-1.10.3.custom.min.css" />
		
	<!-- Glim common ui js/css 
		================================================== -->
	<script type="text/javascript" src="js/partners.front.ui.js"></script>	
	<link rel="stylesheet" type="text/css" href="css/partners_sub.css" />
	
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
			
		});
		
		$(function() {
			setTimeOffsetBetweenServerAndClient();
		});
		
		function setTimeOffsetBetweenServerAndClient(){
		    var latestTouch = getCookie('latestTouch');
		    latestTouch = latestTouch==null ? null : Math.abs(latestTouch);
		    var clientTime = (new Date()).getTime();
		    var clientTimeOffset = clientTime - latestTouch;
		    setCookie('clientTimeOffset', clientTimeOffset);
		    console.log("확인");
		}
		
		
		function isSessionExpired(offset){
		    var sessionExpiry = Math.abs(Util.getCookie('sessionExpiry'));
		    var timeOffset = Math.abs(Util.getCookie('clientTimeOffset'));
		    var localTime = (new Date()).getTime();
		    setCookie('remainTime', (sessionExpiry - (localTime - timeOffset)));
		    return localTime - timeOffset > (sessionExpiry-(offset||0));
		}

		
		function checkSessionExpired(){
		    var isExpired = isSessionExpired(-5*1000);  //세션만료예정시간을 5초 앞당겨서 검사
		    if(isExpired === true){
		        alert('Session Expired. Please login.');
		        goLogin();
		    }else{
		        setTimeout('checkSessionExpired()', 10*1000);   //10초에 한번씩 티이머 반복
		    }
		}
		
	</script>
</head>
<body>

<div id="wrap" >
	<!-- s:Header -->
	<!-- <div id="header"></div> -->
	<!-- e:Header -->
	
	<!-- s:BODYCONTENT -->
	<div id="body">

		
		<!-- s:LNB MENU -->
		<div id="lnb">
			<div class="con">
				<h1 class="logo">
					<a href="javascript:;">
						<img src="images/partners/logos.png" alt="LG PAY partners" />
					</a>
				</h1>
				<!-- s:로그인후  -->
				<div class="user_info">
					<div class="icon">
						<img src="images/partners/ico_userinfo.png" alt="사용자 아이콘"/>
					</div>
					<!-- S:20160725 수정 -->
					<div class="uinfo_con">
						<span class="row1">
							<a href="javascript:;">
								<span class="user_id"><strong>${userId }</strong></span>
								<span class="user_name"><span>${name }</span> 님</span>
							</a>							
						</span>
						<span class="row2">
							<a href="javascript:;" class="btn_mypage"><span>정보수정</span></a><a href="<c:url value="/logout"/>" class="btn_logout"><span>로그아웃</span></a>
						</span>
						<br>
						<span class="user_id"><p>   권한 ${role }</p></span>
					</div>
					<!-- E:20160725 수정 -->
				</div>
				<!-- e:로그인후  -->
			</div>
			
			<div class="lnb_inner">
				
				<!-- 활성화시 li class="here" -->
				<ul class="l_navi">
					<c:set var="currentGroupMenuCd" value=""/>
					<c:forEach var="groupMenu" items="${roleMenuList}" varStatus="status">
						<c:if test="${currentGroupMenuCd ne groupMenu.tbMenu.menuGroupCd}">
						<c:set var="currentGroupMenuCd" value="${groupMenu.tbMenu.menuGroupCd}"/>
							<c:if test = "${currentGroupMenuCd ne '0000'}">
								<li <%if (SecurityUtil.matchURL(request, ((TbRoleMenu)pageContext.findAttribute("groupMenu")).getTbMenu().getMenuUrl())) { out.println("class=\"dep1_li active\""); }else{out.println("class=\"dep1_li\"");}%>>
									<a href="javascript:;"><span><c:out value="${groupMenu.tbMenu.menuName}"/></span><i class="ico_m_sub">열기</i></a>
									<ul class="dep2_li_ul">
										<c:forEach var="inMenu" items="${roleMenuList}">
											<c:if test="${(currentGroupMenuCd eq inMenu.tbMenu.menuGroupCd) && (currentGroupMenuCd ne inMenu.tbMenu.menuCd)}">
												<li <%if (SecurityUtil.matchURL(request, ((TbRoleMenu)pageContext.findAttribute("inMenu")).getTbMenu().getMenuUrl())) { out.println("class=\"dep2_li active\""); }else{out.println("class=\"dep2_li\"");}%>>
													<a href="<c:url value='${fn:replace(inMenu.tbMenu.menuUrl,"**","")}'/><c:url value='${inMenu.tbMenu.menuDefaultUrl}'/>"><i>ico</i><span><c:out value="${inMenu.tbMenu.menuName}"/></span></a>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</li>
							</c:if>
						</c:if>
					</c:forEach>	
				</ul>
				
			</div>
			<!-- e:lnb_inner -->
			<!-- s: footer -->
			<div id="footer">
				<div class="footer_inner">
					<span class="copy">
						Copyright ⓒ 2016 LG Electronics.<br />All Rignts Reserved.
					</span>
				</div>
			</div>
			<!-- e: footer -->
		</div>
		<!-- e:LNB MENU -->
		
		
		
		
		<!-- s:Content -->
		<div id="content">
		
			<!-- S:Title -->
			<div class="ptitle">
				<h2>제휴사담당자 관리</h2>
				<div class="pnav">
					<a href="#">Home</a>
					<span class="bar">></span>
					<a href="#">시스템관리</a>
					<span class="bar">></span>
					<span class="here">제휴사 담당자 관리</span>
				</div>
			</div>
			<!-- E:Title -->
						
			<!-- S:검색영역 안내문구  -->
			<div class="desc_box">
				<div class="fl">등록된 신용인증서를 조회 합니다.</div>
			</div>
			<!-- E:검색영역 안내문구  -->
			
			<!-- S:검색영역 -->
			<div class="form_box">
				
				<!-- S:Colgroup -->
				<div class="colgroup" style="width:44%">
					<span class="bar">|</span>
					<div class="rowgroup">
						<div class="tbl_inner">
							<table>
								<colgroup>
									<col width="30%"/>
									<col width="70%"/>
								</colgroup>
								<tbody>
								<tr>
									<th><label for="pro1">제휴사</label></th>
									<td>
										<select class="ui_sel" style="width:100%;" id="pro1">
										  <option value="00400001">전체</option>
										</select>
									</td>
								</tr>
								<tr>
									<th><label for="pro2">아이디</label></th>
									<td><input type="text" value="" style="width:100%;" id="pro2" /></td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>					
					<span class="barr">|</span>
				</div>
				<!-- E:Colgroup -->
				
				<!-- S:Colgroup -->
				<div class="colgroup" style="width:44%">
					<span class="bar">|</span>
					<div class="rowgroup">
						<div class="tbl_inner">
							<table>
								<colgroup>
									<col width="30%"/>
									<col width="70%"/>
								</colgroup>
								<tbody>
								<tr>
									<th><label for="pro3">이름</label></th>
									<td><input type="text" value="" style="width:100%;" id="pro3" /></td>
								</tr>
								<tr>
									<th><label for="date1">등록일</label></th>
									<td>
										<span class="calandarGroup">
											<span class="cal1"><input data-type="date" id="date1" name="" class="ui_cal" /></span>
											<span class="tt">~</span>
											<span class="cal2"><input data-type="date" id="date2" name="" class="ui_cal" /></span>
										</span>
									</td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>					
					<span class="barr">|</span>
				</div>
								
				
				<!-- S:BTN -->
				<div class="colgroup btn" style="width:12%">
					<span class="bar">|</span>
					<a href="javascript:;" class="btn_black"><span>검색</span></a>
					<span class="barr">|</span>
				</div>
				<!-- E:BTN -->				
			</div>
			<!-- E:검색영역 -->
			<!-- E:Colgroup -->
			
			<script type="text/javascript">
			$(document).ready(function(){
				//캘린더
				$("input[data-type=date]").datepicker({//YY.MM.DD
					onClose : function(selectedDate) {
						
					}
				});
			});
			</script>
			
			<!-- S:테이블 상단  -->
			<div class="desc_box mgt_25"> 
				<div class="fl"><span class="tresult"><em>38명</em>의 신용인증서가 검색되었습니다.</span></div>
				<div class="fr"><a href="javascript:;" class="btn_white"><span>신규등록</span></a></div>
			</div>			
			<!-- E:테이블 상단  -->
			
			<!-- S:테이블 기본테이블  -->
			<table class="dtbl_col" cellspacing="0" cellpadding="0" summary="">
				<caption></caption>
				<colgroup>
					<col width="10%;" />
					<col width="10%;" />
					<col width="20%;" />
					<col width="13%;" />
					<col width="13%;" />
					<col width="13%;" />
					<col width="10%;" />
					<col width="10%;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">NO</th>
						<th scope="col">ID</th>
						<th scope="col">이름</th>
						<th scope="col">RID</th>
						<th scope="col">만료일</th>
						<th scope="col">등록일</th>
						<th scope="col">등록자</th>
						<th scope="col">상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>55</td>
						<td>홍길동</td>
						<td>admin@google.com</td>
						<td>010-1234-1234</td>
						<td>2017-06-27</td>
						<td>2017-06-27</td>
						<td>홍길동</td>
						<td>상태</td>
					</tr>
					<tr>
						<td>54</td>
						<td>홍길동</td>
						<td>admin@google.com</td>
						<td>010-1234-1234</td>
						<td>2017-06-27</td>
						<td>2017-06-27</td>
						<td>홍길동</td>
						<td>상태</td>
					</tr>
					<tr>
						<td>53</td>
						<td>홍길동</td>
						<td>admin@google.com</td>
						<td>010-1234-1234</td>
						<td>2017-06-27</td>
						<td>2017-06-27</td>
						<td>홍길동</td>
						<td>상태</td>
					</tr>
					<tr>
						<td>52</td>
						<td>홍길동</td>
						<td>admin@google.com</td>
						<td>010-1234-1234</td>
						<td>2017-06-27</td>
						<td>2017-06-27</td>
						<td>홍길동</td>
						<td>상태</td>
					</tr>
					<tr>
						<td>51</td>
						<td>홍길동</td>
						<td>admin@google.com</td>
						<td>010-1234-1234</td>
						<td>2017-06-27</td>
						<td>2017-06-27</td>
						<td>홍길동</td>
						<td>상태</td>
					</tr>
					<tr>
						<td>50</td>
						<td>홍길동</td>
						<td>admin@google.com</td>
						<td>010-1234-1234</td>
						<td>2017-06-27</td>
						<td>2017-06-27</td>
						<td>홍길동</td>
						<td>상태</td>
					</tr>
					<tr>
						<td>49</td>
						<td>홍길동</td>
						<td>admin@google.com</td>
						<td>010-1234-1234</td>
						<td>2017-06-27</td>
						<td>2017-06-27</td>
						<td>홍길동</td>
						<td>상태</td>
					</tr>
					<tr>
						<td>48</td>
						<td>홍길동</td>
						<td>admin@google.com</td>
						<td>010-1234-1234</td>
						<td>2017-06-27</td>
						<td>2017-06-27</td>
						<td>홍길동</td>
						<td>상태</td>
					</tr>
				</tbody>
			</table>
			<!-- E:테이블 기본테이블  -->
			
			<!-- s:page -->
			<!-- 
				** 리스트 20개 노출 후 페이징
				버튼 활성화 안 할 경우 : disabled 클래스 추가 
			-->
			<div class="paging">
				<a href="#" class="ico btn_page_frist disabled"><i>맨앞으로</i></a><a href="#" class="ico btn_page_prve disabled"><i>이전</i></a>
				<span class="page_num">
					<a href="javascript:;" class="here">1</a>
					<a href="javascript:;">2</a>
					<a href="javascript:;">3</a>
					<a href="javascript:;">4</a>
					<a href="javascript:;">5</a>
				</span>
				<a href="#" class="ico btn_page_next"><i>다음</i></a><a href="#" class="ico btn_page_last"><i>맨뒤으로</i></a>
			</div>
			<!-- e:page -->
			<!-- e:admin prject  -->
			<!-- E:TEST CONTENT -->
			
		</div>
		<!-- e:Content -->
		
		
		
	</div>
	<!-- e:BODYCONTENT -->
</div>
<!-- //wrap -->

<!-- S:LAYER POPUP AREA -->

<!-- E:LAYER POPUP AREA -->
</body>
</html>