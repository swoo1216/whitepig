<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<style type="text/css">

</style>
<script type="text/javascript">
	function input(){
		location.href="ginsert.do";		
	}
</script>
<body>
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>조회수</th>
			<th>추천수</th>
		</tr>
	</table>
	
	<button type="button" onclick="insert()">글쓰기</button>
	
</body>
</html>