package app.type.ajax;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import app.model.UserService;
import app.type.action.TypingAction;
import app.type.bean.Article;
import app.type.bean.NoRegisterUser;
import app.type.bean.UserInfo;
import app.type.factory.DaoFactory;
import app.utils.CookieUtil;
import app.utils.StringCheck;

import com.opensymphony.xwork2.ActionSupport;

public class AjaxAction extends ActionSupport {
	private String username;
	private String password;
	//文章类型
	private String option_type;
	private String msg;
	private JSONArray articleJsonArray;
	private Logger log=Logger.getLogger(AjaxAction.class);
	private String usertype;
	
	public String token;
	
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getOption_type() {
		return option_type;
	}
	public void setOption_type(String option_type) {
		this.option_type = option_type;
	}
	public JSONArray getArticleJsonArray() {
		return articleJsonArray;
	}
	public void setArticleJsonArray(JSONArray articleJsonArray) {
		this.articleJsonArray = articleJsonArray;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	/*
	 * 用户登录，
	 * username,passwprd
	 * usertype:tempuser,user;
	 * */
	public String login(){
		this.msg="false";
		if(StringCheck.isNull(username,usertype)==false){return this.ERROR;}
		UserInfo info=null;
		NoRegisterUser userInfo=null;
		try {
			HttpSession session=ServletActionContext.getRequest().getSession();
			if(usertype.equals("user")&&password!=null){//如果是正式用户
				info=DaoFactory.getUserInfoDaoInstance().getUserByName(username);
				if(info.getPassword().equals(password)){//密码正确
					msg="true";
					session.setAttribute("username",info.getUsername());
					session.setAttribute("userid",info.getUserid());
					log.info("用户登录成功："+username);
				}
			}else if(usertype.equals("tempuser")){//如果是访客
				userInfo=DaoFactory.getNoRegisterUserDaoInstance().getUser(username);
				if(userInfo!=null){//密码正确
					msg="true";
					session.setAttribute("username",userInfo.getUsername());
					session.setAttribute("userid",userInfo.getUserid());
					log.info("游客登录成功："+username);
				}
				
			}else{
				System.out.println("登录失败");
				msg="wrong"; 
			}
//			info=DaoFactory.getUserInfoDaoInstance().getUserByName(username);
//			HttpSession session=ServletActionContext.getRequest().getSession();
//			session.setAttribute("username",info.getUsername());
//			session.setAttribute("userid",info.getUserid());
//			session.setAttribute("email",info.getEmail());
			
			
//			 HttpServletResponse response = ServletActionContext.getResponse();
//			 Cookie cookie=new Cookie("username", URLEncoder.encode(this.username, "utf-8"));
//			// System.out.println("test:"+cookie.getValue());
//			 cookie.setMaxAge(3600*24*30);
//			 response.addCookie(cookie);
		} catch (Exception e) {
			log.error("用户登录失败",e);
		}
		return "login_res";
	}
	
	public String logOut(){
		msg="注销失败";
		try {
			HttpSession session =ServletActionContext.getRequest().getSession();
			if(session==null||session.getAttribute("username")==null||session.getAttribute("userid")==null){
				//失败
			}else{
				msg="注销成功";
				log.info("用户注销成功："+session.getAttribute("username"));
				session.removeAttribute("username");
				session.removeAttribute("userid");
			}
		} catch (Exception e) {
			log.error("用户注销失败",e);
		}
		return "logout";
	}
	
	/*
	 * 验证用户名，查看两张用户表中是否有该用户的信息
	 * param username
	 * return {"msg":msg} msg:false,tempuser,user;
	 * */
	public String verifyUserName(){
		this.msg="false";
		if(username==null){return ERROR;}
		try {
			UserService service=new UserService();
			UserInfo userInfo=service.getUserInfoFrom2T(username);
			if(userInfo!=null&&userInfo.getUsername().equals(username)){//用户名正确
				if(userInfo.getUserid().charAt(0)!='T'){//如果是注册的用户
					msg="user";
				}else{
					msg="tempuser";
				}
			}else{
				
			}
			//System.out.println(msg);
		} catch (Exception e) {
			log.error("用户名验证失败",e);
		}
		return "verifyRes";
	}
	public String getTempUser(){
		msg="";
		try {
			HttpSession session=ServletActionContext.getRequest().getSession();
			if(!session.getAttribute("token").equals(token)){
				msg="wrong";
				return "error";
			}
			//读取cookie,如果游客用户存在则返回该用户，如果用户不存在则创建一个游客身份，再返回
			HttpServletRequest request = ServletActionContext.getRequest();
			String usernameString=CookieUtil.getCookieValue(request, "username");
			if(usernameString!=null&&!usernameString.equals("")){
				this.username=usernameString;
				this.msg=usernameString;
				log.info("读取用户cookie成功："+usernameString);
			}//如果用户名 或者用户类型 为空
			else if(usernameString==null||usernameString.equals("")) {//如果用户名不存在，则为之分配一个用户名
				NoRegisterUser user=null;
				user=new UserService().buildNoReUser();
				if(user!=null){
					log.info("创建游客用户成功："+user.getUsername());
					this.username=user.getUsername();
					this.msg=user.getUsername();
				}
				else{
					log.info("创建游客用户失败");
				}
			}
			if(username!=null){
				//添加cookie
				 HttpServletResponse response = ServletActionContext.getResponse();
				 Cookie cookie=new Cookie("username", URLEncoder.encode(this.username, "utf-8"));
				 cookie.setMaxAge(3600*24*30);
				 response.addCookie(cookie);
			}
		} catch (Exception e) {
			log.error("创建游客身份或者添加cookie失败");
		}
		return "noreUser";
	}
	public String loadAllArticle(){
		JSONObject articleJsonObj=null;
		List<Article> articleList=null;
		if(option_type==null){msg="request reject";return this.ERROR;}
		try {
			articleJsonArray=new JSONArray();
			articleList=DaoFactory.getArticleInfoDaoInstance().getArticleByType(option_type);
			for(Article article:articleList){
				articleJsonObj=new JSONObject();
				String ar=article.getContent().replaceAll("\n", "");
				ar=ar.trim();
				article.setContent(ar);
				//System.out.println(article.getContent());
				articleJsonObj.put("title", article.getTitle()+"("+article.getContent().length()+"字)");
				articleJsonObj.put("ID", article.getID());
				articleJsonArray.add(articleJsonObj);
			}
		} catch (Exception e) {
			System.out.println("拉取文章名单列表失败");
			e.printStackTrace();
		}
		return "allArticle";
	}
}
