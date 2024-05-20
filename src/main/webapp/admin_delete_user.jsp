<%@ page import="com.example.database_project.dao.UserDao" %>
<%@ page import="com.example.database_project.dto.UserDto" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf-8");
    String email = request.getParameter("email");

    UserDao dao = UserDao.getInstance();
    boolean success = dao.deleteUser(email);

    if (success) {
        session.invalidate();
%>
<script>
    alert("회원탈퇴가 성공적으로 완료되었습니다.");
    location.href = 'select_users.jsp';
</script>
<%
} else {
%>
<script>
    alert("회원탈퇴에 실패했습니다.");
    history.back();
</script>
<%
    }
%>
