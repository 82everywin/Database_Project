<%@ page import="com.example.database_project.dao.UserDao" %>
<%@ page import="com.example.database_project.dto.UserDto" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String email = (String) session.getAttribute("email");
    String currentPw = request.getParameter("current_pw");
    String newPw = request.getParameter("new_pw");
    String confirmPw = request.getParameter("confirm_pw");

    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    UserDao dao = UserDao.getInstance();
    UserDto user = dao.getUser(email);

    if (!user.getPassword().equals(currentPw)) {
%>
    <script>
        alert("기존 비밀번호가 일치하지 않습니다.");
        history.back();
    </script>
<%
    } else if (!newPw.equals(confirmPw)) {
%>
    <script>
        alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        history.back();
    </script>
<%
    } else {
        UserDto userDto = new UserDto();
        userDto.setPassword(newPw);
        boolean success = dao.updatePassword(userDto, email);

        if (success) {
%>
    <script>
        alert("비밀번호가 성공적으로 변경되었습니다.");
        location.href = 'main.jsp';
    </script>
<%
    } else {
%>
    <script>
        alert("비밀번호 변경에 실패했습니다.");
        history.back();
    </script>
<%
        }
    }
%>
