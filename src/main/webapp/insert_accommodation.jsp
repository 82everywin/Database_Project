<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ page import="com.example.database_project.dao.AccommodationDao" %>
<%@ page import="com.example.database_project.dto.AccommodationDto" %>

<%
    int ownerId = (int) session.getAttribute("OwnerID");

    request.setCharacterEncoding("utf-8");
    String category = request.getParameter("category");
    String name = request.getParameter("name");
    String location = request.getParameter("location");
    String grade = request.getParameter("grade");
    float rating = Float.parseFloat(request.getParameter("rating"));

    AccommodationDto accommodation = new AccommodationDto();
    accommodation.setOwnerId(ownerId);
    accommodation.setCategory(category);
    accommodation.setAccommodationName(name);
    accommodation.setLocation(location);
    accommodation.setGrade(grade);
    accommodation.setRating(rating);

    AccommodationDao accommodationDao = AccommodationDao.getInstance();
    boolean success = accommodationDao.insertAccommodation(accommodation);

    if (success) {
%>
<script>
    alert('객실 정보가 성공적으로 추가되었습니다.');
    window.location.href = 'owner_rooms.jsp';
</script>
<%
    } else {
        System.out.println("<script>alert('객실 정보 추가에 실패했습니다. 다시 시도해주세요.'); history.back();</script>");
    }
%>
