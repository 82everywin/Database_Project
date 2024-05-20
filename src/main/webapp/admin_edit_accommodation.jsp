<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.database_project.dao.AccommodationDao" %>
<%@ page import="com.example.database_project.dto.AccommodationDto" %>
<%@ page import="com.example.database_project.dao.OwnerDao" %>
<%@ page import="com.example.database_project.dto.OwnerDto" %>
<%
    int accommodationId = Integer.parseInt(request.getParameter("accommodationId"));
    AccommodationDao accommodationDao = AccommodationDao.getInstance();
    AccommodationDto accommodation = accommodationDao.getAccommodationById(accommodationId);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>정보 수정</title>
</head>
<body>
<%
    OwnerDao dao = OwnerDao.getInstance();
    List<OwnerDto> owners = dao.getAllOwners();
%>
<h1>[관리자 모드] 숙소 기본 정보 수정</h1>
<form action="admin_update_accommodation.jsp" method="post">
    <input type="hidden" name="accommodationId" value="<%= accommodationId %>">
    <table>
        <tr>
            <td>대표인(Owner):</td>
            <td>
                <select name="ownerId" required>
                    <option value="">대표인 선택</option>
                    <%
                        for (OwnerDto owner : owners) {
                    %>
                    <option value="<%= owner.getOwnerId() %>" <%= owner.getOwnerId() == accommodation.getOwnerId() ? "selected" : "" %>>ID: <%= owner.getOwnerId() %> , Name : <%= owner.getOwnerName() %></option>
                    <%
                        }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td>종류(Category):</td>
            <td>
                <select id="category" name="category" required>
                    <option value="" <%= accommodation.getCategory() == null ? "selected" : "" %>>구분 선택</option>
                    <option value="호텔/리조트" <%= "호텔/리조트".equals(accommodation.getCategory()) ? "selected" : "" %>>호텔/리조트</option>
                    <option value="게스트하우스" <%= "게스트하우스".equals(accommodation.getCategory()) ? "selected" : "" %>>게스트하우스</option>
                    <option value="모텔" <%= "모텔".equals(accommodation.getCategory()) ? "selected" : "" %>>모텔</option>
                    <option value="펜션/풀빌라" <%= "펜션/풀빌라".equals(accommodation.getCategory()) ? "selected" : "" %>>펜션/풀빌라</option>
                    <option value="글램핑/캠핑" <%= "글램핑/캠핑".equals(accommodation.getCategory()) ? "selected" : "" %>>글램핑/캠핑</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>이름(AccommodationName):</td>
            <td><input type="text" name="name" value="<%= accommodation.getAccommodationName() %>"></td>
        </tr>
        <tr>
            <td>위치(Location):</td>
            <td><input type="text" name="location" value="<%= accommodation.getLocation() %>"></td>
        </tr>
        <tr>
            <td>성급(Grade):</td>
            <td><input type="text" name="grade" value="<%= accommodation.getGrade() %>"></td>
        <tr>
            <td>별점(Rating):</td>
            <td><input type="text" name="rating" value="<%= accommodation.getRating() %>"></td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit">수정하기 </button></td>
        </tr>
    </table>
</form>
</body>
</html>
