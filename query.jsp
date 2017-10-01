<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="/include/meta.jsp" %>
        <title>Books</title>
<%@ include file="/include/header.jsp" %>
	<div class="content">
	<div class="container">
		<s:set var="queryTitle" value="title" />
    	<s:set var="queryAuthor" value="author" />
    	
    	<s:iterator value="#request.BookMap.keySet()" var="authorInfo">
    		<div class="panel panel-default">	
    		<div class="panel-heading">
    		<span>作者：<s:property value="#authorInfo.getAuthor()" /></span>
    		<span>(<s:property value="#authorInfo.getAuthorID()" />)</span>
    		</div>
		    	<ul class="list-group">
		    	<s:iterator value="#request.BookMap.get(#authorInfo)" var="book">
		    		<s:url action="detail" var="detailAction">
		    			<s:param name="ISBN" value="#book.getISBN()" />
		    		</s:url>
		    		<s:url action="detail" var="goUpdateAction" escapeAmp="false">
		    			<s:param name="ISBN" value="#book.getISBN()" />
		    			<s:param name="update" value="true" />
		    		</s:url>
		    		<s:url action="delete" var="deleteAction" escapeAmp="false">
		    			<s:param name="ISBN" value="#book.getISBN()" />
		    			<s:param name="author" value="#queryAuthor" />
		    			<s:param name="title" value="#queryTitle" />
		    		</s:url>
		    		<li class="list-group-item">
					<span class="button">
		    		<button type="button" class="btn btn-xs btn-default" onclick="location.href='<s:property value="#goUpdateAction" />'">编辑</button>
		    		<button type="button" class="btn btn-xs btn-danger" onclick="location.href='<s:property value="#deleteAction" />'">删除</button>
		    		</span>
		    		<span><a href="<s:property value='detailAction'/>"><s:property value="#book.getTitle()"/></a></span>
		    		</li>
    			</s:iterator>
    			</ul>
    		</div>
    	</s:iterator>
    </div>
    	<%@ include file="/include/footer.jsp" %>
    </div>
    </body>
</html>