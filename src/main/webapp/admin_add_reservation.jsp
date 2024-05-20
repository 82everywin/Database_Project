<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.database_project.DBManager" %>
<%@ page import="com.example.database_project.dto.RoomDto" %>
<%@ page import="com.example.database_project.dto.UserDto" %>
<%@ page import="com.example.database_project.dao.RoomDao" %>
<%@ page import="com.example.database_project.dao.UserDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 추가</title>
</head>
<body>
<h1>[관리자 모드] 예약 정보 추가 </h1>
<%
    RoomDao roomDao = RoomDao.getInstance();
    UserDao userDao = UserDao.getInstance();
    List<RoomDto> rooms = roomDao.getAllRooms();
    List<UserDto> users = userDao.getAllUsers();
%>
<form name="addReservationForm" action="admin_insert_reservation.jsp" method="post" >
    <table>
        <tr>
            <td>객실(Room):</td>
            <td>
                <select name="roomId" required>
                    <option value="">객실 선택</option>
                    <%
                        for (RoomDto room : rooms) {
                    %>
                    <option value="<%= room.getRoomId() %>">ID: <%= room.getRoomId() %>, Type: <%= room.getRoomType() %></option>
                    <%
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
                    <option value="<%= user.getUserId() %>">ID: <%= user.getUserId() %>, Name: <%= user.getUsername() %></option>
                    <%
                        }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td>체크인 날짜(Check-In Date):</td>
            <td><input type="date" name="checkInDate" required></td>
        </tr>
        <tr>
            <td>체크아웃 날짜(Check-Out Date):</td>
            <td><input type="date" name="checkOutDate" required></td>
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
