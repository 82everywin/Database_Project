<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.database_project.dao.ReservationDao" %>
<%
    int reservationId = Integer.parseInt(request.getParameter("reservationId"));

    ReservationDao reservationDao = ReservationDao.getInstance();
    boolean success = reservationDao.deleteReservation(reservationId);

    if (success) {
%>
<script>
    alert('예약 정보가 성공적으로 삭제되었습니다.');
    window.location.href = 'select_reservations.jsp';
</script>
<%
} else {
%>
<script>
    alert('예약 삭제에 실패했습니다. 다시 시도해주세요.');
    history.back();
</script>
<%
    }
%>