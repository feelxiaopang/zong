package com.DearBaby.www.tools;

/**
 * Created by liaodan on 2017/4/24.
 */

/**
 * 明文信息加密类
 */
public class Encryption {
    /**
     * 采用MD5加密方式加密字符串
     * @param str  明文字符串
     * @return    加密后的字符串信息
     */
    public static String EncryString(String str) {
        return MD5.getMD5Str(str).trim();
    }
}
