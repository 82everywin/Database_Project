<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.database_project.dto.RoomDto" %>
<%@ page import="com.example.database_project.dao.RoomDao" %>
<%@ page import="com.example.database_project.dto.DateDto" %>
<%@ page import="com.example.database_project.dao.DateDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.database_project.dao.DateDao" %>
<%@ page import="com.example.database_project.dto.DateDto" %>
<%
    int availableDateID = Integer.parseInt(request.getParameter("availabledateId"));

    DateDao availableDateDao = DateDao.getInstance();
    RoomDao roomDao = RoomDao.getInstance();
    DateDto availableDate = availableDateDao.getAvailableDateById(availableDateID);
    List<RoomDto> rooms = roomDao.getAllRooms();

    if (availableDate == null) {
        response.sendRedirect("select_availabledates.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Date 수정</title>
</head>
<body>
<h1>[관리자 모드] Available Date 수정</h1>
<form name="editAvailableDateForm" action="admin_update_availabledate.jsp" method="post">
    <input type="hidden" name="availableDateID" value="<%= availableDateID %>">
    <table>
        <tr>
            <td>RoomID:</td>
            <td>
                <select name="roomId" required>
                    <option value="">객실 선택</option>
                    <%
                        for (RoomDto room : rooms) {
                    %>
                    <option value="<%= room.getRoomId() %>" <%= room.getRoomId() == availableDate.getRoomid() ? "selected" : "" %>>ID: <%= room.getRoomId() %>, Type: <%= room.getRoomType() %></option>
                    <%
                        }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td>Date:</td>
            <td><input type="date" name="date" value="<%= availableDate.getDate() %>" required></td>
        </tr>
        <tr>
            <td>IsAvailable:</td>
            <td>
                <select name="isAvailable" required>
                    <option value="true" <%= availableDate.getIsAvailable() ? "selected" : "" %>>Available</option>
                    <option value="false" <%= !availableDate.getIsAvailable() ? "selected" : "" %>>Not Available</option>
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
