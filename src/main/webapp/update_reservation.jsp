<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ page import="com.example.database_project.dao.ReservationDao" %>
<%@ page import="java.sql.Date" %>
<%@ page import="com.example.database_project.dto.ReservationDto" %>
<%
    request.setCharacterEncoding("utf-8");

    int reservationId = Integer.parseInt(request.getParameter("reservationId"));
    Date checkInDate = Date.valueOf(request.getParameter("checkInDate"));
    Date checkOutDate = Date.valueOf(request.getParameter("checkOutDate"));
    int guests = Integer.parseInt(request.getParameter("guests"));
    String payment = request.getParameter("payment");

    ReservationDto reservation = new ReservationDto(reservationId, checkInDate,checkOutDate, guests, payment);
    ReservationDao reservationDao = ReservationDao.getInstance();

    int userId = reservationDao.getUserIdByReservationId(reservationId);
    boolean success = reservationDao.updateReservation(reservation);


    if (success) {
%>
<script>
    alert('예약이 수정되었습니다.');
    window.location.href = 'select_user_reservation.jsp?userId=<%=userId%> ';
</script>
<%
} else {
%>
<script>
    alert('예약 정보 수정을 실패했습니다. 다시 시도해주세요.');
    history.back();
</script>
<%
    }
%>

