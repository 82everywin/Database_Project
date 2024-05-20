<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.database_project.dao.RoomDao" %>
<%
    int roomId = Integer.parseInt(request.getParameter("roomId"));

    RoomDao roomDao = RoomDao.getInstance();
    boolean success = roomDao.deleteRoom(roomId);

    if (success) {
%>
<script>
    alert('객실이 성공적으로 삭제되었습니다.');
    window.location.href = 'select_rooms.jsp';
</script>
<%
} else {
%>
<script>
    alert('객실 삭제에 실패했습니다. 다시 시도해주세요.');
    history.back();
</script>
<%
    }
%>
