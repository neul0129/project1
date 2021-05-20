package site.margaret.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Pattern;



public class Utility {
			
	//��ȣȭ ó�� 
	
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
		 	//���ڿ� ��� ������ ��ȯ 
		public static String stripTag(String source) {
			Pattern htmlTag=Pattern.compile("\\<.*?\\>",Pattern.CASE_INSENSITIVE);
			
			source=htmlTag.matcher(source).replaceAll(""); // �±װ��� ���ڿ� ����
					
			return source;		
		}
		
		//ȸ�ǹ��� ��ȯ �� ��ȯ 
		public static String escapeTag(String source) {
			return source.replace("<","&lt;").replace("<","&gt");
		}
		
}







