package io;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeMap;

import action.AuthorInfo;
import action.BookInfo;
import action.BookOverview;

/**
 * @author: Wray Zheng
 * @date: 2017-09-22
 * @description: 封装数据库的CRUD操作
 */
public class DataIO {
	/* 获取图书标题
	 * 通过作者以及部分标题查询图书，返回满足条件的图书标题列表
	 */
	public static TreeMap<AuthorInfo, ArrayList<BookInfo>> getBookInfo(String author, String title) {
		String sqlSelect = "SELECT A.AuthorID, A.Name, B.Title, B.ISBN FROM Author as A, Book as B\n"
				+ "WHERE A.AuthorID=B.AuthorID AND B.Title LIKE ?";
		String sqlSelectByAuthor = sqlSelect + " AND A.Name=?";
		
		TreeMap<AuthorInfo, ArrayList<BookInfo>> result = new TreeMap<AuthorInfo, ArrayList<BookInfo>>();
		String targetStatement = "".equals(author) ? sqlSelect : sqlSelectByAuthor;
		
		try {
			PreparedStatement psQuery = DatabaseHelper.getConnection().prepareStatement(targetStatement);
			psQuery.setString(1, "%"+title+"%");
			if(!"".equals(author)) psQuery.setString(2, author);
			
			ResultSet rs = psQuery.executeQuery();
			AuthorInfo authorInfo;
			BookInfo bookInfo;
			ArrayList<BookInfo> bookInfoList;
			while(rs.next()) {
				authorInfo = new AuthorInfo(rs.getInt("A.AuthorID"), rs.getString("A.Name"));
				bookInfo = new BookInfo(rs.getString("B.ISBN"), rs.getString("B.Title"));
				bookInfoList = result.get(authorInfo);
				if(bookInfoList == null) {
					bookInfoList = new ArrayList<BookInfo>();
					result.put(authorInfo, bookInfoList);
				}
				bookInfoList.add(bookInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* 根据ISBN获取图书和作者的信息
	 * 查询成功：返回相关的数据
	 * 查询失败：返回null
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
				result.setPrice(rs.getFloat("Book.Price"));
				result.setAuthorName(rs.getString("Author.Name"));
				result.setAuthorID(rs.getInt("Author.AuthorID"));
				result.setAuthorAge(rs.getInt("Author.Age"));
				result.setAuthorCountry(rs.getString("Author.Country"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
	
	
	/* 根据ISBN删除图书记录
	 * 成功返回true，失败返回false
	 */
	public static boolean deleteBook(String ISBN) {
		String sqlDelete = "DELETE FROM Book where ISBN=?";
		
		try {
			PreparedStatement psDelete = DatabaseHelper.getConnection().prepareStatement(sqlDelete);
			psDelete.setString(1, ISBN);
			int result = psDelete.executeUpdate();
			if(result > 0) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	/* 查询作者是否存在于数据库中
	 */
	public static boolean existAuthor(int authorID) {
		String sqlSelect = "SELECT * FROM Author WHERE AuthorID=?";
		try {
			PreparedStatement qsQuery = DatabaseHelper.getConnection().prepareStatement(sqlSelect);
			qsQuery.setInt(1, authorID);
			return qsQuery.executeQuery().next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	/* 添加图书信息
	 */
	public static boolean add(String title, int authorID, String publisher, String publishDate,
			float price, String ISBN) {
		String sqlInsert = "INSERT INTO Book (ISBN, Title, AuthorID, Publisher, PublishDate, Price)\n"
				+ "VALUES (?,?,?,?,?,?)";
		try {			
			PreparedStatement psInsert = DatabaseHelper.getConnection().prepareStatement(sqlInsert);
			psInsert.setString(1, ISBN);
			psInsert.setString(2, title);
			psInsert.setInt(3, authorID);
			psInsert.setString(4, publisher);
			psInsert.setString(5, publishDate);
			psInsert.setFloat(6, price);
			int result = psInsert.executeUpdate();
			if(result > 0) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	/* 更新图书信息
	 */
	public static boolean update(int authorID, String publisher, String publishDate,
			float price, String ISBN) {
		String sqlUpdate = "UPDATE Book SET AuthorID=?, Publisher=?, PublishDate=?, Price=?\n"
				+ "WHERE ISBN=?";
		try {			
			PreparedStatement psUpdate = DatabaseHelper.getConnection().prepareStatement(sqlUpdate);
			psUpdate.setInt(1, authorID);
			psUpdate.setString(2, publisher);
			psUpdate.setString(3, publishDate);
			psUpdate.setFloat(4, price);
			psUpdate.setString(5, ISBN);
			int result = psUpdate.executeUpdate();
			if(result > 0) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	/* 添加作者信息
	 */
	public static boolean addAuthor(String author, int authorID, int age, String country) {
		String sqlInsert = "INSERT INTO Author (Name, AuthorID, Age, Country) VALUES (?,?,?,?)";
		
		try {
			PreparedStatement psInsert = DatabaseHelper.getConnection().prepareStatement(sqlInsert);
			psInsert.setString(1, author);
			psInsert.setInt(2, authorID);
			psInsert.setInt(3, age);
			psInsert.setString(4, country);
			int result = psInsert.executeUpdate();
			if(result > 0) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
