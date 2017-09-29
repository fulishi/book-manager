<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/meta.jsp" %>
        <title>图书管理系统</title>
<%@ include file="/include/header.jsp" %>
	<div class="content">
          <div class="cover">
          	<div class="inner">
            <h2>Search Books by Author</h2>
            <s:form action="query" method="get">
            <div class="input-group input-group-lg">
  				<input type="text" name="author" class="form-control" placeholder="作者名字">
				<span class="input-group-btn">
	        		<button class="btn btn-default" type="submit">搜索</button>
	      		</span>
			</div>
			</s:form>
			</div>
          </div>
          
		<%@ include file="/include/footer.jsp" %>
        </div>
    </body>
</html>