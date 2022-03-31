/*
 파일명:		common.popup.js
 설명:		팝업 관련 온오프
 작성자:		glim
 최초작성일:	2016/07/08
 최종수정일:	2016/07/26
 - 레이어팝업 모달공통팝업
 1 팝업 오픈시 기본 중앙정렬
 [사용안함]2 컨텐츠가 윈도우 높이보다 클경우 스크롤 
 3 팝업 > 팝업 가능
 4 drag 가능
 5 열릴때/리사이즈시 사이즈 체크 윈도우보다 팝업이 크면 사이즈 줄임 팝업 내 스크롤 옵션 추가
*/


$(document).ready( function(){
	
	$( window ).resize(function() { resize_popup(); });
})

// 모달공통팝업 
function layer_open(el, strCloseClass){
	var temp = $(el);
	var modalpop = temp.parents('.modalPopup').eq(0);
	modalpop.fadeIn();

	var ap = temp.actionPopup();
	if(ap!=null) {
		if(ap.actionPopup!=null) ap.actionPopup.initHeight();
	}
	/* origin-height save */
	var tg =  temp.find('.pop_contents');
	if ( tg.attr('data-origin-height') == undefined ){//최초에 한번만
		tg.attr('data-origin-height',tg.outerHeight());
	}
	// 화면 중앙에 레이어띄움
	if (temp.outerHeight() < window.innerHeight ) {
		temp.offset({top : (window.innerHeight-temp.outerHeight())/2 + +window.pageYOffset});
	}else{
		//팝업이 window 더클경우
		temp.offset({top : 0});
		if ( window.innerHeight < temp.outerHeight() ){
			tg.css('height',window.innerHeight-45);
		}
		/* modalpop.height(temp.outerHeight()).css('position','absolute');
		//드래그시에 아래쪽으로 내려가면 공백으로 보임
		modalpop.find('.dimmed').css('position','fixed'); */
	}
	
	if (temp.outerWidth() < window.innerWidth ) {
		temp.offset({left : (window.innerWidth-temp.outerWidth())/2});
	}else{
		temp.offset({left : 0});
	}

	if(strCloseClass==null) {
		temp.find('.btn_pop_close, .btnPop_cancel, .btnCancel').click(function(e){
			/* modalpop.fadeOut(100,function(){
				modalpop.removeAttr("style");
				modalpop.find('.dimmed').removeAttr("style");
			} ); */
			layer_close (temp);
			e.preventDefault();
		});
	}else{
		temp.find(strCloseClass).click(function(e){
			//modalpop.fadeOut();
			layer_close (temp);
			e.preventDefault();
		});
	}
}

/* 팝업닫기 */
function layer_close(el){
	//console.log ( 'layer_close' );
	var temp = $(el);
	var modalpop = temp.parents('.modalPopup').eq(0);
	var tg =  temp.parents('.modalPopup').eq(0).find('.pop_contents');
	modalpop.fadeOut(/* 100,function(){
		modalpop.removeAttr("style");
		modalpop.find('.dimmed').removeAttr("style");
	} */);
}

/* 추가 2016/04/14 */
function resize_popup (e){
	//console.log ( $('.modalPopup:visible').length );
	
	var els = $('.modalPopup:visible');
	
	$(els).each(function(i) {
		var temp = $(this).find('.popup_layer');
		var tg =  temp.find('.pop_contents');
		var hh;
		var w_innerHeight = window.innerHeight - 45;
		var tg_outerHeight = tg.outerHeight();
		var ori_height = tg.attr('data-origin-height');
		
		if ( w_innerHeight <= tg_outerHeight ){
			//팝업이 윈도우보다 크거나 같으면 윈도우 싸이즈	
			hh = w_innerHeight;
			temp.css('top',0);
		}else{
			//팝업이 윈도우보다 작으면 
			//설정될 값이 오리진보다 클때 기존값
			tg.addClass('scroll_wrap');
			hh = ( ori_height <  w_innerHeight  ) ? ori_height:w_innerHeight;
		}
		tg.css('height',hh);
	});
}

/* function trace (val){	
	$('#trace').append (val+'\n');
} */

