<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Info</title>
    </head>

    <body>    
    	<s:iterator value="#request.BookOverview">
    		<p>书籍信息</p>
    		<ul>
        	<li>书名: <s:property value="title"/></li>
        	<li>出版社: <s:property value="publisher"/></li>
        	<li>出版年: <s:property value="publishDate"/></li>
        	<li>价格: <s:property value="price"/>元</li>
    		<li>ISBN: <s:property value="ISBN"/></li>
        	</ul>
        	<br />
        	<p>作者信息</p>
        	<ul>
        	<li>姓名: <s:property value="authorName"/></li>
        	<li>编号: <s:property value="authorID"/></li>
        	<li>年龄: <s:property value="authorAge"/></li>
        	<li>国籍: <s:property value="authorCountry"/></li>
        	</ul>
    	</s:iterator>
    </body>
</html>