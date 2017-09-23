package com.scy.zhixing.common;

import java.util.HashMap;
import java.util.Map;
/**
 * 
 * @author wyf
 * @see 用于存放常量值
 */
public class AppCommon {
	
	public static Map<Integer,String> usertype=new HashMap<Integer,String>();
	public static Map<Integer,String> jxjsqzt=new HashMap<Integer,String>();
	public static Map<String,String> zblx=new HashMap<String,String>();
	public static String bzrid="46adea98f68e11e69b5e1c3947eb3247";
	static{
		usertype.put(0, "学生");
		usertype.put(1, "人员");
		
		jxjsqzt.put(1, "申请");
		jxjsqzt.put(2, "审核通过");
		jxjsqzt.put(3, "审核不通过");
		jxjsqzt.put(4, "评分完成");
		jxjsqzt.put(5, "终审完成");
		
		zblx.put("1", "自动评分");
		zblx.put("0", "手动评分");
	}
	
}
