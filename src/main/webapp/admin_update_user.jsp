<%@ page import="com.example.database_project.dao.UserDao" %>
<%@ page import="com.example.database_project.dto.UserDto" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf-8");

    String current_email = request.getParameter("current_email");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");

    UserDto user = new UserDto();
    user.setEmail(email);
    user.setPassword(password);
    user.setUsername(name);
    user.setPhone(phone);

    UserDao dao = UserDao.getInstance();
    boolean success =  dao.updateUser(user,current_email);

    if (success) {

%>
<script>
    alert("회원정보가 성공적으로 수정되었습니다.");
    location.href = 'select_users.jsp'; // 홈 페이지로 이동 (로그인된 상태)
</script>
<%
} else {
%>
<script>
    alert("회원정보 수정에 실패했습니다.");
    history.back();
</script>
<%
    }
%>
