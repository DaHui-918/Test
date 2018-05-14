<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="${ctx }/static/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx }/static/js/jquery/jquery-1.10.2.min.js"></script>

<title>Insert title here</title>
<style type="text/css">
	#data table {
		width: 100%;
		border-collapse: collapse;
  	}
  	#data td {
  		border: 1px solid black;
  		padding: 3px;
  	}
  	#data th {
  		border: 1px solid red;
  		padding: 5px;
  	}
</style>
</head>
<body>
  <form action="${ctx }/bill/list-page" method="post" id="qf">
  	<input type="hidden" name="pageNum" id="pageNum" value="${page.pageNum }">
  	<input type="hidden" name="pageSize" id="pageSize" value="${page.pageSize }">
  
  <table>
  
    <tr>
      <td>标题</td>
      <td><input type="text" name="title"  value="${param.title }" > </td>
    </tr>
  
    <tr>
      <td>类型</td>
      <td>
      	<select name="typeId">
      	<option value="">全部</option>
      	
      	<c:forEach items="${types }" var="t">
      	  <option value="${t.id }" <c:if test="${param.typeId == t.id }"> selected </c:if> >${t.name }</option>
      	</c:forEach>
      	</select>
      </td>
    </tr>
    <tr>
      <td>开始时间</td>
      <td><input type="text" name="date1"  value="${param.date1 }" onclick="WdatePicker()"> </td>
    </tr>
    <tr>
      <td>结束时间</td>
      <td><input type="text" name="date2"  value="${param.date2 }" onclick="WdatePicker()"> </td>
    </tr>
    <tr>
      <td colspan="2">
      	<input type="submit" value="查询">
      	<input type="button" value="添加" onclick="location.href='${ctx }/bill/toAdd'">
      </td>
    </tr>
  </table>
  </form>
  
  <div id="data">
  <table>
	<tr>
	  <th>标题</th>
	  <th>时间</th>
	  <th>金额</th>
	  <th>类别</th>
	  <th>说明</th>
	  <th>操作</th>
	</tr>
	<c:forEach items="${page.list }" var="b">
	<tr>
	  <td>${b.title }</td>
	  <td>
	  	<fmt:formatDate value="${b.billTime }" pattern="yyyy-MM-dd" var="ft"/>
	  	${ft }
	  </td>
	  <td>${b.price }</td>
	  <td>${b.type.name }</td>
	  <td>${b.explain }</td>
	  <td>
	  	<a href="${ctx}/bill/delete/${b.id}">删除</a>
	  	<a href="${ctx}/bill/toUpdate/${b.id}">修改</a>
	  </td>
	</tr>
	</c:forEach>
  </table>
  </div>
  	<br>
  	
	<div style="margin-top: 10px;">
		<button id="first" >第一页</button>&nbsp;
		<button id="prev">上一页</button>&nbsp;
		<button id="next">下一页</button>&nbsp;
		<button id="last">最后页</button>&nbsp;
		第  ${page.pageNum }  页/共 ${page.pages }   页
		&nbsp;&nbsp;
		每页行数：
		<select id="setPageSize">
			<option value="10" <c:if test="${page.pageSize == 10 }">selected</c:if> >10行</option>
			<option value="30" <c:if test="${page.pageSize == 30 }">selected</c:if> >30行</option>
			<option value="50"  <c:if test="${page.pageSize == 50 }">selected</c:if> >50行</option>
			<option value="100" <c:if test="${page.pageSize == 100 }">selected</c:if> >100行</option>
		</select>
	</div>	
	
	<script type="text/javascript">
		$(function(){
			//初始化变量
			//当前页
			var pageNum = ${page.pageNum};
			//总页数
			var pageCount = ${page.pages};
			
			//是否有下一页
			var hasNextPage = ${page.hasNextPage};
			//是否有上一页
			var hasPreviousPage = ${page.hasPreviousPage};
			
			//判断按钮的状态			
			if (!hasNextPage) {
				$("#next").prop("disabled", true);
				$("#last").prop("disabled", true);
			}
			if (!hasPreviousPage) {
				$("#first").prop("disabled", true);
				$("#prev").prop("disabled", true);
			}
			
			

			$("#first").click(function(){
				$("#pageNum").val(1);
				$("#qf").submit();
			});
			
			$("#next").click(function(){
				$("#pageNum").val(pageNum + 1);
				$("#qf").submit();
			});
			
			$("#prev").click(function(){
				$("#pageNum").val(pageNum - 1);
				$("#qf").submit();
			});
			$("#last").click(function(){
				$("#pageNum").val(pageCount);
				$("#qf").submit();
			});
			$("#setPageSize").change(function(){
				$("#pageNum").val(1);
				$("#pageSize").val($(this).val());
				$("#qf").submit();
			})
			
		});
	</script>
  
</body>
</html>