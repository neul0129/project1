package site.margaret.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Pattern;



public class Utility {
			
	//암호화 처리 
	
		public static String encrypt(String source) {
			String password="";
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-256");
				md.update(source.getBytes());
				
				byte[] digest= md.digest();
				
				for(int i=0;i<digest.length;i++) {
					password+=Integer.toHexString(digest[i]&0xff);
				}
			} catch (NoSuchAlgorithmException e) {
				System.out.println("ERROR");
			}
			return password;
		}
		 	//문자열 모두 제거후 반환 
		public static String stripTag(String source) {
			Pattern htmlTag=Pattern.compile("\\<.*?\\>",Pattern.CASE_INSENSITIVE);
			
			source=htmlTag.matcher(source).replaceAll(""); // 태그관련 문자열 제거
					
			return source;		
		}
		
		//회피문자 변환 후 반환 
		public static String escapeTag(String source) {
			return source.replace("<","&lt;").replace("<","&gt");
		}
		
}







