<%@ page import="com.example.database_project.dao.UserDao" %>
<%@ page import="com.example.database_project.dto.UserDto" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf-8");
    String email = request.getParameter("email");

    UserDao dao = UserDao.getInstance();
    UserDto user = dao.getUser(email);
%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>관리자_회원정보 수정</title>
    <script src="form.js"></script>
</head>
<body>

<h1>[관리자 모드] 회원 정보 수정</h1>
<a href="admin_login.jsp">대시보드</a></br>
<form action="admin_update_user.jsp" method="post" name="modify_form" onsubmit="return confirmModify()">
    <table>
        <tr>
            <td><input type="hidden" name="current_email" value="<%= email %>" ></td>
        </tr>
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
            <td><input type="text" name="password" value="<%= user.getPassword() %>"></td>
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
