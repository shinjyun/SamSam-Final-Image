<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 입력</title>
<c:forEach var="list" items="${list}">
	<%--객체값과 파라미터값이 같은지를 확인하고 반환한다.--%>
	<c:if test="${list.imgNumber==imgDTO.imgNumber}">
		<script type="text/javascript">
			alert("이미지가 존재합니다. 다시 입력하세요");
			location.href = "./ImgInsert";
		</script>
	</c:if>
</c:forEach>
</head>
<body>
	<script type="text/javascript">
		alert("이미지를 등록하였습니다.")
		location.href = "./ImgSelect"
	</script>
</body>
</html>