<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ page import="com.example.database_project.dao.AccommodationDao" %>
<%@ page import="com.example.database_project.dto.AccommodationDto" %>
<%
    request.setCharacterEncoding("utf-8");

    int accommodationId = Integer.parseInt(request.getParameter("accommodationId"));
    int ownerId = Integer.parseInt(request.getParameter("ownerId"));
    String category = request.getParameter("category");
    String name = request.getParameter("name");
    String location = request.getParameter("location");
    String grade = request.getParameter("grade");
    float rating = Float.parseFloat(request.getParameter("rating"));

    AccommodationDao accommodationDao = AccommodationDao.getInstance();
    AccommodationDto accommodation = new AccommodationDto(accommodationId, ownerId, category, name, location, grade, rating);

    boolean success = accommodationDao.updateAccommodationByAdmin(accommodation);

    if(success) {

%>
<script>
    alert("숙소 정보가 성공적으로 수정되었습니다.");
    location.href = 'select_accommodations.jsp';
</script>
<%
    } else {
%>
<script>
    alert("숙소 정보 수정에 실패했습니다.");
    history.back();
</script>
<%
    }
%>
