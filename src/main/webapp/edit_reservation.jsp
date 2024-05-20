<%@ page import="com.example.database_project.dao.ReservationDao" %>
<%@ page import="com.example.database_project.dto.ReservationDto" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.Date" %>
<%
    int reservationId = Integer.parseInt(request.getParameter("reservationId"));

    ReservationDao reservationDao = ReservationDao.getInstance();
    ReservationDto reservation = reservationDao.getReservationByReservationId(reservationId);

    if (reservation == null) {
        response.sendRedirect("main.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 수정</title>
</head>
<body>
<h1>예약 수정</h1>
<form name="editReservationForm" action="update_reservation.jsp" method="post">
    <input type="hidden" name="reservationId" value="<%= reservationId %>">
    <table>
        <tr>
            <td>숙소 이름(Accommodation Name):</td>
            <td><%= reservation.getAccommodationname() %>
            </td>
        </tr>
        <tr>
            <td>객실 타입(Room Type):</td>
            <td><%= reservation.getRoomType() %>
            </td>
        </tr>
        <tr>
            <td>예약자 이름(User Name):</td>
            <td><%= reservation.getUserName() %>
            </td>
        </tr>
        <tr>
            <td>체크인 날짜(Check-In Date):</td>
            <td><input type="date" id="checkInDate" name="checkInDate" value="<%= reservation.getCheckInDate() %>"
                       required></td>
        </tr>
        <tr>
            <td>체크아웃 날짜(Check-Out Date):</td>
            <td><input type="date" id="checkOutDate" name="checkOutDate" value="<%= reservation.getCheckOutDate() %>"
                       required></td>
        </tr>
        <tr>
            <td>투숙 인원(Guests):</td>
            <td><input type="number" name="guests" value="<%= reservation.getGuests() %>" required></td>
        </tr>
        <tr>
            <td>결제 방식(Payment):</td>
            <td>
                <select name="payment" required>
                    <option value="현금" <%= "현금".equals(reservation.getPayment()) ? "selected" : "" %>>현금</option>
                    <option value="카드" <%= "카드".equals(reservation.getPayment()) ? "selected" : "" %>>카드</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="submit">수정하기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
