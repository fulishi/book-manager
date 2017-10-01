/**
 * 通过异步查询作者是否存在于数据库中，决定是否提交表单，或者给出错误提醒
 */
function loadXMLDoc(form, flagToSubmit, msg)
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
            var result = xmlhttp.responseText;
            if(result == flagToSubmit) form.submit();
            else {
            	alert(msg);
            	form.authorID.focus();
            	form.authorID.select();
            }
        }
    }

    var authorID = form.authorID.value;
    xmlhttp.open("GET","api/query?authorid="+authorID,true);
    xmlhttp.send();
    return false;
}

/* 新增图书或更新图书信息 */
function updateBook(form) {
	return loadXMLDoc(form, 'true', "作者不存在！");
}

/* 新增作者 */
function addAuthor(form) {
	return loadXMLDoc(form, 'false', "作者已经存在！");
}