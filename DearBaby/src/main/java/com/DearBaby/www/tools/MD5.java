package com.DearBaby.www.tools;



import java.security.MessageDigest;

/**
 *   MD5加密工具
 */

public class MD5 {
	private static final char HEX_DIGITS[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',

        'A', 'B', 'C', 'D', 'E', 'F' };


	private static String toHexString(byte[] b) {

	    //String to  byte

	    StringBuilder sb = new StringBuilder(b.length * 2);

	    for (int i = 0; i < b.length; i++) {

	        sb.append(HEX_DIGITS[(b[i] & 0xf0) >>> 4]);

	        sb.append(HEX_DIGITS[b[i] & 0x0f]);

	    }

	    return sb.toString();

	}

	protected static String getMD5Str(String s) {

	    try {

	        // Create MD5 Hash

	        MessageDigest digest = MessageDigest.getInstance("MD5");

	        digest.update(s.getBytes("UTF-8"));

	        byte messageDigest[] = digest.digest();

	        return toHexString(messageDigest);

	    } catch (Exception e) {

	        e.printStackTrace();

	    }

	    return "";

	}
}
