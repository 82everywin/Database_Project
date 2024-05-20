<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.database_project.dto.ReservationDto" %>
<%@ page import="com.example.database_project.dao.ReservationDao" %>
<%
    request.setCharacterEncoding("utf-8");

    int roomId = Integer.parseInt(request.getParameter("roomId"));
    int userId = Integer.parseInt(request.getParameter("userId"));
    Date checkInDate = Date.valueOf(request.getParameter("checkInDate"));
    Date checkOutDate = Date.valueOf(request.getParameter("checkOutDate"));
    int guests = Integer.parseInt(request.getParameter("guests"));
    String payment = request.getParameter("payment");

    ReservationDto reservation = new ReservationDto();
    reservation.setRoomId(roomId);
    reservation.setUserId(userId);
    reservation.setCheckInDate(checkInDate);
    reservation.setCheckOutDate(checkOutDate);
    reservation.setGuests(guests);
    reservation.setPayment(payment);

    ReservationDao reservationDao = ReservationDao.getInstance();
    boolean success = reservationDao.insertReservation(reservation);

    if (success) {

%>
<script>
    alert('예약정보가 추가되었습니다.');
    window.location.href = 'select_reservations.jsp';
</script>
<%
} else {
%>
<script>
    alert('예약을 실패하였습니다. 다시 시도해주세요.');
    history.back();
</script>
<%
    }
%>