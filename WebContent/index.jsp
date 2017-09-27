<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/meta.jsp" %>
        <title>图书查询</title>
<%@ include file="/include/header.jsp" %>
    <div class="jumbotron">
    <div class="container">
        <s:form method="get" namespace="/book" action="query">
        	<s:textfield name="author" label="作者" />
        	<s:textfield name="title" label="书名" placeholder="(可选)"/>
        	<s:submit value="查询" />
        </s:form>
		<p><a href="add.jsp">添加书籍</a></p>
	</div>
	</div>
    </body>
</html>