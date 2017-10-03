<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/meta.jsp" %>
        <title>图书管理系统</title>
<%@ include file="/include/header.jsp" %>
	<div class="content">
          <div class="cover">
          	<div class="inner">
            <h1>图书管理系统</h1>
            <s:form action="query" method="get">
            <div class="input-group input-group-lg">
  				<input type="text" id="search-box" name="author" class="form-control" placeholder="请输入作者">
				<div class="input-group-btn">
	        		<button class="btn btn-default" type="submit">搜索</button>
	      		</div>
			</div>
			</s:form>
			<form>
				<div id="search-condition">
	      		<label><input type="radio" name="condition" value="author" checked="checked" />作者</label>
	      		<label><input type="radio" name="condition" value="title" />书名</label>
	      		</div>
	      	</form>
			</div>
          </div>
          
		<%@ include file="/include/footer.jsp" %>
        </div>
        
        <script type="text/javascript">
			$("document").ready(function(){
				$(":radio").change(function(){
					var condition = $(":radio:checked").val();
					var tip;
					if(condition == "author") tip = "请输入作者";
					else tip = "请输入（部分）书名";
					$("#search-box").attr("name", condition);
					$("#search-box").attr("placeholder", tip);
				})
				
				$(":radio").change();
			})
		</script>
    </body>
</html>