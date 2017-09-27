<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>添加作者</title>
    </head>

    <body>
        <s:form id="form" method="post" action="addAuthor" onsubmit="return submitWhenAuthorNotExists(this)">
        	<s:textfield name="author" label="作者" required="true"/>
        	<s:textfield name="authorID" label="编号" required="true" pattern="[0-9]{1,9}"/>
        	<s:textfield name="age" label="年龄" required="true" pattern="\d+"/>
        	<s:textfield name="country" label="国籍" required="true"/>
        	<s:submit value="添加"/>
        </s:form>
    </body>
    
    <script src="<s:url value='/js/ajax.js'/>"></script>
</html>