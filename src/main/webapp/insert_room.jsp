<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ page import="com.example.database_project.dao.RoomDao" %>
<%@ page import="com.example.database_project.dto.RoomDto" %>
<%
    request.setCharacterEncoding("utf-8");

    int accommodationId = Integer.parseInt(request.getParameter("accommodationId"));
    String roomType = request.getParameter("roomType");
    int roomCount = Integer.parseInt(request.getParameter("roomCount"));
    int price = Integer.parseInt(request.getParameter("price"));
    boolean availability = Boolean.parseBoolean(request.getParameter("availability"));

    RoomDto room = new RoomDto();
    room.setAccommodationId(accommodationId);
    room.setRoomType(roomType);
    room.setRoomCount(roomCount);
    room.setPrice(price);
    room.setAvailability(availability);

    RoomDao roomDao = RoomDao.getInstance();
    boolean success = roomDao.insertRoom(room);

    if (success) {

    %>
        <script>
            alert('객실정보가 성공적으로 추가되었습니다.');
            window.location.href = 'owner_rooms.jsp';
           // window.location.href = 'load_rooms.jsp?accommodationId='+<%= accommodationId %>;
        </script>
<%
} else {
%>
    <script>
        alert('객실 추가에 실패했습니다. 다시 시도해주세요.');
        history.back();
    </script>
<%
    }
%>
