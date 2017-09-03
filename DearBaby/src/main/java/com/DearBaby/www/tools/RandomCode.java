package com.DearBaby.www.tools;

/**
 * Created by liaodan on 2017/4/24.
 */

/**
 * 产生随机字符的工具类
 */
public class RandomCode {

    static char[] codeSequence = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
            'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
            'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9'};

    /**
     * 产生6个随机字符
     * @return   随机字符组成的字符串
     */
    public static String getCodes(){
        StringBuffer code=new StringBuffer();
        for(int i=0;i<6;i++){
            int num= (int) (Math.random()*(codeSequence.length-1));
             code.append(codeSequence[num]);
        }
        return code.toString();
    }

}
