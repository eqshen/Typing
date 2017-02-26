package app.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class CheckCookie extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();  
        Map session = ctx.getSession();  
        String jsession = (String) session.get("JSESSIONID");
        System.out.println("session"+jsession);
        if(jsession!=null){//如果不为空则通过
        	invocation.invoke();
        }
		return "cookieAbandon";
	}

}
