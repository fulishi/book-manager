<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/meta.jsp" %>
        <title>添加作者</title>
<%@ include file="/include/header.jsp" %>  
	<div class="content">
	<div class="container">
        <div class="panel panel-default">
        <div class="panel-heading">添加作者</div>
        <s:form id="form" method="post" action="addAuthor" onsubmit="return addAuthor(this)">
            <div class="input-group">
                <span class="input-group-addon">作者</span>
                <input class="form-control" type="text" name="author" required="true"/>
            </div>
            <div class="input-group">
                <span class="input-group-addon">编号</span>
                <input class="form-control" type="text" name="authorID" id="authorID" required="true" pattern="[0-9]{1,9}"/>
            </div>
            <div class="input-group">
                <span class="input-group-addon">年龄</span>
                <input class="form-control" type="text" name="age" required="true" pattern="\d+"/>
            </div>
            <div class="input-group">
                <span class="input-group-addon">国籍</span>
                <input class="form-control" type="text" name="country" required="true"/>
            </div>
            <div class="input-center">
                <input class="btn btn-default" type="submit" value="添加"/>
            </div>
        </s:form>
        </div>
	</div>
    	<%@ include file="/include/footer.jsp" %>
	</div>
    </body>
    
    <script src="<s:url value='/js/ajax.js'/>"></script>
</html>
