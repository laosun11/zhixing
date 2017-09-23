package com.scy.zhixing.common.page;

import java.io.IOException;
import java.util.Properties;

/**
 * 
 * @author wyf
 *
 */
public final class DialectFactory {
	private static String dbName="MYSQL";
	static {
//		Properties p = new Properties();
//		try {
//			p.load(DialectFactory.class.getResourceAsStream("/config/config-jdbc.properties"));
//			dbName=p.getProperty("db.name");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
	}

	public final static Dialect getDialect(String key) {
		key = key.toUpperCase();
		if ("MYSQL".equals(key)) {
			return new MySQLDialect();
		} else if ("ORACLE".equals(key)) {
			return new OracleDialect();
		} else if ("POSTGRESQLDIALECT".equals(key)) {
			return new PostgreSQLDialect();
		}
		return null;
	}

	public final static Dialect getDialect() {
		return getDialect(dbName);
	}

	private DialectFactory() {
	}
}
