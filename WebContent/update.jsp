<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>更新图书</title>
    </head>

    <body>
    	<s:set var="BO" value="#request.BookOverview" />
        <s:form id="form" method="post" namespace="/book" action="update" onsubmit="return loadXMLDoc(this)">
        	<s:textfield disabled="true" name="title" value="%{#BO.getTitle()}" label="书名"/>
        	<s:hidden name="title" value="%{#BO.getTitle()}"/>
        	<s:textfield id="authorID" name="authorID" value="%{#BO.getAuthorID()}" label="作者编号" required="true" pattern="[0-9]{1,9}"/>
        	<s:textfield name="publisher" value="%{#BO.getPublisher()}" label="出版社" required="true"/>
        	<s:textfield name="publishDate" value="%{#BO.getPublishDate()}" label="出版日期" required="true" pattern="[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])"/>
        	<s:textfield name="price" value="%{#BO.getPrice()}" label="价格" required="true" pattern="[0-9]+(\.[0-9]+)?"/>
        	<s:textfield disabled="true" name="ISBN" value="%{#BO.getISBN()}" label="ISBN"/>
        	<s:hidden name="ISBN" value="%{#BO.getISBN()}"/>
        	<s:submit value="更新"/>
        </s:form>
    </body>
    
	<script src="<s:url value='/js/ajax.js'/>"></script>
</html>