package com.test.code;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.util.StringUtils;

/**
 * Description: 生成pojo 和 mybatis 配置文件 <br/>
 * Date: 2017-01-25 17:51:59 <br/>
 * 
 * @author wyf
 */
public class CodeGenerate {
	private static FreemarkerUtil fu = new FreemarkerUtil();;
	private static Map<String, Object> root = new HashMap<String, Object>();;
	// 生成文件的基本路径
	private static String baseDir = CodeConfig.get("baseDir");
	// 包的基本路径
	private static String basePackage = CodeConfig.get("basePackage");

	public static void toCode(String tabelName, List<Columns> cs, Map<String, Object> options) {
		root = new HashMap<String, Object>();
		root.put("list", cs);
		root.put("className", getClassName(tabelName));
		root.put("basePackage", basePackage);
		root.put("pojoName", getPojoName(tabelName));
		root.put("tableName", tabelName);

		String mod = (String) options.get("mod");// 模块
		String modPath = "";// 模块文件路径
		// 模块
		if (StringUtils.hasText(mod)) {
			modPath = "/" + mod.trim() + "/";
			mod = "." + mod;
		} else {
			mod = "";
			modPath = "/";
		}
		root.put("mod", mod);
		root.put("modPath", modPath);
		if (Boolean.valueOf((String) options.get("mapper"))) {
			fprint("sqlmapper.ftl", baseDir + CodeConfig.get("mapperDir"), getClassName(tabelName) + "Dao.xml");
		}
		if (Boolean.valueOf((String) options.get("pojo"))) {
			fprint("pojo.ftl", baseDir + CodeConfig.get("pojoDir"), getClassName(tabelName) + ".java");
		}
		if (Boolean.valueOf((String) options.get("dao"))) {
			fprint("dao.ftl", baseDir + CodeConfig.get("daoDir") , getClassName(tabelName) + "DAO.java");
		}
		if (Boolean.valueOf((String) options.get("service"))) {
			fprint("service.ftl", baseDir + CodeConfig.get("serviceDir") , getClassName(tabelName)
					+ "Service.java");
			fprint("Iservice.ftl", baseDir + CodeConfig.get("IserviceDir"), "I"+getClassName(tabelName)
					+ "Service.java");
		}
		if (Boolean.valueOf((String) options.get("controller"))) {
			fprint("controller.ftl", baseDir + CodeConfig.get("actionDir"), getClassName(tabelName)
					+ "Controller.java");
		}
		if (Boolean.valueOf((String) options.get("jsp"))) {
			fprint("jsp/list.ftl",
					baseDir + CodeConfig.get("jspDir") + modPath, "list.jsp");
			fprint("jsp/update.ftl", baseDir + CodeConfig.get("jspDir") + modPath
					, "update.jsp");
			fprint("jsp/save.ftl",
					baseDir + CodeConfig.get("jspDir") + modPath , "save.jsp");
			fprint("jsp/view.ftl",
					baseDir + CodeConfig.get("jspDir") + modPath , "view.jsp");
			fprint("jsp/js.ftl", baseDir + CodeConfig.get("jspDir") + modPath ,
					getClassName(tabelName).toLowerCase() + ".js");
		}
	}

	public static List<Columns> getTableInfo(JdbcTemplate jdbc, String tableName) {
		String sql = CodeConfig.get("sql_" + CodeConfig.get("db_name"));
		List<Columns> list = jdbc.query(sql, new Object[] { tableName }, new RowMapper<Columns>() {
			@Override
			public Columns mapRow(ResultSet rs, int i) throws SQLException {
				String columnName = rs.getString(2);
				Columns c = new Columns(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), null == rs
						.getString(5) ? "" : rs.getString(5), toBeanLabel(columnName));
				return c;
			}
		});
		return list;
	}

	private static String getClassName(String tableName) {
		String temp = toBeanLabel(tableName);
		return temp.substring(0, 1).toUpperCase() + temp.substring(1);
	}

	private static String getPojoName(String tableName) {
		return toBeanLabel(tableName);
	}

	public static String toBeanLabel(String columnName) {
		String[] labels = columnName.split("_");
		StringBuffer beanLable = new StringBuffer();
		int i = 0;
		for (String s : labels) {
			if (i != 0) {
				beanLable.append(String.valueOf(s.charAt(0)).toUpperCase()).append(s.substring(1).toLowerCase());
			} else {
				beanLable.append(s.toLowerCase());
			}
			i++;
		}
		return beanLable.toString();
	}

	private static void sprint(String name) {
		fu.print(name, root);
	}

	private static void fprint(String templateName, String baseDir, String outFileName) {
		File f = new File(baseDir);
		if (!f.exists()) {
			f.mkdirs();
		}

		fu.fprint(templateName, root, baseDir, outFileName);
	}

	public static Map<String, String> getCode(String pojoName, List<Columns> cs, Map<String, Object> options) {

		Map<String, String> result = new HashMap<String, String>();

		root = new HashMap<String, Object>();
		root.put("list", cs);
		root.put("className", pojoName);
		root.put("basePackage", basePackage);
		root.put("pojoName", pojoName);
		root.put("tableName", pojoName);

		String mod = (String) options.get("mod");// 模块
		String modPath = "";// 模块文件路径
		// 模块
		if (StringUtils.hasText(mod)) {
			modPath = "/" + mod.trim() + "/";
			mod = "." + mod;
		} else {
			mod = "";
			modPath = "/";
		}
		root.put("mod", mod);
		root.put("modPath", modPath);
		if (Boolean.valueOf((String) options.get("mapper"))) {
			result.put("mapper", fu.printString("sqlmapper.ftl", root));
		}
		if (Boolean.valueOf((String) options.get("pojo"))) {
			result.put("pojo", fu.printString("pojo.ftl", root));
		}
		return result;

	}

}