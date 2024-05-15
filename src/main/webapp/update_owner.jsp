<%@ page import="com.example.database_project.dto.OwnerDto" %>
<%@ page import="com.example.database_project.dao.OwnerDao" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
  request.setCharacterEncoding("utf-8");

  String current_email = (String)session.getAttribute("email");

  String email = request.getParameter("email");
  String name = request.getParameter("name");
  String phone = request.getParameter("phone");
  String license = request.getParameter("license");

  OwnerDto owner = new OwnerDto();
  owner.setOwnerName(name);
  owner.setEmail(email);
  owner.setPhone(phone);
  owner.setLicenseNum(license);

  OwnerDao dao = OwnerDao.getInstance();
  boolean success = dao.updateOwner(owner, current_email);


  if (success) {
    session.setAttribute("name", owner.getOwnerName());
    session.setAttribute("email", owner.getEmail());
    session.setAttribute("isLogin", true);
%>
<script>
  alert("회원정보가 성공적으로 수정되었습니다.");
  location.href = 'owner_dashboard.jsp'; // 홈 페이지로 이동 (로그인된 상태)
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
