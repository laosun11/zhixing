package ${basePackage}.pojo;
import java.io.Serializable;
import java.util.Date;
//tablename:${tableName}
public class ${className} implements Serializable{
	private static final long serialVersionUID = 1L;
	
	<#list list as item>
	private ${item.javaType} ${item.beanLable};   //${item.comments}
	</#list>
	
	<#list list as item>
	public ${item.javaType} get${item.beanLableForGetSet}() {
            return ${item.beanLable};
	}
	
	public void set${item.beanLableForGetSet}(${item.javaType} ${item.beanLable}) {
		this.${item.beanLable} = ${item.beanLable};
	}
    </#list>
	
        
}