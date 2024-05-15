<%@ page import="com.example.database_project.dao.OwnerDao" %>
<%@ page import="com.example.database_project.dto.OwnerDto" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
  request.setCharacterEncoding("utf-8");
  String email = request.getParameter("email");
  String name = request.getParameter("name");
  String pw = request.getParameter("pw");
  String phone = request.getParameter("phone");
  String license = request.getParameter("license");

  OwnerDto owner = new OwnerDto();
  owner.setEmail(email);
  owner.setOwnerName(name);
  owner.setPassword(pw);
  owner.setPhone(phone);
  owner.setLicenseNum(license);

  OwnerDao dao = OwnerDao.getInstance();

  if (dao.confirmId(email) == OwnerDao.OWNER_EXISTENT) {
%>
  <script>
    alert("이미 존재하는 이메일입니다.");
    history.back();
  </script>
<%
  } else {
    if (dao.insertOwner(owner) == OwnerDao.OWNER_JOIN_SUCCESS) {
%>
  <script>
    alert("회원가입을 성공했습니다.");
    location.href = 'owner_login.jsp';
  </script>
  <%
  } else {
  %>
  <script>
    alert("회원가입을 실패했습니다.");
    location.href = 'join_owner.jsp';
  </script>
<%
    }
  }
%>
