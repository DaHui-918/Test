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
  <form action="${ctx }/bill/list" method="post">
  <table>
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
	<c:forEach items="${list }" var="b">
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
	  	<a href="${ctx}/bill/download/${b.id}">下载附件</a>
	  </td>
	</tr>
	</c:forEach>
  </table>
  </div>
</body>
</html>