package app.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieUtil {
	public static String getCookieValue(HttpServletRequest request,String cookieName) throws Exception{
	        Cookie[] cookies = request.getCookies();
	        if(cookies==null){return null;}
	        for(Cookie cookie : cookies)
	        {
	            if(cookie.getName().equals(cookieName))
	            {
	                try {
						return URLDecoder.decode(cookie.getValue(),"utf-8");
	                	//return cookie.getValue();
					} catch (Exception e) {
						throw e;
					}
	            }
	        }
	        return null;
	}
}
