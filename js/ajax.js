/**
 * 通过异步查询作者是否存在于数据库中，决定是否提交表单，或者给出错误提醒
 */
function loadXMLDoc(callback)
{
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp=new XMLHttpRequest();
    }
    else
    {
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function()
    {
        if (xmlhttp.readyState==4 && xmlhttp.status==200)
        {
            callback(xmlhttp);
        }
    }

    var authorID = form.authorID.value;
    xmlhttp.open("GET","api/query?authorid="+authorID,true);
    xmlhttp.send();
    return false;
}

/* 新增图书或更新图书信息 */
function updateBook(form) {
	return loadXMLDoc(function(xmlhttp){
		var result = xmlhttp.responseText;
	    if(result == 'true') form.submit();
	    else {
	    	alert("作者不存在，请先添加作者信息或修改编号！");
	    	form.authorID.focus();
	    	form.authorID.select();
	    }
	});
}

/* 新增作者 */
function addAuthor(form) {
	return loadXMLDoc(function(xmlhttp){
		var result = xmlhttp.responseText;
	    if(result == 'false') form.submit();
	    else {
	    	alert("作者编号已存在，请修改编号！");
	    	form.authorID.focus();
	    	form.authorID.select();
	    }
	});
}