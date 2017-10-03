<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/meta.jsp" %>
        <title>错误页面</title>
<%@ include file="/include/header.jsp" %>  
	<div class="content">
	<div class="container">
		<div class="error-msg">
			<s:property value="#request.errorMsg" />
		</div>
	</div>
    	<%@ include file="/include/footer.jsp" %>
	</div>
    </body>
</html>