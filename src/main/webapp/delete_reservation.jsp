<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ page import="com.example.database_project.dao.ReservationDao" %>
<%
    int reservationId = Integer.parseInt(request.getParameter("reservationId"));

    ReservationDao reservationDao = ReservationDao.getInstance();
    int userId = reservationDao.getUserIdByReservationId(reservationId);
    boolean success = reservationDao.deleteReservation(reservationId);

    if (success) {
%>
<script>
    alert('예약이 성공적 취소되었습니다');
    window.location.href = 'select_user_reservation.jsp?userId=<%= userId%>';
</script>
<%
} else {
%>
<script>
    alert('예약 취소에 실패했습니다. 다시 시도해주세요.');
    history.back();
</script>
<%
    }
%>