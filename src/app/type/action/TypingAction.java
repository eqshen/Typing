package app.type.action;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import app.model.UserService;
import app.type.bean.Article;
import app.type.bean.NoRegisterUser;
import app.type.factory.DaoFactory;
import app.utils.CookieUtil;
import app.utils.StringBulid;
import app.utils.StringCheck;

import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings({ "serial", "deprecation" })
public class TypingAction extends ActionSupport  {
	private String username;
	//用户选择的文章类型
	private String option_type;
	private String articleSelect;
	private String password;
	private List<String>sentenceList;
	private Integer article_length;
	private Logger log=Logger.getLogger(TypingAction.class);
	private Boolean isNeedLogin;
	private String token;
	
	//用户表单提交上来的数据
	private String timeuse;
	private String rightwords;
	private String wrongwords;
	private String backwords;
	private String typespeed;
	private String keyspeed;
	private Float rightPercent;
	
	

	public Float getRightPercent() {
		return rightPercent;
	}

	public void setRightPercent(Float rightPercent) {
		this.rightPercent = rightPercent;
	}

	public String getTimeuse() {
		return timeuse;
	}

	public void setTimeuse(String timeuse) {
		this.timeuse = timeuse;
	}

	public String getRightwords() {
		return rightwords;
	}

	public void setRightwords(String rightwords) {
		this.rightwords = rightwords;
	}

	public String getWrongwords() {
		return wrongwords;
	}

	public void setWrongwords(String wrongwords) {
		this.wrongwords = wrongwords;
	}

	public String getBackwords() {
		return backwords;
	}

	public void setBackwords(String backwords) {
		this.backwords = backwords;
	}

	public String getTypespeed() {
		return typespeed;
	}

	public void setTypespeed(String typespeed) {
		this.typespeed = typespeed;
	}

	public String getKeyspeed() {
		return keyspeed;
	}

	public void setKeyspeed(String keyspeed) {
		this.keyspeed = keyspeed;
	}
	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Boolean getIsNeedLogin() {
		return isNeedLogin;
	}

	public void setIsNeedLogin(Boolean isNeedLogin) {
		this.isNeedLogin = isNeedLogin;
	}

	public Integer getArticle_length() {
		return article_length;
	}

	public void setArticle_length(Integer article_length) {
		this.article_length = article_length;
	}

	public List<String> getSentenceList() {
		return sentenceList;
	}

	public void setSentenceList(List<String> sentenceList) {
		this.sentenceList = sentenceList;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}



	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getOption_type() {
		return option_type;
	}
	public void setOption_type(String option_type) {
		this.option_type = option_type;
	}
	public String getArticleSelect() {
		return articleSelect;
	}
	public void setArticleSelect(String articleSelect) {
		this.articleSelect = articleSelect;
	}

	//end of get and set
	//start of jsp interface
	//index.jsp
	public String index(){
		try {
//			isNeedLogin=false;
//			//判断用户信息是否在cookie中
//			HttpServletRequest request = ServletActionContext.getRequest();
//			String usernameString=CookieUtil.getCookieValue(request, "username");
//			String usertype=CookieUtil.getCookieValue(request, "usertype");
//			//System.out.println("usernameString"+usernameString);
//			//如果成功读取用户名 和用户类型
//			if(usernameString!=null&&usertype!=null&&!usertype.equals("")&&!usernameString.equals("")){
//				this.username=usernameString;
//				if(usertype.equals("B"))//如果用户类型是已经注册过的
//				{
//					isNeedLogin=true;
//				}
//				log.info("读取用户cookie成功："+usernameString);
//			}//如果用户名 或者用户类型 为空
//			else if(usernameString==null||usernameString.equals("")||usertype==null||usertype.equals("")) {//如果用户名不存在，则为之分配一个用户名
//				NoRegisterUser user=null;
//				user=new UserService().buildNoReUser();
//				usertype="A";
//				if(user!=null){
//					log.info("创建游客用户成功："+user.getUsername());
//					this.username=user.getUsername();
//				}
//				else{
//					log.info("创建游客用户失败");
//				}
//			}
//			
//			//添加cookie
//			 HttpServletResponse response = ServletActionContext.getResponse();
//			 Cookie cookie=new Cookie("username", URLEncoder.encode(this.username, "utf-8"));
//			 cookie.setMaxAge(3600*24*30);
//			 Cookie userTypeCookie=new Cookie("usertype", URLEncoder.encode(usertype, "utf-8"));
//			 userTypeCookie.setMaxAge(3600*24*30);
//			 response.addCookie(cookie);
//			 response.addCookie(userTypeCookie);
			/* 以上代码，如果用户使用更改密码的账号登录，会把cookie中的username替换为该账号，
			 * 以下代码，只生成访客的cookie，无视正式用户（不创建cookie）   
			 *    */
			token=StringBulid.bulidToken();
			HttpSession session=ServletActionContext.getRequest().getSession();
			session.setAttribute("token", token);
		} catch (Exception e) {
			log.error("加载index页面失败，预初始化失败",e);
		}
		return "index";
	}
	//speedTest.jsp
	public String test(){
		HttpSession session=ServletActionContext.getRequest().getSession();
		if(session==null||session.getAttribute("username")==null||
				StringCheck.isNull(option_type,articleSelect)==false){
			return "reIndex";
		}
		Article article=null;
		try {
			//设置令牌
			token=StringBulid.bulidToken();
			session.setAttribute("token", token);
			//获取文章
			article=DaoFactory.getArticleInfoDaoInstance().getArticleByID(Integer.parseInt(articleSelect));
			article_length=0;
			if(article!=null){
				String str=article.getContent();
				str=str.trim();
				str=str.replaceAll("\n", "");
				article_length=str.length();//文章的长度，供前端使用
				//System.out.println(str);
				article.setContent(str);
				sentenceList=StringCheck.splitArticle(str,option_type);
				//System.out.println(sentenceList.get(sentenceList.size()-1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "speedTest";
	}
	//用户完成打字，上传数据
	public String finishType(){
		HttpSession session=ServletActionContext.getRequest().getSession();
		if(session==null||session.getAttribute("username")==null||
				StringCheck.isNull(timeuse,rightwords,wrongwords,
						backwords,typespeed,keyspeed,token,articleSelect)==false){
			return "reIndex";
		}
//		System.out.println(timeuse);
//		System.out.println(rightwords);
//		System.out.println(wrongwords);
//		System.out.println(backwords);
//		System.out.println(typespeed);
//		System.out.println(keyspeed);
//		System.out.println(token);
		if(!session.getAttribute("token").equals(token)){
			log.info("用户"+session.getAttribute("username")+"提交测试成绩失败，token不正确");
			return "reIndex";
		}
		rightPercent=Float.parseFloat(rightwords)*100/(Float.parseFloat(rightwords)+Float.parseFloat(wrongwords));
		
		try {
			String useridString=session.getAttribute("userid").toString();
			
		} catch (Exception e) {
			log.error("存储打字成绩记录到数据库失败。");
		}
		return "typeresult";
	}
	
}
