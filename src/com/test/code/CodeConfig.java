package com.test.code;

import java.io.IOException;
import java.util.Properties;

/**代码生成的基本配置
 * @author wyf
 */
public final class CodeConfig {
	private static Properties p = new Properties();
	static {
		try {
			p.load(CodeConfig.class.getResourceAsStream("/code.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static String get(String key) {
		return p.getProperty(key);
	}

	public static String get(String key, String defaultValue) {
		return p.getProperty(key, defaultValue);
	}

}
