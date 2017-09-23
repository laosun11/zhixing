package ${basePackage}.dao;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import ${basePackage}.pojo.${className};
import com.wyf.jxjpdxt.annotation.AnnotationDAO;

@AnnotationDAO
public interface ${className}DAO{
	List<${className}> queryByPage(@Param("params")Map<String, Object> params,@Param("firstRowIndex")int offset, @Param("rows")int limits) ;
	/**
	保存
	*/
	int save(${className} vo);
	/**
	修改
	*/
	int update(${className} vo);
	
	${className} queryByParam(@Param("params")Map<String, Object> params);
	
	long queryRowCount(@Param("params")Map<String, Object> params);
	
	int delete(String id);
}



