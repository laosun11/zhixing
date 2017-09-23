package com.scy.zhixing.common.page;
/**
 * 
 * @author dialect
 *
 */
public class PostgreSQLDialect extends Dialect {

	public boolean supportsLimitOffset() {
		return true;
	}

	public boolean supportsLimit() {
		return true;
	}

	public String getLimitString(String sql, int firstRowIndex, String offsetPlaceholder, int rows,
			String limitPlaceholder) {
		// select * from persons limit 5 offset 0 ;起点0开始查询，返回5条数据
		// ( 同 select * from persons limit 5 ) 
		if (firstRowIndex > 0) {
			return sql + " limit " + limitPlaceholder + "offset" + offsetPlaceholder;
		} else {
			return sql + " limit " + limitPlaceholder;
		}
	}
}
