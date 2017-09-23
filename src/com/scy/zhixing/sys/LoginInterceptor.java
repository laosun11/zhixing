package com.scy.zhixing.sys;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.scy.zhixing.common.MySessionContext;

/**
 * Description: 登入时拦截 <br/>
 * Date:     2017年1月4日 下午1:42:42 <br/>
 * @author   wyf	 
 */
public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
		//获取请求的URL  
        String url = request.getRequestURI();  
        if(url.indexOf("login.do")>=0 ||(url.indexOf("login1.do")>=0)){  
            return true;  
        }  
        String sid = request.getParameter("sid");
        /*//获取Session  
        HttpSession session = request.getSession();  */
      //获取Session  
        HttpSession session =null;
        if (sid == null || sid.trim().equals("")) { 
        	session = request.getSession();
        } else {  
            MySessionContext myc = MySessionContext.getInstance();  
            session = myc.getSession(sid);  
        } 

       /* TSSysUserinf user = (TSSysUserinf)session.getAttribute("user");  
        if(user != null){
        	//检测是否访问的菜单没在访问权限内
        	List<TSSysMenu> menulist = (List<TSSysMenu>) session.getAttribute("nomenu");
        	boolean flag=true;
        	for (TSSysMenu tsSysMenu : menulist) {
				if((tsSysMenu.getLink()!=null && !"".equals(tsSysMenu.getLink())) && url.indexOf(tsSysMenu.getLink())>=0){
					flag=false;
				}
			}
        	if(!flag){
        		response.sendRedirect(basePath+"error/noaccess.jsp");;
                return false; 
        	}
        	
            return true;  
        }  */
        response.sendRedirect(basePath+"login/login1.do");;
        return false;  
	}
}

