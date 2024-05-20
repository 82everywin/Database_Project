<%--
  Created by IntelliJ IDEA.
  User: hyeonseung
  Date: 5/17/24
  Time: 6:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 전용</title>
</head>
<br>
<a href="index.jsp"><button>초기화면 으로 가기 </button></a>
<a href="login.jsp"><button>고객 로그인 화면으로 이동</button></a>
<a href="owner_login.jsp"><button>대표자 로그인 화면으로 이동</button></a>

<h1> 💡Users Table </h1>
<a href="admin_join_user.jsp">(1) 회원 추가 </a></br>
<a href="select_users.jsp">(2) 회원 조회 / 수정 / 삭제</a>

<h1> 💡Owners Table </h1>
<a href="admin_join_owner.jsp">(1) 회원 추가 </a></br>
<a href="select_owners.jsp">(2) 회원 조회 / 수정 / 삭제</a>

<h1> 💡Accommodations Table </h1>
<a href="admin_add_accommodation.jsp">(1) 숙소 추가 </a></br>
<a href="select_accommodations.jsp">(2) 숙소 정보 조회 / 수정 / 삭제</a>

<h1> 💡Rooms Table </h1>
<a href="admin_add_room.jsp">(1) 객실 추가 </a></br>
<a href="select_rooms.jsp">(2) 객실 조회 / 수정 / 삭제</a>

<h1> 💡Reservations Table </h1>
<a href="admin_add_reservation.jsp">(1) 예약 추가 </a></br>
<a href="select_reservations.jsp">(2) 예약 조회 / 수정 / 삭제</a>

<h1> 💡AvailableDates Table </h1>
<a href="admin_add_availabledate.jsp">(1) 예약 가능일 추가</a></br>
<a href="select_availabledates.jsp">(2) 예약가능일 조회 / 수정 / 삭제 </a>
</body>
</html>
