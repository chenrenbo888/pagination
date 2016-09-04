<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/styles/main.css"/>"  type="text/css" rel="stylesheet" />
<title>商品管理</title>
</head>
<body>
	<div class="main">
		<h2 class="title"><span>商品管理</span></h2>
		<form action="<c:url value="/goods/deletes?pageNO=${pageNO}"/>" method="post">
		<table border="1" width="100%" class="tab">
			<tr>
				<th><input type="checkbox" id="chbAll"></th>
				<th>编号</th>
				<th>产品名</th>
				<th>价格</th>
				<th>类型</th>
				<th>操作</th>
			</tr>
			<c:forEach var="entity" items="${goods}">
				<tr>
					<th><input type="checkbox" name="id" value="${entity.id}"></th>
					<td>${entity.id}</td>
					<td>${entity.name}</td>
					<td><img src="<c:url value="/images/${entity.picture}"/>" height="40"/></td>
					<td>${entity.price}</td>
					<td>
					<a href="<c:url value="/goods/"/>delete/${entity.id}?pageNO=${pageNO}" class="abtn">删除</a>
					<a href="<c:url value="/goods/"/>edit/${entity.id}" class="abtn">编辑</a>
					<a href="<c:url value="/goods/"/>upPicture/${entity.id}" class="abtn">上传</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div id="pager" class="M-box"></div>
		<p>
		    <a href="add" class="abtn out">添加</a>
		    <input type="submit"  value="批量删除" class="btn out"/>
		</p>
		<p style="color: red">${message}</p>
		<!--分页 -->
		<script type="text/javascript" src="<c:url value="/scripts/jQuery1.11.3/jquery-1.11.3.min.js"/>" ></script>
		<link href="<c:url value="/style/pagination.css"/>"  type="text/css" rel="stylesheet" />
		<%-- <link href="<c:url value="/style/normalize.css"/>"  type="text/css" rel="stylesheet" />
		<link href="<c:url value="/style/common.css"/>"  type="text/css" rel="stylesheet" />
		 --%>
		<script type="text/javascript" src="<c:url value="/js/jquery.pagination.js"/>" ></script>
		<script type="text/javascript">
		   //初始化分页组件
		   var count=${count};
		   var size=${size};
		   var pageNO=${pageNO};
		   $("#pager").pagination( {
		       current:pageNO,
		       showData:size,
		       totalData:count,
		       coping:true,
		       homePage:'首页',
		       endPage:'尾页',
		       prevContent:'上页',
		       nextContent:'下页',
		       jump:true,
		       jumpBtn:"go",
		       callback:handlePaginationClick 
			});
		   
		   //回调方法
		   function handlePaginationClick(index, pagination_container,current){
			   location.href="<c:url value="/goods/"/>list?pageNO="+(index.getCurrent());
		   }
		   
		   var defaultSrc="<c:url value="/images/default.jpg"/>";
		   $(".tab img").bind("error",function(){
			   $(this).prop("src",defaultSrc);
		   });
		</script>
	</form>
	</div>
</body>
</html>