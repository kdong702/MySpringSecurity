<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>LG PAY Partners</title>

<!-- jquery js/css
	================================================== -->
<script type="text/javaScript" src="/js/jquery/jquery-1.12.4.min.js"></script><!-- 20160725 수정 -->
<script type="text/javaScript" src="/js/jquery/jquery-ui-1.10.3.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/jquery/jquery-ui-1.10.3.custom.min.css" />
	
<!-- Glim common ui js/css 
	================================================== -->
<script type="text/javascript" src="/js/partners.front.ui.js"></script>	
<link rel="stylesheet" type="text/css" href="/css/partners_sub.css" />

<!-- popup common
	================================================== -->
<script type="text/javaScript" src="/js/common.popup.js"></script>

	
<script> 
(function($) {
	$.ajaxSetup({
	    beforeSend: function(xhr) {
	    	xhr.setRequestHeader("ajax", true);
	    },
	    error: function(xhr, status, err) {
	    	if(xhr.responseText){
	    		var error = JSON.parse(xhr.responseText);
		        alert("SYSTEM ERROR\nSTATUS:"+xhr.status+"\nMESSAGE:"+error.message);
	    	} else {
	    		console.log('xhr:'+xhr);
	    		console.log('status:'+status);
	    		console.log('err:'+err);
	    		alert("서버와의 통신에 실패하였습니다.");	
	    	}
	    }
	});
	
})(jQuery);
</script>