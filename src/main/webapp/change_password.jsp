<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
    <script src="form.js"></script>
</head>
<body>

<h1>비밀번호 변경</h1>
<form action="update_password.jsp" method="post" name="change_pw_form" onsubmit="return confirmChangePassword()">
    <table>
        <tr>
            <td>기존 비밀번호</td>
            <td><input type="password" name="current_pw" required></td>
        </tr>

        <tr>
            <td>새 비밀번호</td>
            <td><input type="password" name="new_pw" required></td>
        </tr>

        <tr>
            <td>새 비밀번호 확인</td>
            <td><input type="password" name="confirm_pw" required></td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit">비밀번호 변경</button></td>
        </tr>
    </table>
    <br/>
</form>

</body>
</html>
