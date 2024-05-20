<%@ page import="com.example.database_project.dao.ReservationDao" %>
<%@ page import="com.example.database_project.dto.ReservationDto" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.Date" %>
<%@ page import="com.example.database_project.dto.UserDto" %>
<%@ page import="com.example.database_project.dto.RoomDto" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.database_project.dao.UserDao" %>
<%@ page import="com.example.database_project.dao.RoomDao" %>
<%
    int reservationId = Integer.parseInt(request.getParameter("reservationId"));

    ReservationDao reservationDao = ReservationDao.getInstance();
    ReservationDto reservation = reservationDao.getReservationByReservationId(reservationId);

    RoomDao roomDao = RoomDao.getInstance();
    UserDao userDao = UserDao.getInstance();
    List<RoomDto> rooms = roomDao.getAllRooms();
    List<UserDto> users = userDao.getAllUsers();

    if (reservation == null) {
        response.sendRedirect("select_reservations.jsp");
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
<h1>[관리자 모드] 예약 수정</h1>
<form name="editReservationForm" action="admin_update_reservation.jsp" method="post">
    <input type="hidden" name="reservationId" value="<%= reservationId %>">
    <table>
        <tr>
            <td>객실(Room):</td>
            <td>
                <select name="roomId" required>
                    <option value="">객실 선택</option>
                    <%
                        for (RoomDto room : rooms) {
                    %>
                    <option value="<%= room.getRoomId() %>" <%= room.getRoomId() == reservation.getRoomId() ? "selected" : "" %>>ID: <%= room.getRoomId() %>, Type: <%= room.getRoomType() %></option>                    <%
                        }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td>사용자(User):</td>
            <td>
                <select name="userId" required>
                    <option value="">사용자 선택</option>
                    <%
                        for (UserDto user : users) {
                    %>
                    <option value="<%= user.getUserId() %>" <%= user.getUserId() == reservation.getUserId() ? "selected" : "" %>>ID: <%= user.getUserId() %>, Name: <%= user.getUsername() %></option>
                    <%
                        }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td>체크인 날짜(Check-In Date):</td>
            <td><input type="date" id="checkInDate" name="checkInDate" value="<%= reservation.getCheckInDate() %>" required></td>
        </tr>
        <tr>
            <td>체크아웃 날짜(Check-Out Date):</td>
            <td><input type="date" id="checkOutDate" name="checkOutDate" value="<%= reservation.getCheckOutDate() %>" required></td>
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
            <td colspan="2"><button type="submit">수정하기</button></td>
        </tr>
    </table>
</form>
</body>
</html>
