<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="com.example.database_project.dao.ReservationDao" %>
<%@ page import="com.example.database_project.dto.ReservationDto" %>
<%
    String accommodationId = request.getParameter("accommodationId");


    int accId = Integer.parseInt(accommodationId);
    ReservationDao reservationDao = ReservationDao.getInstance();
    List<ReservationDto> reservations = reservationDao.getReservationsByAccommodationId(accId);
%>

<tr>
    <th>예약번호(ReservationID)</th>
    <th>객실번호(RoomID)</th>
    <th>객실타입(RoomType)</th>
    <th>고객 이름(UserName)</th>
    <th>고객 전화번호(UserPhone)</th>
    <th>고객 이메일(UserEmail)</th>
    <th>체크인 날짜(CheckInDate)</th>
    <th>체크아웃 날짜(CheckOutDate)</th>
    <th>고객수(Guests)</th>
    <th>결제 방법(Payment)</th>
</tr>
<%
    for (ReservationDto reservation : reservations) {
%>
<tr>
    <td><%= reservation.getReservationId() %></td>
    <td><%= reservation.getRoomId() %></td>
    <td><%= reservation.getRoomType() %></td>
    <td><%= reservation.getUserName()%></td>
    <td><%= reservation.getUserPhone()%></td>
    <td><%= reservation.getUserEmail()%></td>
    <td><%= reservation.getCheckInDate() %></td>
    <td><%= reservation.getCheckOutDate() %></td>
    <td><%= reservation.getGuests() %></td>
    <td><%= reservation.getPayment() %></td>

</tr>
<%
    }
%>
