package com.scy.zhixing.common;

import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Plugin;

public abstract class MyBatisInterceptor implements Interceptor{
	protected static final int MAPPED_STATEMENT_INDEX = 0;
	protected static final int PARAMETER_INDEX = 1;
	
	@Override
	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}
}
