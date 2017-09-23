package ${basePackage}.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ${basePackage}.dao.${className}DAO;
import ${basePackage}.pojo.${className};
import ${basePackage}.service.I${className}Service;
import com.wyf.jxjpdxt.common.page.Pager;

@Service
public class ${className}Service implements I${className}Service{
    @Autowired
	private ${className}DAO dao;
	/**
	分页查询
	*/
	public Pager<${className}> queryByPage(Pager<${className}> page, Map<String, Object> params) {
		List<${className}> list = dao.queryByPage(params, page.getStart(), page.getPageSize());
		long count = dao.queryRowCount(params);
		
		/* 如果发现没有返回数据
		 * 必须显示 new 一个pager 对象 并返回,
		 * 在面向soa的服务化改造是
		 * dubbo的远程调用不能通过引用来获取对象,他们不在同一个虚拟机里
		 */
		page = new Pager<${className}>(page);
		page.setList(list).setCount(count);
		return page;
	}
	/**
	保存
	*/
	public void save(${className} vo) {
		dao.save(vo);
	}
	/**
	修改
	*/
	public void update(${className} vo) {
		dao.update(vo);
	}
	
	public ${className} queryByParam(Map<String, Object> params) {
		return dao.queryByParam(params);
	}
	
	/**
	删除
	*/
	public void delete(String id) {
		dao.delete(id);
	}
}



