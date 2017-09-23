package com.test.code;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Locale;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FreemarkerUtil {
	// getTemplate("01.ftl")
	public Template getTemplate(String name) {
		try {
			// 通过Freemaker的Configuration读取相应的ftl
			Configuration cfg = new Configuration();
			cfg.setEncoding(Locale.getDefault(), "utf-8");
			// 设定去哪里读取相应的ftl模板文件
			cfg.setClassForTemplateLoading(this.getClass(), CodeConfig.get("templateDir"));
			// 在模板文件目录中找到名称为name的文件
			Template temp = cfg.getTemplate(name);
			return temp;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void print(String name, Map<String, Object> root) {
		try {
			// 通过Template可以将模板文件输出到相应的流
			Template temp = this.getTemplate(name);
			temp.process(root, new PrintWriter(System.out));
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String printString(String name, Map<String, Object> root) {
		try {
			// 通过Template可以将模板文件输出到相应的流
			StringWriter sw = new StringWriter();
			Template temp = this.getTemplate(name);
			temp.process(root, new PrintWriter(sw));
			return sw.toString();
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void fprint(String name, Map<String, Object> root, String baseDir, String outFile) {
		//FileWriter out = null;
		OutputStreamWriter out=null;
		try {
			// String
			// dir="D:/javawork/work20130506/test/src/main/resources/ftl/out/";
			// String dir="D:/java/work20140921/stock/doc/20141202/";

			// 通过一个文件输出流，就可以写到相应的文件中
			//out = new FileWriter(new File(baseDir, outFile));
			out = new OutputStreamWriter(new FileOutputStream(new File(baseDir, outFile)),"UTF-8");
			Template temp = this.getTemplate(name);
			temp.process(root, out);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null)
					out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
