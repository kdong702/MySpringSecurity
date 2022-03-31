<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp"%>

<!-- 시큐리티 세션에 담긴 값을 가져와서 사용하기 -->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LG PAY CAMS</title>

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
			
		});
		
	</script>
</head>

<body>
	<!-- wrap -->
	<div id="wrap">
		<!-- header -->
		<div id="header">
			<div class="con_header">
				<div class="con_inner">
					<h1 class="logo"><a href="javascript:;"><img src="images/cams/logo.png" alt="LG PAY CAMS Logo" /></a></h1>
					<div class="h_account">
						<sec:authorize access = "isAuthenticated()">
						<sec:authentication property="principal.username" var="userId" />
						<sec:authentication property="principal.name" var="name" />
							<div class="private_info">
								<span class="ico"><img src="images/cams/ico_private.png" alt="" /></span>
								<span class="user_name"><a href="javascript:;"><span><strong>${userId } </strong>${name } </span></a></span>
							</div>
							<div class="btn_account_group">
								<a href="javasciprt:;" class="btn_acc">정보수정</a><a href="<c:url value="/logout"/>" class="btn_acc">로그아웃</a>
							</div>
						</sec:authorize>
						<sec:authorize access = "isAnonymous()">
							<div class="private_info">
							<span class="ico"><img src="images/cams/ico_private.png" alt="" /></span>
							<span class="user_name"><a href="javascript:;"><span><strong>비로그인 </strong> </span></a></span>
						</div>
						<div class="btn_account_group">
							<a href="<c:url value ="/Login"/>" class="btn_acc">로그인</a>
						</div>
						</sec:authorize>
						
					</div>
				</div>
			</div>
			<div id="gnb">
				<div class="con_inner">
					<ul class="g_navi">
						<li class="dep1_li dep_item_1">
							<a href="javasciprt:;"><span>프로파일관리</span></a>
							<ul class="dep2_li_ul">
								<li><a href="javasciprt:;">카드(SE)프로파일</a></li>
								<li><a href="javasciprt:;">애플리케이션 프로파일</a></li>
								<li><a href="javasciprt:;">키 프로파일</a></li>
								<li><a href="javasciprt:;">로드파일 프로파일</a></li>
								<li><a href="javasciprt:;">TAP 프로파일</a></li>
							</ul>
						</li>
						<li class="dep1_li dep_item_2">
							<a href="javasciprt:;"><span>발급데이터관리</span></a>
							<ul class="dep2_li_ul">
								<li><a href="javasciprt:;">카드(SE) 상품관리</a></li>
								<li><a href="javasciprt:;">발급 상품 관리</a></li>
								<li><a href="javasciprt:;">키 프로파일</a></li>
								<li><a href="javasciprt:;">신용 인증서 관리</a></li>
								<li><a href="javasciprt:;">카드(SE) 코드관리</a></li>
							</ul>
						</li>
						<li class="dep1_li dep_item_3">
							<a href="javasciprt:;"><span>eSE라이프 사이클관리</span></a>
							<ul class="dep2_li_ul">
								<li><a href="javasciprt:;">카드(SE)라이프 사이클 조회</a></li>
								<li><a href="javasciprt:;">키 파일 배치 상태조회</a></li>
								<li><a href="javasciprt:;">카드(SE)Key 상태 조회</a></li>
							</ul>
						</li>
						<li class="dep1_li dep_item_4">
							<a href="javasciprt:;"><span>통계관리</span></a>
							<ul class="dep2_li_ul">
								<li><a href="javasciprt:;">eSE 제조사 별 통계</a></li>
								<li><a href="javasciprt:;">키 상태 별 통계</a></li>
								<li><a href="javasciprt:;">애플리케이션별 라이프 사이클 통계</a></li>
								<li><a href="javasciprt:;">파트너별 발급통계</a></li>
							</ul>
						</li>
						<li class="dep1_li dep_item_5">
							<a href="javasciprt:;"><span>통계관리</span></a>
							<ul class="dep2_li_ul">
								<li><a href="javasciprt:;">코드관리</a></li>
								<li><a href="javasciprt:;">관리자관리</a></li>
								<li><a href="javasciprt:;">역할관리</a></li>
								<li><a href="javasciprt:;">메뉴관리</a></li>
								<li><a href="javasciprt:;">파트너사 관리</a></li>
								<li><a href="javasciprt:;">로그인 접속현황</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- //header -->
		<!-- S:content -->
		<div id="content">
			<!-- S:con_inner -->
			<div class="con_inner">
				<!-- S:Title -->
				<div class="ptitle">
					<h2>세션 상세조회</h2>
					<div class="pnav">
						<a href="#">Home</a>
						<span class="bar">></span>
						<a href="#">프로파일관리</a>
						<span class="bar">></span>
						<a href="#">카드 프로파일</a>
						<span class="bar">></span>
						<span class="here">카드 프로파일 상세조회</span>
					</div>
				</div>
				<!-- E:Title -->
				
				<div class="desc_box">
					<div class="fl">Test Card Profile의 eSE 프로파일 상세정보입니다.</div>
				</div>
				
				<!-- S:tab -->
				<div class="tab_type1 mgt_25">
					<div class="line"></div>
					<ul>
						<li class="fir here"><a href="javasciprt:;">상세정보</a></li>
						<li><a href="javasciprt:;">XML Tree</a></li>
						<li><a href="javasciprt:;">애플릿</a></li>
					</ul>
				</div>
				<!-- E:tab -->
				
				<h3 class="h3_tit">세션정보</h3>
				<table class="dtbl_row">
					<caption>세션 정보에 대한 카드 모델, 제조사, EEPROM(가용), RAM(가용) 설명</caption>
					<colgroup>
						<col width="120px" />
						<col width="auto" />
						<col width="120px" />
						<col width="auto" />
						<col width="120px" />
					</colgroup>
					<tbody>
						<tr>
							<th class="no_line" scope="row">sessionId</th>
							<td>session 유효기간</td>
							<th scope="row">세션 생성 일시</th>
							<td>세션과 연결된 사용자가 최근에 서버에 접근한 시간</td>
							<th>새로 생성된 세션 여부</td>
						</tr>
						<tr>
							<th class="no_line" scope="row"><c:out value="${sessionId}" /></th>
							<td><c:out value="${maxInactiveInterval}" /></td>
							<th scope="row"><c:out value="${creationTime}" /></th>
							<td><c:out value="${lastAccessTime}" /></td>
							<th><c:out value="${isNew}" /></td>
						</tr>
					</tbody>
				</table>
				
				
				<!-- S:tab -->
				<div class="tab_type1 mgt_25">
					<div class="line"></div>
					<ul>
						<li class="fir here"><a href="javasciprt:;">카드 서비스 처리 이력</a></li>
						<li><a href="javasciprt:;">카드 애플릿 목록</a></li>
						<li><a href="javasciprt:;">카드 애플릿 라이프사이클 이력</a></li>
					</ul>
				</div>
				<!-- E:tab -->
				
				
				<!-- S:descript -->
				<div class="desc_box"> 
					<div class="fr">
						<div class="ic_regend">
							<span class="ico ic_proceeding"><i>진행중</i><em>진행중</em></span>
							<span class="ico ic_cancel"><i>취소</i><em>취소</em></span>
							<span class="ico ic_fail"><i>실패</i><em>실패</em></span>
							<span class="ico ic_success"><i>성공</i><em>성공</em></span>
						</div>
					</div>
				</div>
				<!-- E:양쪽 descript -->
				
				<table class="dtbl_col">
					<caption></caption>
					<colgroup>
						<col width="auto" />
						<col width="auto" />
						<col width="auto" />
						<col width="auto" />
						<col width="auto" />
						<col width="auto" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">처리일</th>
							<th scope="col">서비스 명</th>
							<th scope="col">액션 명</th>
							<th scope="col">진행 상태</th>
							<th scope="col">요청 제휴사</th>
							<th scope="col">APDU</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2016-05-07 11:42:29</td>
							<td>GP211SDSERVICE</td>
							<td>211 install putkey</td>
							<td>
								<span class="ico ic_success"><i>성공</i></span>
								<span class="ico ic_success"><i>성공</i></span>
							</td>
							<td>simulated RTVSM1</td>
							<td><a href="javasciprt:;" class="ico ic_view"><i>보기</i>보기</a></td>
						</tr>
						<tr>
							<td>2016-05-07 11:42:29</td>
							<td>GP211SDSERVICE</td>
							<td>211 install putkey</td>
							<td>
								<span class="ico ic_fail"><i>실패</i></span>
								<span class="ico ic_fail"><i>실패</i></span>
							</td>
							<td>simulated RTVSM1</td>
							<td><a href="javasciprt:;" class="ico ic_view"><i>보기</i>보기</a></td>
						</tr>
						<tr>
							<td>2016-05-07 11:42:29</td>
							<td>GP211SDSERVICE</td>
							<td>211 install putkey</td>
							<td>
								<span class="ico ic_proceeding"><i>진행중</i></span>
								<span class="ico ic_proceeding"><i>진행중</i></span>
							</td>
							<td>simulated RTVSM1</td>
							<td><a href="javasciprt:;" class="ico ic_view"><i>보기</i>보기</a></td>
						</tr>
						<tr>
							<td>2016-05-07 11:42:29</td>
							<td>GP211SDSERVICE</td>
							<td>211 install putkey</td>
							<td>
								<span class="ico ic_cancel"><i>취소</i></span>
								<span class="ico ic_cancel"><i>취소</i></span>
							</td>
							<td>simulated RTVSM1</td>
							<td><a href="javasciprt:;" class="ico ic_view"><i>보기</i>보기</a></td>
						</tr>
					</tbody>
				</table>
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
				
				
				<h3 class="h3_tit">액션정보</h3>
				<div class="form_box">				
					<!-- S:Colgroup -->
					<div class="colgroup" style="width:50%">
						<span class="bar">|</span>
						<div class="rowgroup">
							<div class="tbl_inner">
								<table>
									<colgroup>
										<col width="40%" />
										<col width="60%" />
									</colgroup>
									<tbody>
									<tr>
										<th><label for="pro1">액션 카테고리</label></th>
										<td class="input">
											<select class="ui_sel" style="width:100%;" id="pro1">
												<option>Enabling</option>
											</select>
										</td>
									</tr>
									<tr>
										<th><label for="pro2">노출</label></th>
										<td class="input">
											<select class="ui_sel" style="width:100%;" id="pro2">
												<option>Background</option>
											</select>
										</td>
									</tr>
									<tr>
										<th><label for="date31">유효시작일</label></th>
										<td class="input">
											<span class="cal1"><input data-type="date" id="date31" style="width:100%;" name="" class="ui_cal" /></span>
										</td>
									</tr>
									</tbody>
								</table>
							</div>
						</div>					
						<span class="barr">|</span>
					</div>
					<!-- E:Colgroup -->
					
					<!-- S:Colgroup -->
					<div class="colgroup" style="width:50%">
						<span class="bar">|</span>
						<div class="rowgroup">
							<div class="tbl_inner">
								<table>
									<colgroup>
										<col width="40%">
										<col width="60%">
									</colgroup>
									<tbody>
									<tr>
										<th><label for="pro21">액션명</label></th>
										<td class="input"><input type="text" value="" style="width:100%;" id="pro21"></td>
									</tr>
									<tr>
										<th><label for="pro22">액션설명</label></th>
										<td class="input"><input type="text" value="" style="width:100%;" id="pro22"></td>
									</tr>
									<tr>
										<th><label for="date32">유효만기일</label></th>
										<td class="input">
											<span class="cal1"><input data-type="date" id="date32" style="width:100%;" name="" class="ui_cal" /></span>
										</td>
									</tr>
									</tbody>
								</table>
							</div>
						</div>					
						<span class="barr">|</span>
					</div>
					<!-- E:Colgroup -->
				</div>
				
				<!-- S:양쪽 descript -->
				<div class="desc_box mgt_25"> 
					<div class="fl"><h3 class="h3_tit">등록 애플릿 프로파일 목록</h3></div>
					<div class="fr"><span class="t_total">+ 합계 파일 크기 : <em>3</em> KB</span></div>
				</div>
				<!-- E:양쪽 descript -->
				
				<table class="dtbl_col">
					<caption></caption>
					<colgroup>
						<col width="8%" />
						<col width="auto" />
						<col width="auto" />
						<col width="auto" />
						<col width="auto" />
						<col width="auto" />
						<col width="auto" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">No.</th>
							<th scope="col">애플릿명(ID)</th>
							<th scope="col">라이프사이클 패턴</th>
							<th scope="col">시작스크립트 함수명</th>
							<th scope="col">타입</th>
							<th scope="col">삭제</th>
							<th scope="col">순서변경</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>12</td>
							<td>GP211SDSERVICE</td>
							<td>No Title</td>
							<td>No Title</td>
							<td><em class="t_bold">APP</em></td>
							<td><a href="javascript:;">삭제</a></td>
							<td>미정</td>
						</tr>
						<tr>
							<td>11</td>
							<td>GP211SDSERVICE</td>
							<td>No Title</td>
							<td>No Title</td>
							<td><em class="t_bold">APP</em></td>
							<td><a href="javascript:;">삭제</a></td>
							<td>미정</td>
						</tr>
						<tr>
							<td>10</td>
							<td>GP211SDSERVICE</td>
							<td>No Title</td>
							<td>No Title</td>
							<td><em class="t_bold">APP</em></td>
							<td><a href="javascript:;">삭제</a></td>
							<td>미정</td>
						</tr>
					</tbody>
				</table>
				<div class="btn_group">
					<div class="ac">
						<a href="javascript:;" class="btn_pos"><span>저장</span></a>
					</div>
					<div class="fr">
						<a href="javascript:;" class="btn_white"><span>이전</span></a>
						<a href="javascript:;" class="btn_white"><span>목록보기</span></a>
					</div>
				</div>
				
				<h3 class="h3_tit">등록 가능 애플릿 프로파일 목록</h3>
				<!-- S:form_box -->
				<div class="form_box">
					<!-- S:Colgroup -->
					<div class="colgroup" style="width:44%">
						<span class="bar">|</span>
						<div class="rowgroup">
							<div class="tbl_inner">
								<table>
									<colgroup>
										<col width="30%" />
										<col width="70%" />
									</colgroup>
									<tbody>
									<tr>
										<th><label for="pro41">프로파일 ID</label></th>
										<td class="input"><input type="text" value="" style="width:100%;" id="pro41"></td>
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
										<col width="30%" />
										<col width="70%" />
									</colgroup>
									<tbody>
									<tr>
										<th><label for="pro42">애플릿명</label></th>
										<td class="input"><input type="text" value="" style="width:100%;" id="pro42"></td>
									</tr>
									</tbody>
								</table>
							</div>
						</div>					
						<span class="barr">|</span>
					</div>
					<!-- E:Colgroup -->
					<!-- S:BTN -->
					<div class="colgroup btn" style="width:12%">
						<span class="bar">|</span>
						<a href="javascript:;" class="btn_black"><span>검색</span></a>
						<span class="barr">|</span>
					</div>
					<!-- E:BTN -->				
				</div>
				<!-- E:form_box -->
				
				<table class="dtbl_col">
					<caption></caption>
					<colgroup>
						<col width="8%" />
						<col width="auto" />
						<col width="auto" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">No.</th>
							<th scope="col">프로파일 ID</th>
							<th scope="col">애플릿 명</th>
							<th scope="col">타입</th>
							<th scope="col">버전</th>
							<th scope="col">크기(KB)</th>
							<th scope="col">선택</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>12</td>
							<td>2B06010401819F5AD6230166020304</td>
							<td>[APP] Tools Assa Abloy</td>
							<td><em class="t_bold">APP</em></td>
							<td><em class="t_bold">1.0.2</em></td>
							<td><em class="t_bold">0</em></td>
							<td><input type="checkbox" /></td>
						</tr>
						<tr>
							<td>11</td>
							<td>2B06010401819F5AD6230166020304</td>
							<td>[APP] Tools Assa Abloy</td>
							<td><em class="t_bold">APP</em></td>
							<td><em class="t_bold">1.0.2</em></td>
							<td><em class="t_bold">0</em></td>
							<td><input type="checkbox" /></td>
						</tr>
						<tr>
							<td>10</td>
							<td>2B06010401819F5AD6230166020304</td>
							<td>[APP] Tools Assa Abloy</td>
							<td><em class="t_bold">APP</em></td>
							<td><em class="t_bold">1.0.2</em></td>
							<td><em class="t_bold">0</em></td>
							<td><input type="checkbox" /></td>
						</tr>
					</tbody>
				</table>
				
				
				<table class="dtbl_col prd_list_onoff">
					<caption></caption>
					<colgroup>
						<col width="8%" />
						<col width="auto" />
						<col width="auto" />
						<col width="auto" />
						<col width="auto" />
						<col width="auto" />
						<col width="auto" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">No.</th>
							<th scope="col">등록일</th>
							<th scope="col">등록자</th>
							<th scope="col">발급사 상품코드</th>
							<th scope="col">발급사 상품명</th>
							<th scope="col">제휴사 명</th>
							<th scope="col">상품 목록</th>
						</tr>
					</thead>
					<tbody>
						<tr> 
							<td>12</td>
							<td><em class="t_bold">2016-05-07 13:22:13</em></td>
							<td>sysadmin00</td>
							<td>012-3454-6787</td>
							<td>[KB]MCHIP4</td>
							<td>KB</td>
							<td><a href="javascript:;" onclick="javascript:fn_detail_open(this);" class="ico btn_onoff"><i>상품목록보기</i></a></td>
						</tr>
						<tr class="detail">
							<td colspan="7">
								<table class="tbl_detail" cellspacing="0" cellpadding="0" summary="">
									<caption></caption>
									<colgroup>
										<col width="auto" />
										<col width="33%" />
										<col width="33%" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" rowspan="5" class="rline">등록된 카드 상품 목록 </th>
											<th>카드 상품 명</th>
											<th>유효기간</th>
										</tr>
										<tr>
											<td>[KB]MCHIP4-42424242-PIN</td>
											<td>2016-03-04 ~ 2016-04-04</td>
										</tr>
										<tr>
											<td>[KB]MCHIP4-42424242-PIN</td>
											<td>2016-03-04 ~ 2016-04-04</td>
										</tr>
										<tr>
											<td>[KB]MCHIP4-42424242-PIN</td>
											<td>2016-03-04 ~ 2016-04-04</td>
										</tr>
										<tr>
											<td>[KB]MCHIP4-42424242-PIN</td>
											<td>2016-03-04 ~ 2016-04-04</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td>11</td>
							<td><em class="t_bold">2016-05-07 13:22:13</em></td>
							<td>sysadmin00</td>
							<td>012-3454-6787</td>
							<td>[KB]MCHIP4</td>
							<td>KB</td>
							<td><a href="javascript:;" onclick="javascript:fn_detail_open(this);" class="ico btn_onoff"><i>상품목록보기</i></a></td>
						</tr>
						<tr class="detail">
							<td colspan="7">
								<table class="tbl_detail" cellspacing="0" cellpadding="0" summary="">
									<caption></caption>
									<colgroup>
										<col width="auto" />
										<col width="33%" />
										<col width="33%" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" rowspan="5" class="rline">등록된 카드 상품 목록 </th>
											<th>카드 상품 명</th>
											<th>유효기간</th>
										</tr>
										<tr>
											<td>[KB]MCHIP4-42424242-PIN</td>
											<td>2016-03-04 ~ 2016-04-04</td>
										</tr>
										<tr>
											<td>[KB]MCHIP4-42424242-PIN</td>
											<td>2016-03-04 ~ 2016-04-04</td>
										</tr>
										<tr>
											<td>[KB]MCHIP4-42424242-PIN</td>
											<td>2016-03-04 ~ 2016-04-04</td>
										</tr>
										<tr>
											<td>[KB]MCHIP4-42424242-PIN</td>
											<td>2016-03-04 ~ 2016-04-04</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td>10</td>
							<td><em class="t_bold">2016-05-07 13:22:13</em></td>
							<td>sysadmin00</td>
							<td>012-3454-6787</td>
							<td>[KB]MCHIP4</td>
							<td>KB</td>
							<td><a href="javascript:;" onclick="javascript:fn_detail_open(this);" class="ico btn_onoff"><i>상품목록보기</i></a></td>
						</tr>
						<tr class="detail">
							<td colspan="7">
								<table class="tbl_detail" cellspacing="0" cellpadding="0" summary="">
									<caption></caption>
									<colgroup>
										<col width="auto" />
										<col width="33%" />
										<col width="33%" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" rowspan="5" class="rline">등록된 카드 상품 목록 </th>
											<th>카드 상품 명</th>
											<th>유효기간</th>
										</tr>
										<tr>
											<td>[KB]MCHIP4-42424242-PIN</td>
											<td>2016-03-04 ~ 2016-04-04</td>
										</tr>
										<tr>
											<td>[KB]MCHIP4-42424242-PIN</td>
											<td>2016-03-04 ~ 2016-04-04</td>
										</tr>
										<tr>
											<td>[KB]MCHIP4-42424242-PIN</td>
											<td>2016-03-04 ~ 2016-04-04</td>
										</tr>
										<tr>
											<td>[KB]MCHIP4-42424242-PIN</td>
											<td>2016-03-04 ~ 2016-04-04</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
				
				<div class="btn_group">
					<div class="ac">
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
					</div>
					<div class="fr">
						<a href="javascript:;" class="btn_white"><span>이전</span></a>
						<a href="javascript:;" class="btn_white"><span>목록보기</span></a>
					</div>
				</div>
				
				
			</div>
			<!-- E:con_inner -->
		</div>
		<!-- E:content -->
		<!-- footer -->
		<div id="footer">
			<span class="copyright">Copyright ⓒ 2016 LG Electronics. All Rignts Reserved.</span>
		</div>
		<!-- //footer -->
	</div>
	<!-- //wrap -->
	
<script type="text/javascript">
	/* 상품목록열기 */
	function fn_detail_open(a){
		var tg = $(a).parent().parent();
		if( tg.hasClass("sel") ){
			tg.removeClass("sel");
		}else{
			tg.addClass("sel");
		}
	}
</script>
	
	
</body>
</html>
