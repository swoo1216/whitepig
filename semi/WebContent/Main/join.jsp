<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/top_style.css" />
<link rel="stylesheet" href="../../css/footer_style.css" />
<link rel="stylesheet" href="../../css/style.css" />
<title>Insert title here</title>
</head>
<body>
    <div id="mainForm">
        <h4>회원가입</h4>
        <form action="join.do" method="post">
            <table class="joinForm">
                <tr>
                    <th colspan="2">회원가입</th>
                </tr>
                <tr>
                    <th>아이디</th>
                    <td><input type="text" name="id" ></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="text" name="pwd" ></td>
                </tr><tr>
                    <th>비밀번호확인</th>
                    <td><input type="text" name="pwd" ></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><input type="text" name="email" ></td>
                </tr>
                 <tr>
                    <th>별명</th>
                    <td><input type="text" name="nic" ></td>
                </tr>
                <tr>
                    <th colspan="2"><input type="submit" value="가입">
                        <input type="button"  value="취소" ></th>
                        
                </tr>
            </table>
        </form>
    </div>
</body>
</html>