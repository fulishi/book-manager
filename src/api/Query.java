package api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.*;

import io.DataIO;

/**
 * @author: Wray Zheng
 * @date: 2017-09-25
 * @description: �ṩAJAX�첽api�ӿڣ���ѯ�����Ƿ���������ݿ���
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
