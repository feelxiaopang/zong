package com.DearBaby.www.tester;

/**
 * Created by liaodan on 2017/4/24.
 */


import com.DearBaby.www.tools.Encryption;
import com.DearBaby.www.tools.RandomCode;
import org.testng.annotations.Test;

/**
 * 存放测试类和测试方法，用于开发过程中可能会用到的测试
 */
public class TestDemo {

    @Test
    public void test() {
       String str = "12345678990";

       String str1 = str.replaceAll(str.substring(3,7),"****");
        System.out.print(str1);
    }
}
