<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ page import="com.example.database_project.dao.AccommodationDao" %>

<%
    int accommodationId = Integer.parseInt(request.getParameter("accommodationId"));
    AccommodationDao accommodationDao = AccommodationDao.getInstance();
    boolean success = accommodationDao.deleteAccommodationById(accommodationId);

    if (success) {
%>
<script>
    alert('숙소가 성공적으로 삭제되었습니다.');
    window.location.href = 'select_accommodations.jsp';
</script>
<%
} else {
%>
<script>
    alert('숙소 삭제에 실패했습니다. 다시 시도해주세요.');
    history.back();
</script>
<%
    }
%>
