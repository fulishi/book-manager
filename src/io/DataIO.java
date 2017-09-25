package io;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import action.BookInfo;
import action.BookOverview;

/**
 * @author: Wray Zheng
 * @date: 2017-09-22
 * @description: ��װ���ݿ��CRUD����
 */
public class DataIO {
	/* ��ȡͼ�����
	 * ͨ�������Լ����ֱ����ѯͼ�飬��������������ͼ������б�
	 */
	public static ArrayList<BookInfo> getBookInfo(String author, String title) {
		String sqlSelect = "SELECT ISBN, Title FROM Book WHERE title LIKE ?";
		String sqlSelectWithAuthor = "SELECT ISBN, Title FROM Book WHERE AuthorID IN\n"
						+ "(SELECT AuthorID FROM Author WHERE Name = ?)\n"
						+ "AND title LIKE ?";
		
		ArrayList<BookInfo> result = new ArrayList<BookInfo>();
		String targetStatement = "".equals(author) ? sqlSelect : sqlSelectWithAuthor;
		
		try {
			PreparedStatement psQuery = DatabaseHelper.getConnection().prepareStatement(targetStatement);
			if("".equals(author)) psQuery.setString(1, '%'+title+'%');
			else {
				psQuery.setString(1, author);
				psQuery.setString(2, '%'+title+'%');
			}
			
			ResultSet rs = psQuery.executeQuery();
			while(rs.next()) {
				result.add(new BookInfo(rs.getString("ISBN"), rs.getString("Title")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* ����ISBN��ȡͼ������ߵ���Ϣ
	 * ��ѯ�ɹ���������ص�����
	 * ��ѯʧ�ܣ�����null
	 */
	public static BookOverview getBookOverview(String ISBN) {
		String sqlSelect = "SELECT * FROM Book, Author where Book.ISBN=? AND Book.AuthorID=Author.AuthorID";
		BookOverview result = null;
		
		try {
			PreparedStatement psQuery = DatabaseHelper.getConnection().prepareStatement(sqlSelect);
			psQuery.setString(1, ISBN);
			ResultSet rs = psQuery.executeQuery();
			if(rs.next()) {
				result = new BookOverview();
				result.setISBN(rs.getString("Book.ISBN"));
				result.setTitle(rs.getString("Book.Title"));
				result.setPublisher(rs.getString("Book.Publisher"));
				result.setPublishDate(rs.getString("Book.PublishDate"));
				result.setPrice(rs.getString("Book.Price"));
				result.setAuthorName(rs.getString("Author.Name"));
				result.setAuthorAge(rs.getString("Author.Age"));
				result.setAuthorCountry(rs.getString("Author.Country"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
	
	
	/* ����ISBNɾ��ͼ���¼
	 * �ɹ�����true��ʧ�ܷ���false
	 */
	public static boolean deleteBook(String ISBN) {
		String sqlDelete = "DELETE FROM Book where ISBN=?";
		
		try {
			PreparedStatement psDelete = DatabaseHelper.getConnection().prepareStatement(sqlDelete);
			psDelete.setString(1, ISBN);
			int result = psDelete.executeUpdate();
			if(result == 0) return false;
			else return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
