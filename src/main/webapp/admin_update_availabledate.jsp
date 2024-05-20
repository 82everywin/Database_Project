<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.database_project.DBManager" %>
<%@ page import="com.example.database_project.dao.DateDao" %>
<%@ page import="com.example.database_project.dto.DateDto" %>
<%
    request.setCharacterEncoding("UTF-8");

    int availableDateID = Integer.parseInt(request.getParameter("availableDateID"));
    int roomId = Integer.parseInt(request.getParameter("roomId"));
    Date date = Date.valueOf(request.getParameter("date"));
    boolean isAvailable = Boolean.parseBoolean(request.getParameter("isAvailable"));

    DateDao dateDao = DateDao.getInstance();
    DateDto availabledate = new DateDto(availableDateID,roomId,date,isAvailable );

    boolean success = dateDao.updateDate(availabledate);

    if (success) {

%>
<script>
    alert("예약 가능일 정보가 성공적으로 수정되었습니다.");
    location.href = 'select_availabledates.jsp';
</script>
<%
} else {
%>
<script>
    alert("예약 가능일 정보 수정에 실패했습니다.");
    history.back();
</script>
<%
    }
%>
