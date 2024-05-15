<%@ page import="com.example.database_project.dao.OwnerDao" %>
<%@ page import="com.example.database_project.dto.OwnerDto" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("owner_login.jsp");
        return;
    }

    OwnerDao dao = OwnerDao.getInstance();
    OwnerDto owner = dao.getOwner(email);

%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>회원정보 수정</title>
    <script src="owner_form.js"></script>
</head>
<body>

<h1>업주 정보 수정</h1>
<form action="update_owner.jsp" method="post" name="modify_form" onsubmit="return confirmModify()">
    <table>
        <tr>
            <td>사업자 등록번호</td>
            <td><input type="text" name="license" value="<%= owner.getLicenseNum()%>" readonly></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="email" name="email" value="<%= owner.getEmail() %>" required></td>
        </tr>

        <tr>
            <td>이름</td>
            <td><input type="text" name="name" value="<%= owner.getOwnerName() %>" required></td>
        </tr>
        <tr>
            <td>비밀번호 변경</td>
            <td><button type="button" onclick="location.href='change_owner_password.jsp?email=<%= owner.getEmail()%>' "> 비밀번호 변경</button></td>
        </tr>
        <tr>
            <td>전화번호</td>
            <td><input type="text" name="phone" value="<%= owner.getPhone() %>" ></td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit">수정하기</button></td>
        </tr>
    </table>
    <br/>


</form>

</body>
</html>
