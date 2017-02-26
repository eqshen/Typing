package app.utils;

public class StringBulid {
	public static void main(String args[]) throws InterruptedException{
		for(int i=0;i<10;i++){
			System.out.println(bulidToken());
		}
	}
	public static String buildUserid() throws InterruptedException{
		String time=String.valueOf(System.currentTimeMillis());
		time=time.substring(time.length()-12, time.length());
		int num=(int)(Math.random()*1000000);
		String num2=String.valueOf(num);
		if(num2.length()<6){num2="0"+num2;}
		//System.out.println(time +"  "+num2);
		return time+num2;
	}
	public static String bulidToken(){
		return String.valueOf((int)(Math.random()*1000000));
	}
}
