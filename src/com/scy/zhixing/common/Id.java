package com.scy.zhixing.common;

import java.util.UUID;

public class Id {
	public static String getId(){
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	public static void main(String[] args) {
		String id=getId();
		System.out.println(id.length());
	}
}
