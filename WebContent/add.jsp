<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>添加图书</title>
    </head>

	<script>
		function loadXMLDoc()
		{
			var form = document.getElementById("form");
			var xmlhttp;
			if (window.XMLHttpRequest)
			{
				//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
				xmlhttp=new XMLHttpRequest();
			}
			else
			{
				// IE6, IE5 浏览器执行代码
				xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange=function()
			{
				if (xmlhttp.readyState==4 && xmlhttp.status==200)
				{
					var result = xmlhttp.responseText;
					if(result == 'true') form.submit();
					else alert('作者不存在，请先添加作者信息！')
				}
			}
			
			var authorID = form.authorID.value;
			xmlhttp.open("GET","api/query?authorid="+authorID,true);
			xmlhttp.send();
		}
	</script>

    <body>
        <s:form id="form" method="post" namespace="/book" action="add">
        	<s:textfield name="title" label="书名"/>
        	<s:textfield id="authorID" name="authorID" label="作者编号"/>
        	<s:textfield name="publisher" label="出版社"/>
        	<s:textfield name="publishDate" label="出版年"/>
        	<s:textfield name="price" label="价格"/>
        	<s:textfield name="ISBN" label="ISBN"/>
        </s:form>
        	<input type="button" onclick="loadXMLDoc()" value="添加"/>
    </body>
</html>