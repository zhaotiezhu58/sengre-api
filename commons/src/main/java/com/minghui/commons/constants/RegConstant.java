package com.minghui.commons.constants;


import cn.hutool.core.util.IdcardUtil;

/**
 * 常用正则表达式
 */
public class RegConstant {

    /**
     * 手机号
     */
//    public static final String USER_PHONE_REG = "^[1][3,4,5,6,7,8][0-9]{9}$";
    public static final String USER_PHONE_REG = "^\\d{10}$";


    /**
     * 用户ID
     */
    public static final String USER_ID_REG = "^\\d{1,11}$";

    /**
     * 用户密码
     */
    //public static final String USER_PWD_REG = "^[a-zA-Z0-9]{6,12}$";
    public static final String USER_PWD_REG = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$";

    /**
     * 手机验证码
     */
    public static final String SMS_CODE_REG = "^\\d{6}$";

    /**
     * 提现密码
     */
    public static final String WITHDRAW_PWD_REG = "^\\d{4}$";

    public static void main(String[] args) {
        boolean validCard = IdcardUtil.isValidCard("500381199304224390");
        System.out.println(validCard);
    }
}
