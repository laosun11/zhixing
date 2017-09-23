package com.test.code;

import java.io.Serializable;

/**  
 * @Description TODO
 * @author  wyf
 * @date 2017-01-25 17:52:16
 */
public class Columns implements Serializable{
	private Integer  columnId;
	private Integer  dataPrecision;
	private String   dataType;
	private String   comments;
	
	private String columnName;
	private String beanLable;
	private String beanLableForGetSet;
	private String javaType;
	
	
	
	
	public Columns(Integer columnId, String columnName,Integer dataPrecision, String dataType,
			String comments,  String beanLable) {
		this.columnId = columnId;
		this.dataPrecision = dataPrecision;
		this.dataType = dataType;
		this.comments = comments;
		this.columnName = columnName;
		this.beanLable = beanLable;
		this.beanLableForGetSet=this.beanLable.substring(0,1).toUpperCase()+this.beanLable.substring(1, this.beanLable.length());
		if(this.dataType.indexOf("CHAR") >0 ||this.dataType.indexOf("CLOB") >0){
			this.javaType="String";
		}else if (this.dataType.equals("DATE") ||this.dataType.equals("TIMESTAMP")){
			this.javaType="Date";
		}else if (this.dataType.equals("NUMBER")&& 0 ==this.dataPrecision){
			this.javaType="Double";
		}else if (this.dataType.equals("NUMBER")&& 0 !=this.dataPrecision){
			this.javaType="Integer";
		}else if (this.dataType.indexOf("BLOB")>0){
			this.javaType="byte[]";
		}else if (this.dataType.equals("varchar")){
			this.javaType="String";
		}else if (this.dataType.equals("int")){
			this.javaType="Integer";
		}else if (this.dataType.equals("date")){
			this.javaType="Date";
		}
		else{
			this.javaType=this.dataType;
		}
	}

	public Columns(String columnName, String beanLable) {
		this.columnName = columnName;
		this.beanLable = beanLable;
	}
	
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public String getBeanLable() {
		return beanLable;
	}
	public void setBeanLable(String beanLable) {
		this.beanLable = beanLable;
		this.beanLableForGetSet=this.beanLable.substring(0,1).toUpperCase()+this.beanLable.substring(1, this.beanLable.length());
	}
	public Integer getColumnId() {
		return columnId;
	}
	public void setColumnId(Integer columnId) {
		this.columnId = columnId;
	}
	public Integer getDataPrecision() {
		return dataPrecision;
	}
	public void setDataPrecision(Integer dataPrecision) {
		this.dataPrecision = dataPrecision;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public String getComments() {
		if(null==comments || "".equals(comments.trim())){
			return getBeanLable();
		}
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getBeanLableForGetSet() {
		return beanLableForGetSet;
	}

	public String getJavaType() {
		return javaType;
	}

	public void setJavaType(String javaType) {
		this.javaType = javaType;
	}

	
	
	
	

}
