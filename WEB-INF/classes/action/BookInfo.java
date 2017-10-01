package action;

/**
 * @author: Wray Zheng
 * @date: 2017-09-24
 * @description: 存储书名和ID，以便生成URL
 */
public class BookInfo {
	private String ISBN;
	private String title;
	
	public BookInfo(String ISBN, String title) {
		this.ISBN = ISBN;
		this.title = title;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
