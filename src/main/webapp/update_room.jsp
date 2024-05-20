<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ page import="com.example.database_project.dto.RoomDto" %>
<%@ page import="com.example.database_project.dao.RoomDao" %>
<%
    request.setCharacterEncoding("utf-8");

    int roomId = Integer.parseInt(request.getParameter("roomId"));
    String roomType = request.getParameter("roomType");
    int roomCount = Integer.parseInt(request.getParameter("roomCount"));
    int price = Integer.parseInt(request.getParameter("price"));
    boolean availability = Boolean.parseBoolean(request.getParameter("availability"));

    RoomDto room = new RoomDto(roomId, roomType, roomCount, price, availability);
    RoomDao roomDao = RoomDao.getInstance();

    boolean success = roomDao.updateRoom(room);

    if (success) {
%>
<script>
    alert('객실 정보가 성공적으로 업데이트되었습니다.');
    window.location.href = 'owner_rooms.jsp';
</script>
<%
} else {
%>
<script>
    alert('객실 정보 업데이트에 실패했습니다. 다시 시도해주세요.');
    history.back();
</script>
<%
    }
%>
