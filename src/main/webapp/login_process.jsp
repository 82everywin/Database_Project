<%@ page import="com.example.database_project.dto.UserDto" %>
<%@ page import="com.example.database_project.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String email = request.getParameter("email");
    String pw = request.getParameter("pw");
    UserDao dao = UserDao.getInstance();
    int rt = dao.confirmLogin(email, pw);
    try {
        if (rt == UserDao.USER_NONEXISTENT) {
%>
<script>
    alert("존재하지 않는 이메일 입니다.")
    history.back();
</script>
<%
    } else if (rt == UserDao.USER_LOGIN_FAIL) {
%>
<script>
    alert("비밀번호가 틀립니다.")
    history.back();
</script>
<%
    } else {
       UserDto user = dao.getUser(email);
      if (user == null) {
%>
<script>
    alert("존재하지 않는 회원 입니다.")
    history.back();
</script>
<%
        } else {
          session.setAttribute("userId", user.getUserId());
          session.setAttribute("name", user.getUsername());
          session.setAttribute("email", user.getEmail());
          session.setAttribute("isLogin", true);
          response.sendRedirect("main.jsp");

        }
    }
    } catch (Exception e) {
        e.printStackTrace();
%>
<script>
    alert("로그인 처리 중 오류가 발생했습니다.");
    history.back();
</script>
<%
    }
%>