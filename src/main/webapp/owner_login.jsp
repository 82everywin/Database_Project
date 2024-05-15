<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="owner_form.js"></script>
    <title>Login</title>

</head>
<body>
<h2>관리자 로그인 페이지</h2>
<form action="owner_login_process.jsp" method="post" name="owner_login_form">
    <table>
        <tr>
            <td>
                Email :
            </td>
            <td>
                <input type="text" name="email"><br/>
            </td>
        </tr>
        <tr>
            <td>
                Password :
            </td>
            <td>
                <input type="password" name="pw">
            </td>
        </tr>
    </table>
    <br/>
    <button type="button" onclick="confirmLogin()">로그인</button>
    <button type="button" onclick="location.href='join_owner.jsp'">업주 회원 가입</button>
</form>

</body>
</html>