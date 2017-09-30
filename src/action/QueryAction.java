package action;

import java.util.ArrayList;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import io.DataIO;

/**
 * @author: Wray Zheng
 * @date: 2017-09-22
 * @description: TODO
 */
public class QueryAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String author;
	private String title;
	private String ISBN;
	private boolean update;

	HttpServletRequest request = ServletActionContext.getRequest();
	
	/* 默认构造函数
	 * 将没有传入参数的情况按参数为空串的情况处理
	 */
	public QueryAction() {
		author = "";
		title = "";
		ISBN = "";
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/* 根据作者和书名查询书籍
	 */
	public String query() {
		TreeMap<AuthorInfo, ArrayList<BookInfo>> result = DataIO.getBookInfo(author, title);
		if(result.isEmpty()) return ERROR;
		else {
			request.setAttribute("BookMap", result);
			return SUCCESS;
		}
	}
	
	/* 根据ISBN查询某本书及其作者的详细信息
	 */
	public String detail() {
		BookOverview result = DataIO.getBookOverview(ISBN);
		if(result != null) {
			request.setAttribute("BookOverview", result);
			if(update) return INPUT;
			else return SUCCESS;
		}
		else return ERROR;
	}
	
	/* 根据ISBN删除某本书
	 */
	public String delete() {
		if(DataIO.deleteBook(ISBN))
			return SUCCESS;
		else return ERROR;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String ISBN) {
		this.ISBN = ISBN;
	}

	public boolean isUpdate() {
		return update;
	}

	public void setUpdate(boolean update) {
		this.update = update;
	}
	
}
