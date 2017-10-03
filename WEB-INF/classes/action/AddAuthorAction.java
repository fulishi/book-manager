package action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import io.DataIO;

/**
 * @author: Wray Zheng
 * @date: 2017-09-27
 * @description: 添加作者信息
 */
public class AddAuthorAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	private String author;
	private int authorID;
	private int age;
	private String country;

	HttpServletRequest request = ServletActionContext.getRequest();

	@Override
	public String execute() {
		if(DataIO.addAuthor(author, authorID, age, country))
			return SUCCESS;
		else {
			request.setAttribute("errorMsg", "对不起，添加作者信息失败！");
			return ERROR;
		}
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getAuthorID() {
		return authorID;
	}

	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
