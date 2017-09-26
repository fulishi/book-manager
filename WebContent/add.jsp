<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>添加图书</title>
    </head>

    <body>
        <s:form method="post" namespace="/book" action="add">
        	<s:textfield name="title" label="书名"/>
        	<s:textfield name="author" label="作者"/>
        	<s:textfield name="publisher" label="出版社"/>
        	<s:textfield name="publishDate" label="出版年"/>
        	<s:textfield name="price" label="价格"/>
        	<s:textfield name="ISBN" label="ISBN"/>
        	<s:submit value="提交"/>
        </s:form>
    </body>
</html>