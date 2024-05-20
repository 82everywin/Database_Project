<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ page import="com.example.database_project.dto.RoomDto" %>
<%@ page import="com.example.database_project.dto.UserDto" %>
<%@ page import="com.example.database_project.dao.RoomDao" %>
<%@ page import="com.example.database_project.dao.UserDao" %>
<%@ page import="com.example.database_project.dto.AccommodationDto" %>
<%@ page import="com.example.database_project.dao.AccommodationDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 추가</title>
</head>
<body>
<h1>예약 추가</h1>
<%
    request.setCharacterEncoding("utf-8");

    int userId = Integer.parseInt(request.getParameter("userId"));
    int accommodationId = Integer.parseInt(request.getParameter("accommodationId"));
    int roomId = Integer.parseInt(request.getParameter("roomId"));

    UserDao userDao = UserDao.getInstance();
    RoomDao roomDao = RoomDao.getInstance();
    AccommodationDao accommodationDao = AccommodationDao.getInstance();

    UserDto user = userDao.getUserById(userId);
    RoomDto room = roomDao.getRoomById(roomId);
    AccommodationDto accommodation = accommodationDao.getAccommodationById(accommodationId);

%>
<form name="addReservationForm" action="insert_reservation.jsp" method="post" onsubmit="return validateAddReservation()">
    <table>
        <input type="hidden" name="roomId" value="<%= room.getRoomId()%>">
        <input type="hidden" name="userId" value="<%= user.getUserId()%>">
        <tr>
            <td>숙소 (Accommodation) :</td>
            <td>
                <%= accommodation.getAccommodationName()%>
            </td>
        </tr>
        <tr>
            <td>객실 (Room) :</td>
            <td>
                <%= room.getRoomType() %>
            </td>
        </tr>
        <tr>
            <td>예약자 성함 (User) :</td>
            <td>
                <%= user.getUsername() %>
            </td>
        </tr>
        <tr>
            <td>체크인 날짜(Check-In Date):</td>
            <td><input type="date" id="checkInDate" name="checkInDate" required></td>
        </tr>
        <tr>
            <td>체크아웃 날짜(Check-Out Date):</td>
            <td><input type="date" id="checkOutDate" name="checkOutDate" required></td>
        </tr>
        <tr>
            <td>게스트 수(Guests):</td>
            <td><input type="number" name="guests" required></td>
        </tr>
        <tr>
            <td>결제 방법(Payment):</td>
            <td>
                <select name="payment" required>
                    <option value="현금">현금</option>
                    <option value="카드">카드</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit">추가하기</button></td>
        </tr>
    </table>
</form>
</body>
</html>
