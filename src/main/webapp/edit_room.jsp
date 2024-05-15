<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.database_project.dao.RoomDao, com.example.database_project.dto.RoomDto" %>
<%
    int roomId = Integer.parseInt(request.getParameter("roomId"));
    RoomDao roomDao = RoomDao.getInstance();
    RoomDto room = roomDao.getRoomById(roomId);

    if (room == null) {
        response.sendRedirect("owner_rooms.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>객실 정보 수정</title>
</head>
<body>
<h1>객실 정보 수정</h1>
<form action="update_room.jsp" method="post">
    <input type="hidden" name="roomId" value="<%= roomId %>">
    <table>
        <tr>
            <td>객실 타입(RoomType):</td>
            <td><input type="text" name="roomType" value="<%= room.getRoomType() %>" required></td>
        </tr>
        <tr>
            <td>잔여 객실 수(RoomCount):</td>
            <td><input type="number" name="roomCount" value="<%= room.getRoomCount() %>" required></td>
        </tr>
        <tr>
            <td>가격(Price):</td>
            <td><input type="number" name="price" value="<%= room.getPrice() %>" required></td>
        </tr>
        <tr>
            <td>노출여부(Availability):</td>
            <td>
                <select name="availability">
                    <option value="true" <%= room.isAvailability() ? "selected" : "" %>>Yes</option>
                    <option value="false" <%= !room.isAvailability() ? "selected" : "" %>>No</option>
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
