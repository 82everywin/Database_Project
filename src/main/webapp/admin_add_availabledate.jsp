<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.database_project.dao.RoomDao" %>
<%@ page import="com.example.database_project.dto.RoomDto" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 가능일 추가</title>
</head>
<body>
<h1>[관리자 모드] 예약 가능일 추가</h1>
<%
    RoomDao roomDao = RoomDao.getInstance();
    List<RoomDto> rooms = roomDao.getAllRooms();
%>
<form name="addAvailableDateForm" action="admin_insert_availabledate.jsp" method="post">
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
            <td>Date:</td>
            <td><input type="date" name="date" required></td>
        </tr>
        <tr>
            <td>IsAvailable:</td>
            <td>
                <select name="isAvailable" required>
                    <option value="true">Available</option>
                    <option value="false">Not Available</option>
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
