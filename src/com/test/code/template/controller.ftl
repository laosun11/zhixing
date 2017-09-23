package ${basePackage}.controller;
import ${basePackage}.pojo.${className};
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.wyf.jxjpdxt.common.page.Pager;
import ${basePackage}.service.I${className}Service;

@Controller
@RequestMapping(${className}Controller.PATH)
public class ${className}Controller{
    public static final String PATH = "${modPath}";
    @Autowired
	private I${className}Service service;
	
	@RequestMapping("list")
	public String list(Model m, Pager<${className}> page, @RequestParam Map<String, Object> params,
			HttpServletRequest request) {
		page=service.queryByPage(page, params);
		m.addAttribute("page", page);
		return PATH + "list";
	}
	
	@RequestMapping("goSave")
	public String goSave(HttpServletRequest request, Model m) {
		return PATH + "save";
	}
	
	@RequestMapping("save")
	@ResponseBody
	public Map<String, Object> save(@RequestBody ${className} vo, @RequestParam Map<String, Object> params,
			HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			service.save(vo);
			result.put("ok", true);
			result.put("msg", "操作成功");
		} catch (Exception e) {
			result.put("ok", false);
			result.put("msg", "操作失败!" + e.getMessage());
		}
		return result;
	}
	
	@RequestMapping("goUpdate")
	public String goUpdate(HttpServletRequest request, Model m, @RequestParam Map<String, Object> params) {
		m.addAttribute("vo", service.queryByParam(params));
		return PATH + "update";
	}
	
	@RequestMapping("update")
	@ResponseBody
	public Map<String, Object> update(@RequestBody ${className} vo, @RequestParam Map<String, Object> params,HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			service.update(vo);
			result.put("ok", true);
			result.put("msg", "操作成功");
		} catch (Exception e) {
			result.put("ok", false);
			result.put("msg", "操作失败!" + e.getMessage());
		}
		return result;
	}
	
	@RequestMapping("delete")
	@ResponseBody
	public Map<String, Object> delete( @RequestParam Map<String, Object> params,HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String id=(String)params.get("id");
			service.delete(id);
			result.put("ok", true);
			result.put("msg", "操作成功");
		} catch (Exception e) {
			result.put("ok", false);
			result.put("msg", "操作失败!" + e.getMessage());
		}
		return result;
	}
	
	@RequestMapping("view")
	public String view(Model m, @RequestParam Map<String, Object> params) {
		m.addAttribute("vo", service.queryByParam(params));
		return PATH + "view";
	}
}



