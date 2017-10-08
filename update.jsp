<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/meta.jsp" %>
        <title>更新图书</title>
<%@ include file="/include/header.jsp" %>  
	<div class="content">
	<div class="container">
		<div class="panel panel-default">
		<div class="panel-heading">更新图书</div>
    	<s:set value="#request.BookOverview" var="bo" />
        <s:form id="form" method="post" action="update" onsubmit="return updateBook(this)">
            <div class="input-group">
                <span class="input-group-addon">书名</span>
                <input class="form-control" type="text" readonly="true" name="title" value="<s:property value='#bo.title' />"/>
            </div>
            <div class="input-group">
                <span class="input-group-addon">作者编号</span>
                <input class="form-control" type="text" id="authorID" name="authorID" value="<s:property value='#bo.authorID' />" placeholder="示例：10020" required="true" pattern="[0-9]{1,9}"/>
            </div>
            <div class="input-group">
                <span class="input-group-addon">出版社</span>
                <input class="form-control" type="text" name="publisher" value="<s:property value='#bo.publisher' />" placeholder="40字以内" required="true" pattern=".{1,40}"/>
            </div>
            <div class="input-group">
                <span class="input-group-addon">出版日期</span>
                <input class="form-control" type="text" name="publishDate" value="<s:property value='#bo.publishDate' />" placeholder="示例：2017-10-10" required="true" pattern="[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])"/>
            </div>
            <div class="input-group">
                <span class="input-group-addon">价格</span>
                <input class="form-control" type="text" name="price" value="<s:property value='#bo.price' />" placeholder="示例：80.50" required="true" pattern="[0-9]+(\.[0-9]+)?"/>
                <span class="input-group-addon">元</span>
            </div>
            <div class="input-group">
                <span class="input-group-addon">ISBN</span>
                <input class="form-control" type="text" readonly="true" name="ISBN" value="<s:property value='#bo.ISBN' />"/>
            </div>
	        <div class="input-center">
	          <input type="submit" class="btn btn-default" value="更新" />
	        </div>
        </s:form>
        </div>
	</div>
    	<%@ include file="/include/footer.jsp" %>
	</div>
    </body>
    
	<script src="<s:url value='/js/ajax.js'/>"></script>
</html>
