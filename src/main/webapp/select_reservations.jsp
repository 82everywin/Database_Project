<%@ page import="com.example.database_project.dao.ReservationDao" %>
<%@ page import="com.example.database_project.dto.ReservationDto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%
    ReservationDao reservationDao = ReservationDao.getInstance();
    List<ReservationDto> reservations = reservationDao.getAllReservations();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 목록</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h1>[관리자 모드] Reservations 조회</h1>
<a href="admin_login.jsp"><button>메인페이지로 돌아가기</button></a><br>
<table>
    <tr>
        <th>ReservationID</th>
        <th>RoomID</th>
        <th>UserID</th>
        <th>CheckInDate</th>
        <th>CheckOutDate</th>
        <th>Guests</th>
        <th>Payment</th>
        <th>Actions</th>
    </tr>
    <%
        for (ReservationDto reservation : reservations) {
            int reservationId= reservation.getReservationId();
    %>
    <tr>
        <td><%= reservation.getReservationId() %></td>
        <td><%= reservation.getRoomId() %></td>
        <td><%= reservation.getUserId() %></td>
        <td><%= reservation.getCheckInDate() %></td>
        <td><%= reservation.getCheckOutDate() %></td>
        <td><%= reservation.getGuests() %></td>
        <td><%= reservation.getPayment() %></td>
        <td>
            <a href="admin_edit_reservation.jsp?reservationId=<%=reservationId%>"><button>수정</button></a>
            <a href="admin_delete_reservation.jsp?reservationId=<%=reservationId%>"><button>삭제</button></a>
        </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
