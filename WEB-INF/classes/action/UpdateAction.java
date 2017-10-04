package action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import io.DataIO;

/**
 * @author: Wray Zheng
 * @date: 2017-09-26
 * @description: 添加、删除和更新图书信息
 */
public class UpdateAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String title;
	private String author;
	private int authorID;
	private String publisher;
	private String publishDate;
	private float price;
	private String ISBN;

	HttpServletRequest request = ServletActionContext.getRequest();

	public String add() {
		if(DataIO.add(title, authorID, publisher, publishDate, price, ISBN))
			return SUCCESS;
		else {
			request.setAttribute("errorMsg", "对不起，添加图书信息失败！");
			return ERROR;
		}
	}

	
	/* 根据ISBN删除某本书
	 */
	public String delete() {
		if(DataIO.deleteBook(ISBN))
			return SUCCESS;
		else {
			request.setAttribute("errorMsg", "对不起，删除图书信息失败！");
			return ERROR;
		}
	}
	
	
	public String update() {
		if(DataIO.update(authorID, publisher, publishDate, price, ISBN))
			return SUCCESS;
		else {
			request.setAttribute("errorMsg", "对不起，更新图书信息失败！");
			return ERROR;
		}
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author= author;
	}


	public int getAuthorID() {
		return authorID;
	}


	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}


	public String getPublisher() {
		return publisher;
	}


	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}


	public String getPublishDate() {
		return publishDate;
	}


	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}


	public float getPrice() {
		return price;
	}


	public void setPrice(float price) {
		this.price = price;
	}


	public String getISBN() {
		return ISBN;
	}


	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

}
