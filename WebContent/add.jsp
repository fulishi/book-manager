<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/meta.jsp" %>
        <title>添加图书</title>
<%@ include file="/include/header.jsp" %>
	<div class="container">
	<div class="content">
        <s:form id="form" method="post" action="add" onsubmit="return updateBook(this)">
        	<div class="input-group">
  				<span class="input-group-addon" id="basic-addon1">书名</span>
        		<input type="text" name="title" required="true"/>
        	</div>
        	<div class="input-group">
  				<span class="input-group-addon" id="basic-addon1">作者编号</span>
                <input type="text" id="authorID" name="authorID" required="true" pattern="[0-9]{1,9}"/>
            </div>
        	<div class="input-group">
  				<span class="input-group-addon" id="basic-addon1">出版社</span>
                <input type="text" name="publisher" required="true"/>
            </div>
        	<div class="input-group">
  				<span class="input-group-addon" id="basic-addon1">出版日期</span>
                <input type="text" name="publishDate" required="true" pattern="[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])"/>
            </div>
        	<div class="input-group">
  				<span class="input-group-addon" id="basic-addon1">价格</span>
                <input type="text" name="price" required="true" pattern="[0-9]+(\.[0-9]+)?"/>
            </div>
        	<div class="input-group">
  				<span class="input-group-addon" id="basic-addon1">ISBN</span>
                <input type="text" name="ISBN" required="true" pattern="([0-9]+-){4}[0-9]"/>
            </div>
        	<div class="input-group" class="btn btn-default">
                <input type="submit" value="添加"/>
            </div>
        </s:form>
	</div>
	</div>
    </body>

	<script src="<s:url value='/js/ajax.js'/>"></script>
</html>