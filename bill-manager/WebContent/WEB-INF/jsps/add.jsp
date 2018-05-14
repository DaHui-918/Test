<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/My97DatePicker/WdatePicker.js"></script>

<title>Insert title here</title>
</head>
<body>
  <form action="${pageContext.request.contextPath }/bill/add" enctype="multipart/form-data" method="post">
  <table>
    <tr>
      <td>类型</td>
      <td>
      	<select name="typeId">
      	
      	<c:forEach items="${types }" var="t">
      	  <option value="${t.id }" >${t.name }</option>
      	</c:forEach>
      	</select>
      </td>
    </tr>
    <tr>
      <td>标题</td>
      <td><input type="text" name="title"  > </td>
    </tr>
    <tr>
      <td>日期</td>
      <td><input type="text" name="billTime"  onclick="WdatePicker()"> </td>
    </tr>
    <tr>
      <td>金额</td>
      <td><input type="text" name="price"  > </td>
    </tr>
    <tr>
      <td>说明</td>
      <td><input type="text" name="explain"  > </td>
    </tr>
    <tr>
      <td>文件</td>
      <td><input type="file" name="file"  > </td>
    </tr>
    
    <tr>
      <td colspan="2">
      	<input type="submit" value="保存">
      </td>
    </tr>
  </table>
  </form>
  

</body>
</html>