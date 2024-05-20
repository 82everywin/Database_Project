<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.database_project.dto.DateDto" %>
<%@ page import="com.example.database_project.dao.DateDao" %>
<%
    request.setCharacterEncoding("UTF-8");

    int roomId = Integer.parseInt(request.getParameter("roomId"));
    Date date = Date.valueOf(request.getParameter("date"));
    boolean isAvailable = Boolean.parseBoolean(request.getParameter("isAvailable"));

    DateDto availabledate = new DateDto();
    availabledate.setRoomid(roomId);
    availabledate.setDate(date);
    availabledate.setAvailable(isAvailable);

    DateDao dateDao = DateDao.getInstance();
    boolean success = dateDao.insertAvailableDate(availabledate);

    if (success) {
%>
<script>
    alert('예약 가능일 정보가 성공적으로 추가되었습니다.');
    window.location.href = 'select_availabledates.jsp';
</script>
<%
    } else {
        System.out.println("<script>alert('예약 가능일 정보 추가에 실패했습니다. 다시 시도해주세요.'); history.back();</script>");
    }
%>
