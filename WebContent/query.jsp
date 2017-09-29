<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/meta.jsp" %>
        <title>Books</title>
<%@ include file="/include/header.jsp" %>
	<div class="content">
	<div class="container">
	<div class="panel panel-default">	
    	<s:set var="queryTitle" value="title" />
    	<s:set var="queryAuthor" value="author" />
    	<div class="panel-heading"><s:property value="queryAuthor" /></div>
    	<ul class="list-group">
    	<s:iterator value="#request.Books">
    		<s:url action="detail" var="detailAction">
    			<s:param name="ISBN" value="ISBN" />
    		</s:url>
    		<s:url action="detail" var="toUpdateAction" escapeAmp="false">
    			<s:param name="ISBN" value="ISBN" />
    			<s:param name="update" value="true" />
    		</s:url>
    		<s:url action="delete" var="deleteAction" escapeAmp="false">
    			<s:param name="ISBN" value="ISBN" />
    			<s:param name="author" value="queryAuthor" />
    			<s:param name="title" value="queryTitle" />
    		</s:url>
    		<li class="list-group-item">
    		<span><a href="<s:property value='detailAction'/>"><s:property value="title"/></a></span>
    		<span><a href="<s:property value='toUpdateAction'/>">编辑</a></span>
    		<span><a href="<s:property value='deleteAction'/>">删除</a></span>
    		</li>
    	</s:iterator>
    	</ul>
    	</div>
    </div>
    	<%@ include file="/include/footer.jsp" %>
    </div>
    </body>
</html>