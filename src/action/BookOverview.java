package action;

/**
 * @author: Wray Zheng
 * @date: 2017-09-25
 * @description: TODO
 */
public class BookOverview {
	private String ISBN;
	private String title;
	private String publisher;
	private String publishDate;
	private String price;
	private String authorName;
	private String authorAge;
	private String authorCountry;
	
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public String getAuthorAge() {
		return authorAge;
	}
	public void setAuthorAge(String authorAge) {
		this.authorAge = authorAge;
	}
	public String getAuthorCountry() {
		return authorCountry;
	}
	public void setAuthorCountry(String authorCountry) {
		this.authorCountry = authorCountry;
	}
}
