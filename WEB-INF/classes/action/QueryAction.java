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
	
	/* Ĭ�Ϲ��캯��
	 * ��û�д�����������������Ϊ�մ����������
	 */
	public QueryAction() {
		author = "";
		title = "";
		ISBN = "";
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/* �������ߺ�������ѯ�鼮
	 */
	public String query() {
		TreeMap<AuthorInfo, ArrayList<BookInfo>> result = DataIO.getBookInfo(author, title);
		if(result.isEmpty()) return ERROR;
		else {
			request.setAttribute("BookMap", result);
			return SUCCESS;
		}
	}
	
	/* ����ISBN��ѯĳ���鼰�����ߵ���ϸ��Ϣ
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
	
	/* ����ISBNɾ��ĳ����
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
