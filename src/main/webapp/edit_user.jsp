<%@ page import="com.example.database_project.dao.UserDao" %>
<%@ page import="com.example.database_project.dto.UserDto" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String email = (String) session.getAttribute("email");
    if (email == null) {
        // 로그인 상태가 아니면 로그인 페이지로 리다이렉트
        response.sendRedirect("login.jsp");
        return;
    }
    UserDao dao = UserDao.getInstance();
    UserDto user = dao.getUser(email);
%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>회원정보 수정</title>
   <script src="form.js"></script>
</head>
<body>

<h1>회원정보 수정</h1>
<form action="update_user.jsp" method="post" name="modify_form" onsubmit="return confirmModify()">
    <table>
        <tr>
            <td>Email</td>
            <td><input type="email" name="email" value="<%= user.getEmail() %>" ></td>
        </tr>

        <tr>
            <td>이름</td>
            <td><input type="text" name="name" value="<%= user.getUsername() %>"></td>
        </tr>
        <tr>
            <td>비밀번호 변경</td>
            <td><button type="button" onclick="location.href='change_password.jsp?email=<%= user.getEmail()%>' "> 비밀번호 변경</button></td>
        </tr>
        <tr>
            <td>전화번호</td>
            <td><input type="text" name="phone" value="<%= user.getPhone() %>"></td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit">수정하기</button></td>
        </tr>
    </table>
    <br/>


</form>

</body>
</html>
