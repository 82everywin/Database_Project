<%@ page import="com.example.database_project.dto.OwnerDto" %>
<%@ page import="com.example.database_project.dao.OwnerDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String email = request.getParameter("email");
    String pw = request.getParameter("pw");
    OwnerDao dao = OwnerDao.getInstance();
    int rt = dao.confirmLogin(email, pw);
    try {
        if (rt == OwnerDao.OWNER_NONEXISTENT) {
%>
<script>
    alert("존재하지 않는 이메일 입니다.")
    history.back();
</script>
<%
} else if (rt == OwnerDao.OWNER_LOGIN_FAIL) {
%>
<script>
    alert("비밀번호가 틀립니다.")
    history.back();
</script>
<%
} else {
    OwnerDto owner = dao.getOwner(email);
    if (owner == null) {
%>
<script>
    alert("존재하지 않는 회원입니다.")
    history.back();
</script>
<%
        } else {
            session.setAttribute("OwnerName", owner.getOwnerName());
            session.setAttribute("OwnerID", owner.getOwnerId());
            session.setAttribute("email", owner.getEmail());
            session.setAttribute("isLogin", true);
            response.sendRedirect("owner_dashboard.jsp");

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