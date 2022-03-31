/*
 파일명:		cams.front.ui.js
 설   명:		cams js
 작성자:		glim
 최초작성일:	2016/07/08
 최종수정일:	2016/07/08
  
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
						
			if($('#gnb').length > 0){//메뉴 생성
				gl.home.initGnb();
			}
			
			try {
				//datepicker: setting
				$.datepicker.setDefaults({
					dateFormat: 'yy-mm-dd',
					monthNames: ['January','February','March','April','May','June','July','August','September','October','November','December'],
					dayNamesMin: ['SUN','MON','THE','WED','THU','FRI','SAT'],
					showMonthAfterYear: true,
					showOn: "button",
					buttonImage : "images/ui/btn_calendar.png",
					buttonImageOnly: true,
					buttonText: "Select date",
					currentText: "Now"
				});
			}
			catch(exception){
				//catchStatements
			}
		   
		},
		initGnb : function(_data){
			var gnb = $("#gnb ul.g_navi");
			var glen = gnb.find(">li").length;
			
			$('>li',gnb).each(function(i) {
				$(this).attr("id","gnb_"+i);
			
				//hover
				$(this).mouseover(function(e){
					
					_timer = clearTimeout( _timer );
					_timer = null;
					
					var tgId = $(e.currentTarget).attr('id');
					
					//전체닫기
					$(gnb).find('.active').removeClass("active");
					$('#'+tgId).addClass("active");
										
					if ( tgId != undefined ){					
						var mid = parseInt(tgId.split("_")[1]);
						var sid = parseInt(tgId.split("_")[2]);
						if ( mid != undefined || NaN != mid ){
							$('#gnb ul.g_navi > li:nth-child('+(mid+1)+')').addClass("active");
						}
					}
				});
				
				//focus out
				$('#gnb ul.g_navi').mouseleave(function(e){
					_timer = setTimeout( "gl.home.mnbFocus()", 1000 );
				});
			});
						
			//최초 메뉴 활성화 실행 
			_timer = setTimeout( "gl.home.mnbFocus()", 200 );
		},
		mnbFocus : function() { //Gnb 메뉴 활성화
			if ( _timer == null ) { return false;}
			$('#gnb ul.g_navi > li').removeClass("active");			
			if (_mnbSelectId[0] != -1){
				$('#gnb_'+_mnbSelectId[0]).addClass("active");
			}			
			if ( _mnbSelectId.length > 1 &&  _mnbSelectId[1] != -1 ){
				$('#gnb_'+_mnbSelectId[0]).find('> ul > li:nth-child('+(_mnbSelectId[1]+1)+')').addClass("active");				
			}
			resize();
		}
	}

	//g에 gl 속성으로 gl 할당
	g.gl = gl;

})(globalObj);
/* Category Gnb */
var _minwidth = 1113;	
var _gnbh= 800;
/* RESIZE  */
function resize (){
	
	 
	var wh = $( window ).height();
	var bh = $("#wrap").height();
	
	if ($('#body.login_wrap').length > 0){
		$('body').css('backgroundColor','#f5f5f5');
	}
	
	if ( $('.login_wrap' ).length > 0 ){ $('.login_wrap').css('height',hh-80);	}
	
	
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

