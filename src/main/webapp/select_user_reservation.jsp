<%@ page import="com.example.database_project.dao.ReservationDao" %>
<%@ page import="com.example.database_project.dto.ReservationDto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%
    int userId = Integer.parseInt(request.getParameter("userId"));

    if (userId == -1) {
        response.sendRedirect("login.jsp");
        return;
    }

    ReservationDao reservationDao = ReservationDao.getInstance();
    List<ReservationDto> reservations =reservationDao.getReservationsByUserId(userId);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 목록</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            text-align: center;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        button {
            padding: 5px 10px;
            cursor: pointer;
        }
        a {
            text-decoration: none;
            color: inherit;
        }
    </style>
</head>
<body>
<h1>예약 정보</h1>
<button onclick="location.href='main.jsp'">메인페이지로 돌아가기</button>
<%
    if (reservations.isEmpty()) {
%>
    <p>현재 예약된 정보가 없습니다.</p>

<%

} else {
%>
    <table>
        <tr>
            <th>숙소 이름</th>
            <th>숙소 타입</th>
            <th>예약자 이름</th>
            <th>체크인 날짜</th>
            <th>체크아웃 날짜</th>
            <th>투숙 인원</th>
            <th>지불 요금</th>
            <th>결제 방식</th>
            <th>비 고 란</th>
        </tr>
        <%
            for(ReservationDto reservation : reservations){
                int reservationId = reservation.getReservationId();
        %>
        <tr>
            <td><%= reservation.getAccommodationname()%></td>
            <td><%= reservation.getRoomType() %></td>
            <td><%= reservation.getUserName() %></td>
            <td><%= reservation.getCheckInDate() %></td>
            <td><%= reservation.getCheckOutDate() %></td>
            <td><%= reservation.getGuests() %></td>
            <td><%= reservation.getPrice() %></td>
            <td><%= reservation.getPayment() %></td>
            <td>
                <a href="edit_reservation.jsp?reservationId=<%= reservationId %>"><button type="button">수정</button></a>
                <a href="delete_reservation.jsp?reservationId=<%= reservationId %>" onclick="return confirm('정말 취소하시겠습니까?');"><button type="button">취소</button></a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
<%
    }
%>
</body>
</html>
