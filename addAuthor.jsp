<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/meta.jsp" %>
        <title>添加作者</title>
<%@ include file="/include/header.jsp" %>  
	<div class="content">
	<div class="container">
        <s:form id="form" method="post" action="addAuthor" onsubmit="return submitWhenAuthorNotExists(this)">
        	<s:textfield name="author" label="作者" required="true"/>
        	<s:textfield name="authorID" id="authorID" label="编号" required="true" pattern="[0-9]{1,9}"/>
        	<s:textfield name="age" label="年龄" required="true" pattern="\d+"/>
        	<s:textfield name="country" label="国籍" required="true"/>
        	<s:submit value="添加"/>
        </s:form>
	</div>
    	<%@ include file="/include/footer.jsp" %>
	</div>
    </body>
    
    <script src="<s:url value='/js/ajax.js'/>"></script>
</html>