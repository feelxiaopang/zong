package xyz.next.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import xyz.next.dao.PagesDao;
import xyz.next.dao.impl.PagesDaoImpl;
import xyz.next.model.Pages;
import xyz.next.model.Users;

public class PageAction extends ActionSupport{
	//当前页
		private int currentPage;
		
		
		public int getCurrentPage() {
			return currentPage;
		}


		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}

		@Override
		public String execute() throws Exception {
			
			Pages pages = new Pages();
			
			PagesDao pd = new PagesDaoImpl();
			
			Map<String,Object> session = (Map<String, Object>) ActionContext.getContext().get("session");
			//获取总条数
			pages.setCount(pd.cout());
			//计算总页数
			pages.setTotal((int)Math.ceil(pages.getCount()/5.0));
			if(currentPage<=0){
				currentPage=1;
			}else if(currentPage>pages.getTotal()){
				currentPage=pages.getTotal();
			}
			session.put("currentPage", currentPage);
			List<Users> list = pd.page(currentPage);
			for (Users users : list) {
				System.out.println(users);
			}
			session.put("total", pages.getTotal());
			session.put("list", list);
			return "success";
		}

		
		
}
