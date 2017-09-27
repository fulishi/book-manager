<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>图书查询</title>
    </head>

    <body>
        <s:form method="get" namespace="/book" action="query">
        	<s:textfield name="author" label="作者" />
        	<s:textfield name="title" label="书名" placeholder="(可选)"/>
        	<s:submit value="查询" />
        </s:form>
		<p><a href="add.jsp">添加书籍</a></p>
    </body>
</html>