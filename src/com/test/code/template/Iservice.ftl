package ${basePackage}.service;

import java.util.Map;
import ${basePackage}.pojo.${className};
import com.wyf.jxjpdxt.common.page.Pager;


public interface I${className}Service {
   
	Pager<${className}> queryByPage(Pager<${className}> page, Map<String, Object> params) ;
	/**
	保存
	*/
	void save(${className} vo);
	/**
	修改
	*/
	void update(${className} vo);
	
	${className} queryByParam(Map<String, Object> params);
	
	public void delete(String id) ;
}



