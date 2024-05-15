
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ownerEmail = (String) session.getAttribute("email");
    if (ownerEmail == null) {
        response.sendRedirect("owner_login.jsp");
        return;
    }
%>
<html>
<head>
    <title>관리자 메인보드</title>
</head>
<body>
<h1>관리자 대시보드</h1>
<h2><%= session.getAttribute("OwnerName")%> 대표님 안녕하세요</h2><br/>
<p><%= session.getAttribute("email")%></p>
<br/>
<button onclick="location.href='owner_rooms.jsp'">숙소 방정보 조회</button>
<button onclick="location.href='owner_reservations.jsp'">예약정보 조회</button>
<p>---------------------------------------------</p>
<button onclick="location.href='logout.jsp'">로그아웃</button>
<button onclick="location.href='edit_owner.jsp'">회원정보 수정</button>
<button onclick="confirmDelete()">탈퇴하기</button>
</body>
</html>
