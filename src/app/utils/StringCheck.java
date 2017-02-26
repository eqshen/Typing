package app.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringCheck {
	public static void main(String []args){
		String teString="我们拥有最\nhehe";
		System.out.println(teString);
		teString=teString.replaceAll("\\n|\\r\\n", "");
		System.out.println(teString);
		//splitArticle(teString);
	}
	//验证传进来的多个参数是否有为null的
	public static boolean isNull(String ...params){
		boolean flag=true;
		for(String item:params){
			if(item==null){
				flag=false;
				break;
			}
		}
		return flag;
	}
	//对文章进行合理切割
	public static List<String>splitArticle(String str,String type){
//		String spaces[]=str.split("[,.:;!，。！：]");
//		System.out.println(spaces.length);
//		for(int i=0;i<spaces.length;i++){
//			System.out.println(spaces[i]);
//		}
		List<String>resList=new ArrayList<String>();
		if(type.equals("chinese")){
			char ch='s';
			final int max_legth=29;
			int tail=0;int cut=1;
			String temp=null;
			for(int i=0;i<str.length();i++){
				ch=str.charAt(i);
				if(isBiaodian(ch)){
					if((i+1-tail)<max_legth&&i!=str.length()-1){cut=i+1;continue;}
					else if(i==str.length()-1){cut=i+1;}//如果到结尾了
					else{//如果长度超过30
						if(isBiaodian(str.charAt(tail+max_legth+1)))
						{cut=tail+max_legth+2;
						}else{cut=tail+max_legth;}
					}
					//else if((i+1-tail)>30){cut=i+1;}
					//cut here
					temp=str.substring(tail, cut);
					
					temp=temp.replaceAll("\\n|\\r\\n", "");
					resList.add(temp);
					tail=cut;
				}
			}
		}else{
			char ch='s';
			final int max_legth=60;
			int tail=0;int cut=1;
			String temp=null;
			for(int i=0;i<str.length();i++){
				ch=str.charAt(i);
				if(isBiaodian(ch)){
					if((i+1-tail)<max_legth&&i!=str.length()-1){cut=i+1;continue;}
					else if(i>=str.length()-1){cut=str.length();}//如果到结尾了
					else{
						//如果长度超过30,则找下一个标点
//						if(isBiaodian(str.charAt(tail+max_legth+1)))//如果 下一行的开头是标点
//						{cut=tail+max_legth+2;
//						}else{cut=tail+max_legth;}
					}
					//else if((i+1-tail)>30){cut=i+1;}
					//cut here
					temp=str.substring(tail, cut);
					temp=temp.replaceAll("\\n|\\r\\n", "");
					resList.add(temp);
					tail=cut;
				}
				
			}
			//System.out.println(tail+"  "+ cut+"  "+(tail+max_legth));
			if(tail<cut){
				resList.add(str.substring(tail,cut));
			}
			
		}
		
		return resList; 
	}
	public static boolean isBiaodian(char ch){
		if(ch=='，'||ch=='。'||ch=='？'||ch=='！'||ch=='：'||ch==','||ch=='.'||ch=='!'||
				ch=='?'||ch==':'||ch==' ')
		{return true;}
		return false;
	}
}
