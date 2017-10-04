<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/meta.jsp" %>
        <title>作者信息</title>
<%@ include file="/include/header.jsp" %>  
	<div class="content">
	<div class="container">
        <div class="panel panel-default">
        	<div class="panel-heading">作者信息</div>
        	<div class="panel-body">
        	<ul>
        	<li>姓名: <s:property value="author"/></li>
        	<li>编号: <s:property value="authorID"/></li>
        	<li>年龄: <s:property value="age"/></li>
        	<li>国籍: <s:property value="country"/></li>
        	</ul>
        	</div>
    	</div>
	</div>
    	<%@ include file="/include/footer.jsp" %>
	</div>
    </body>
</html>