(function($) {
	
	
	$.fn.actionPopup = function() {
		
		if($(this).length==0) {
			return null;
		}
		if("undefined" == typeof $(this).data("actionPopup") || $(this).data("actionPopup") == null) {
		}else{
			return $(this).data();
		}
		
		var data = {
			element : $(this),
			popupHeader : null,
			popup_layer : null,
			popContainer : null,
			popupHeader : null,
			isMouseDown : false,
			mouseDownX : 0,
			mouseDownY : 0,
			offsetLeft : 0,
			offsetTop : 0,
			popupHeader : null,
			popupNsResizer : null,
			isResizerMouseDown : false,
			currentHeight : 0,
			originHeight : 0,
			initHeight : function() {
				if(this.popContainer !=null && this.originHeight>0) {
					this.popContainer.height(this.originHeight);
				}
			}
		};
		
		data.popupHeader = $(this).find("h1");
		data.popup_layer = $(this);
		data.popContainer = $(this).find(".popConWrap");
		data.popupHeader.css("cursor","move");
		data.popup_layer.css("max-height", "initial");
		data.popup_layer.css("overflow-y", "hidden");
		data.originHeight = $(this).find(".popConWrap").height();
		
		data.popupHeader.mousedown(function(e) {
			data.isMouseDown = true;
			data.mouseDownX = e.pageX;
			data.mouseDownY = e.pageY;
			data.offsetLeft = data.popup_layer.offset().left;
			data.offsetTop = data.popup_layer.offset().top;
			e.preventDefault();
		});
		
		$(document).on("blur", function(e) {
			data.isMouseDown = false;
			data.isResizerMouseDown = false;
		});
		
		$(document).mouseup(function(e) {
			if(data.isMouseDown) {
				if(e.pageX > window.innerWidth) {
					data.popup_layer.offset({left:window.innerWidth-100});
				}
				if(e.pageY > window.innerHeight+window.pageYOffset) {
					data.popup_layer.offset({top:window.innerHeight-100+window.pageYOffset});
				}
			}else if(data.isResizerMouseDown) {
				if(e.pageY > window.innerHeight+window.pageYOffset) {
					data.popContainer.height(window.innerHeight-data.popContainer.offset().top-5+window.pageYOffset);
				}
			}
			data.isMouseDown = false;
			data.isResizerMouseDown = false;
		});
		
		
		$(document).mousemove(function(e) {
			if(data.isMouseDown) {
				var newTop = data.offsetTop - (data.mouseDownY - e.pageY);
				if(newTop<window.pageYOffset) {
					newTop = window.pageYOffset;
				}
				var newLeft = data.offsetLeft - (data.mouseDownX - e.pageX);
				if(newLeft<0) {
					newLeft = 0;
				}
				if(data.offsetLeft == newLeft && data.offsetTop == newTop) {
					return;
				}
				data.popup_layer.offset({top:newTop, left:newLeft});
				
			}else if(data.isResizerMouseDown) {
				var newHeight = data.currentHeight - (data.mouseDownY - e.pageY);
				if(newHeight<0) {
					newHeight = 0;
				}
				data.popContainer.height(newHeight);
			}
			
			e.preventDefault();
		});
		
		data.popupNsResizer = $(this).find(".popupNsResizer");
		
		data.popupNsResizer.mousedown(function(e) {
			data.isResizerMouseDown = true;
			data.mouseDownY = e.pageY;
			data.currentHeight = data.popContainer.height();
			e.preventDefault();
		});
		
		$(this).data("actionPopup", data);
		
		return data;
	};
})(jQuery);


/* 20160725 only ie8 */
(function (window, document) {

  var html = document.documentElement;
  var body = document.body;

  var define = function (object, property, getter) {
    if (typeof object[property] === 'undefined') {
      Object.defineProperty(object, property, { get: getter });
    }
  };

  define(window, 'innerWidth', function () { return html.clientWidth });
  define(window, 'innerHeight', function () { return html.clientHeight });

  define(window, 'scrollX', function () { return window.pageXOffset || html.scrollLeft });
  define(window, 'scrollY', function () { return window.pageYOffset || html.scrollTop });
  
  define(window, 'pageYOffset', function () { return html.scrollLeft });
  define(window, 'pageYOffset', function () { return html.scrollTop });

  define(document, 'width', function () { return Math.max(body.scrollWidth, html.scrollWidth, body.offsetWidth, html.offsetWidth, body.clientWidth, html.clientWidth) });
  define(document, 'height', function () { return Math.max(body.scrollHeight, html.scrollHeight, body.offsetHeight, html.offsetHeight, body.clientHeight, html.clientHeight) });

  return define;

}(window, document));