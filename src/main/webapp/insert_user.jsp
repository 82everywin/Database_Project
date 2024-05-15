<%@ page import="com.example.database_project.dao.UserDao" %>
<%@ page import="com.example.database_project.dto.UserDto" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf-8");
    String email = request.getParameter("email");
    String name = request.getParameter("name");
    String pw = request.getParameter("pw");
    String phone = request.getParameter("phone");

    UserDto user = new UserDto();
    user.setEmail(email);
    user.setUsername(name);
    user.setPassword(pw);
    user.setPhone(phone);

    UserDao dao = UserDao.getInstance();

    if (dao.confirmId(email) == UserDao.USER_EXISTENT) {
%>
    <script>
        alert("이미 존재하는 이메일입니다.");
        history.back();
    </script>
<%
    } else {
        if (dao.insertUser(user) == UserDao.USER_JOIN_SUCCESS) {
%>
    <script>
        alert("회원가입을 성공했습니다.");
        location.href = 'login.jsp';
    </script>
<%
    } else {
%>
    <script>
        alert("회원가입을 실패했습니다.");
        location.href = 'join_user.jsp';
    </script>
<%
        }
    }
%>
