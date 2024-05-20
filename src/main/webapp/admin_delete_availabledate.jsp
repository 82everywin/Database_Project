<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ page import="com.example.database_project.dao.AccommodationDao" %>
<%@ page import="com.example.database_project.dao.DateDao" %>

<%
  int availabledateId = Integer.parseInt(request.getParameter("availabledateId"));
  DateDao dateDao = DateDao.getInstance();
  boolean success = dateDao.deleteDateById(availabledateId);

  if (success) {
%>
<script>
  alert('예약 가능 날짜가 성공적으로 삭제되었습니다.');
  window.location.href = 'select_availabledates.jsp';
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
