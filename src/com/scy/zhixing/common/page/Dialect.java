package com.scy.zhixing.common.page;

public abstract class Dialect {
	public boolean supportsLimit() {
		return false;
	}

	public boolean supportsLimitOffset() {
		return supportsLimit();
	}

	/**
	 * 将sql变成分页sql语句,直接使用firstRowIndex,rows的值作为占位符.</br> 源代码为:
	 * getLimitString(sql,firstRowIndex
	 * ,String.valueOf(firstRowIndex),rows,String.valueOf(rows))
	 */
	public String getLimitString(String sql, int firstRowIndex, int rows) {
		return getLimitString(sql, firstRowIndex, Integer.toString(firstRowIndex), rows,
				Integer.toString(rows));
	}

	/**
	 * 将sql变成分页sql语句,提供将firstRowIndex及rows使用占位符(placeholder)替换.
	 * 
	 * <pre>
	 * 如mysql
	 * dialect.getLimitString("select * from user", 12, ":firstRowIndex",0,":rows") 将返回
	 * select * from user limit :firstRowIndex,:rows
	 * </pre>
	 * 
	 * @return 包含占位符的分页sql
	 */
	public abstract String getLimitString(String sql, int firstRowIndex,
			String offsetPlaceholder, int rows, String limitPlaceholder);
	
	
	
	
}
