<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/meta.jsp" %>
        <title>Books</title>
<%@ include file="/include/header.jsp" %>  
    	<s:set var="queryTitle" value="title" />
    	<s:set var="queryAuthor" value="author" />
    	<s:iterator value="#request.Books">
    		<s:url namespace='/book' action="detail" var="detailAction">
    			<s:param name="ISBN" value="ISBN" />
    		</s:url>
    		<s:url namespace='/book' action="detail" var="toUpdateAction" escapeAmp="false">
    			<s:param name="ISBN" value="ISBN" />
    			<s:param name="update" value="true" />
    		</s:url>
    		<s:url namespace='/book' action="delete" var="deleteAction" escapeAmp="false">
    			<s:param name="ISBN" value="ISBN" />
    			<s:param name="author" value="queryAuthor" />
    			<s:param name="title" value="queryTitle" />
    		</s:url>
    		<span><a href="<s:property value='detailAction'/>"><s:property value="title"/></a></span>
    		<span><a href="<s:property value='toUpdateAction'/>">编辑</a></span>
    		<span><a href="<s:property value='deleteAction'/>">删除</a></span>
    		<br />
    	</s:iterator>
    </body>
</html>