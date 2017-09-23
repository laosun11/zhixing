package com.scy.zhixing.common.page;


public class MySQLDialect extends Dialect {
	
	public boolean supportsLimitOffset() {
		return true;
	}

	public boolean supportsLimit() {
		return true;
	}

	public String getLimitString(String sql, int firstRowIndex,
			String offsetPlaceholder, int rows, String limitPlaceholder) {
		if (firstRowIndex > 0) {
			return sql + " limit " + offsetPlaceholder + "," + limitPlaceholder;
		} else {
			return sql + " limit " + limitPlaceholder;
		}
	}
}
