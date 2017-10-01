package api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.*;

import io.DataIO;

/**
 * @author: Wray Zheng
 * @date: 2017-09-25
 * @description: 提供AJAX异步api接口，查询作者是否存在于数据库中
 */
public class Query extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/plain; charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        
		try {
			PrintWriter out = response.getWriter();
			
			String authorID = request.getParameter("authorid");
			if(authorID == null || "".equals(authorID)) out.print("false");
			else out.print(DataIO.existAuthor(Integer.valueOf(authorID)));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
