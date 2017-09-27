<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/meta.jsp" %>
        <title>添加图书</title>
<%@ include file="/include/header.jsp" %>
        <s:form id="form" method="post" namespace="/book" action="add" onsubmit="return submitWhenAuthorExists(this)">
        	<s:textfield name="title" label="书名" required="true"/>
        	<s:textfield id="authorID" name="authorID" label="作者编号" required="true" pattern="[0-9]{1,9}"/>
        	<s:textfield name="publisher" label="出版社" required="true"/>
        	<s:textfield name="publishDate" required="true" pattern="[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])" label="出版日期"/>
        	<s:textfield name="price" label="价格" required="true" pattern="[0-9]+(\.[0-9]+)?"/>
        	<s:textfield name="ISBN" label="ISBN" required="true" pattern="([0-9]+-){4}[0-9]"/>
        	<s:submit value="添加"/>
        </s:form>
    </body>

	<script src="<s:url value='/js/ajax.js'/>"></script>
</html>