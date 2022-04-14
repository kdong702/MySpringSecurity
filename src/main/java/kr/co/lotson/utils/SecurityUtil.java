package kr.co.lotson.utils;

import javax.servlet.http.HttpServletRequest;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;

public class SecurityUtil {

//    public static String getAuthenticatedId() {
//        TbUserMst user = getPrincipal();
//        if (user != null) {
//            return user.getUserId();
//        }
//        return null;
//    }
//    
//    public static TbUserMst getPrincipal() {
//    	try {
//    		return (TbUserMst) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//    	} catch(Exception e) {}
//    	return null;
//    }

	public static boolean matchURL(HttpServletRequest request, String targetUrl) {
		PathMatcher pathMatcher = new AntPathMatcher();
		String contextPath = request.getContextPath();
		return pathMatcher.match(contextPath+targetUrl, (String)request.getAttribute("javax.servlet.forward.request_uri"));
	}
//	public static String getLocale(){
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
//		        .getRequestAttributes()).getRequest();
//		return (String)request.getSession().getAttribute("locale");
//	}
}
