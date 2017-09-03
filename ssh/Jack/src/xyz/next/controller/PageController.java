package xyz.next.controller;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import xyz.next.dao.PagesDao;
import xyz.next.dao.impl.PagesDaoImpl;
import xyz.next.model.Pages;
import xyz.next.model.Users;
import xyz.next.servers.PagesServers;

@SuppressWarnings("serial")
@ParentPackage("struts-default")
@Namespace("/")
@Results(value={
		@Result(name="boss",location="/views/boss.jsp"),
})
/**
 * 分页
 * @author Administrator
 *
 */
public class PageController extends ActionSupport{
	@Autowired
	private PagesServers pagesServers;
	//当前页
	private  int currentPage;

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	@Action(value="paged")
	public String limits(){
		Pages page = new Pages();
		Map<String,Object> session = (Map<String, Object>) ActionContext.getContext().get("session");
		//获取总条数
		page.setCount(pagesServers.count());
		//计算总页数
		page.setTotal((int)Math.ceil(page.getCount()/5.0));
		if(currentPage<=0){
			currentPage=1;
		}else if(currentPage>page.getTotal()){
			currentPage=page.getTotal();
		}
		session.put("currentPage", currentPage);
		List<Users> list = pagesServers.findPage(currentPage);
		session.put("list", list);
		session.put("total", page.getTotal());
		return "boss";
	}
}

