<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Books</title>
    </head>

    <body>
    	<s:set var="queryTitle" value="title" />
    	<s:set var="queryAuthor" value="author" />
    	<s:iterator value="#request.Books">
    		<s:url action="detail" var="detailAction">
    			<s:param name="ISBN" value="ISBN" />
    		</s:url>
    		<s:url action="detail" var="toUpdateAction" escapeAmp="false">
    			<s:param name="ISBN" value="ISBN" />
    			<s:param name="update" value="true" />
    		</s:url>
    		<s:url action="delete" var="deleteAction" escapeAmp="false">
    			<s:param name="ISBN" value="ISBN" />
    			<s:param name="author" value="queryAuthor" />
    			<s:param name="title" value="queryTitle" />
    		</s:url>
    		<span><a href="<s:property value='detailAction'/>"><s:property value="title"/></a></span>
    		<span><a href="<s:property value='toUpdateAction'/>">编辑</a></span>
    		<span><a href="<s:property value='deleteAction'/>">删除</a></span>
    		<br />
    	</s:iterator>
    </body>
</html>