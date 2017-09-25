package action;

import java.util.ArrayList;

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

	HttpServletRequest request = ServletActionContext.getRequest();
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/* 根据作者和书名查询书籍
	 */
	public String query() {
		ArrayList<BookInfo> result = DataIO.getBookInfo(author, title);
		if(result.isEmpty()) return ERROR;
		else {
			request.setAttribute("Books", result);
			return SUCCESS;
		}
	}
	
	/* 根据ISBN查询某本书及其作者的详细信息
	 */
	public String detail() {
		BookOverview result = DataIO.getBookOverview(ISBN);
		if(result != null) {
			request.setAttribute("BookOverview", result);
			return SUCCESS;
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

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
}
