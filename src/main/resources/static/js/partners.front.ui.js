/*
 파일명:		partners.ui.js
 설   명:		제휴사 공통 자바스크립트
 작성자:		glim
 최초작성일:	2016/07/08
 최종수정일:	2016/07/26
  - fixed : header/left 
  - 최소 사이즈 수정 : 1262 * 800
*/
(function($){
	
})


$(document).ready( function(){
	
	//페이지로딩시 공통실행 메서드
	gl.home.autoStart();
	
	$( window ).resize(function() { resize(); });
	resize();
})

var globalObj = this;
var _Browser_Ver;


//var _mnbSelectId = [1,2,0];// = [1,2];/*활성화된 메뉴 0 부터 카운트됨*/
var _mnbSelectId=[];
var _timer;//gnb timer


(function(g){		//자동호출 및 초기화
	//네임스페이스 정의 및 함수 정의
	var gl = gl || {};
	gl.createNamespace = function(namespace){
		var parts = namespace.split('.');
		var current = this;
		for(var i in parts){
			if(!current[parts[i]]){
				current[parts[i]] = {};
			}
			current = current[parts[i]];
		}
	};
	gl.createNamespace("home");			// 초기화 네임스페이스

	//초기화 메서드
	gl.home = {
		autoStart : function(){
			//console.log ( "autoStart" );
						
			if($('#lnb').length > 0){//메뉴 생성
				gl.home.initLnb();
			}
			
			try {
				//datepicker: setting
				$.datepicker.setDefaults({
					dateFormat: 'yy-mm-dd',
					monthNames: ['January','February','March','April','May','June','July','August','September','October','November','December'],
					dayNamesMin: ['SUN','MON','THE','WED','THU','FRI','SAT'],
					showMonthAfterYear: true,
					showOn: "button",
					buttonImage : "/images/ui/btn_calendar.png",
					buttonImageOnly: true,
					buttonText: "Select date",
					currentText: "Now"
				});
			}
			catch(exception){
				//catchStatements
			}
		   
		},
		initLnb : function(_data){
			var lnb = $("#lnb ul.l_navi");
			var llen = lnb.find(">li").length;
						
			$('>li',lnb).each(function(i) {
				$(this).attr("id","lnb_"+i);
				
				//hover
				$(this).mouseover(function(e){
					
					_timer = clearTimeout( _timer );
					_timer = null;
					
					var tgId = $(e.currentTarget).attr('id');
					
					//전체닫기
					//$('>li',lnb).removeClass("active").find(">ul.dep2_li_ul").hide();
					$('>li',lnb).removeClass("active");
					$('#'+tgId).addClass("active");
					if ( tgId != undefined ){					
						var mid = parseInt(tgId.split("_")[1]);
						var sid = parseInt(tgId.split("_")[2]);
						if ( mid != undefined || NaN != mid ){
							$('#lnb > ul > li:nth-child('+(mid+1)+')').addClass("active");
						}
					}
				});
				
				//focus out
				$('#lnb .l_navi').mouseleave(function(e){
					_timer = setTimeout( "gl.home.mnbFocus()", 1000 );
				});
			});
						
			//최초 메뉴 활성화 실행 
			_timer = setTimeout( "gl.home.mnbFocus()", 200 );
		},
		mnbFocus : function() { //Gnb 메뉴 활성화
			if ( _timer == null ) { return false;}
			$('#lnb ul.l_navi > li').removeClass("active");
			if (_mnbSelectId[0] != -1){
				$('#lnb_'+_mnbSelectId[0]).addClass("active");
			}			
			if ( _mnbSelectId.length > 1 &&  _mnbSelectId[1] != -1 ){
				$('#lnb_'+_mnbSelectId[0]).find('> ul > li:nth-child('+(_mnbSelectId[1]+1)+')').addClass("active");				
			}
			if ( _mnbSelectId.length > 2 && _mnbSelectId[2] != -1 ){
				$('#lnb_'+_mnbSelectId[0]).find('> ul > li:nth-child('+(_mnbSelectId[1]+1)+') > ul > li:nth-child('+(_mnbSelectId[2]+1)+')').addClass("active");
			}
			resize();
		}
	}

	//g에 gl 속성으로 gl 할당
	g.gl = gl;

})(globalObj);

/* Gnb */
var _minwidth = 1263;	
var _gnbh= 800;

/* RESIZE  */
function resize (){
	
	if ( $('#lnb').length > 0 ){
		$('#body').css('padding-left','260px');
	}else{//lnb 없을때
		//console.log ("AA")
		$('#body').css('padding-left','40px')
	}
	
	/* 2016708 add
	window 가로가  _minwidth 보다 작아졌을때  
	fixed 유지 가로 스크롤만 
	 */
	var ww = $( window ).width();
	
	$( window ).scroll(function() {
		var sl = ($(window).scrollLeft());
		if ( ww < _minwidth ){//_minwidth 보다 작을때
			if ( wh < _gnbh ){//_gnbh 보다 작을때
				$('#lnb').css({'left':0});
			}else{//_gnbh 보다 클때
				$('#lnb').css({'left':-(sl)});
			}
		}else{//_minwidth 보다 클때
		}
	});
	 
	var wh = $( window ).height();
	var bh = $("#wrap").height();
	var hh;
	if ( wh < _gnbh ){//_gnbh 보다 작을때
		$('#lnb').css({'position':"absolute",'left':0});
		hh = bh;
	}else{//_gnbh 보다 클때
		$('#lnb').css({'position':"fixed"});
		hh = wh;
	}
	$('#lnb').css('height',hh);	
	$('#content').css('min-height',hh-131);
	
}

/*
엘리먼트 show hide (공통class)
fn_tabswich (container,tab,num,tg)
ex) fn_tabswich('#pPerformantView','.tabed', 1,'.tab_content');
Pram : 
		container : 전체컨테이너
		tab : tab 
		idx : 활성화 인덱스 1부터 시작
		tg : 탭 컨텐츠 공통 클래스
*/
function fn_tabswich (container,tab,num,tg){
	//공통 비활성화
	$(container).find(tg).hide();
	$(container+ " "+ tab +" li" ).removeClass("here");
	//선택 활성화
	$(container+ " "+ tab +" li:nth-child("+(num)+")" ).addClass("here");
	$($(container ).find(tg)[num-1]).show();
}



$.fn.pixels = function(property) {
    return parseInt(this.css(property).slice(0,-2));
};

