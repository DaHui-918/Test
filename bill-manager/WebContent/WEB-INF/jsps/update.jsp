<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/My97DatePicker/WdatePicker.js"></script>

<title>Insert title here</title>
</head>
<body>


  <form:form action="${pageContext.request.contextPath }/bill/update" method="post" modelAttribute="bill">
  	<form:hidden path="id"/>
  <table>
    <tr>
      <td>类型</td>
      <td>
      	<form:select path="typeId" items="${types }" itemLabel="name" itemValue="id">
      	</form:select>
      </td>      
      
    </tr>
    <tr>
      <td>标题</td>
      <td>
		<form:input path="title"/>      
      </td>
    </tr>
    <tr>
      <td>日期</td>
      <td>
		<form:input path="billTime" onclick="WdatePicker()"/>      
      </td>
    </tr>
    <tr>
      <td>金额</td>
      <td>
      	<form:input path="price"/>
      </td>
    </tr>
    <tr>
      <td>说明</td>
      <td>
      	<form:input path="explain"/>
      </td>
    </tr>
    
    <tr>
      <td colspan="2">
      	<input type="submit" value="保存">
      </td>
    </tr>
  </table>
  </form:form>




  <hr>
  

  <form action="${pageContext.request.contextPath }/bill/update" method="post">
  	<input type="hidden" name="id" value="${bill.id }">
  <table>
    <tr>
      <td>类型</td>
      <td>
      	<select name="typeId">
      	
      	<c:forEach items="${types }" var="t">
      	  <option value="${t.id }" <c:if test="${t.id == bill.typeId }">selected</c:if> >${t.name }</option>
      	</c:forEach>
      	</select>
      </td>
    </tr>
    <tr>
      <td>标题</td>
      <td><input type="text" name="title" value="${bill.title }" > </td>
    </tr>
    <tr>
      <td>日期</td>
      <td>
      <fmt:formatDate value="${bill.billTime }" pattern="yyyy-MM-dd" var="ft"/>
      <input type="text" name="billTime" value="${ft }"  onclick="WdatePicker()"> 
      </td>
    </tr>
    <tr>
      <td>金额</td>
      <td><input type="text" name="price" value="${bill.price }" > </td>
    </tr>
    <tr>
      <td>说明</td>
      <td><input type="text" name="explain" value="${bill.explain }" > </td>
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