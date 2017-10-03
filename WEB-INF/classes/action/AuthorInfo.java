package action;

/**
 * @author: Wray Zheng
 * @date: 2017-09-30
 * @description: 存储作者和编号，用作HashMap的键
 */
public class AuthorInfo implements Comparable<AuthorInfo>{
	private int authorID;
	private String author;
	
	public AuthorInfo(int authorID, String author) {
		this.authorID = authorID;
		this.author = author;
	}

	@Override
	public int compareTo(AuthorInfo authorInfo) {
		return authorID - authorInfo.getAuthorID();
	}
	
	public int getAuthorID() {
		return authorID;
	}
	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
}
