<%@ page import="com.example.database_project.dao.OwnerDao" %>
<%@ page import="com.example.database_project.dto.OwnerDto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소 추가하기</title>
    <script src="owner_form.js"></script>
</head>
<body>
<%
    OwnerDao dao = OwnerDao.getInstance();
    List<OwnerDto> owners = dao.getAllOwners();
%>
<h1>[관리자 모드] 숙소 추가</h1>
<form name="accommodationForm" action="admin_insert_accommodation.jsp" method="post" onsubmit="return validateForm()">
    <table>
        <tr>
        <td> 대표인(Owner):</td>
        <td>
            <select name="ownerId" required>
                <option value="">대표인 선택</option>
                <%
                    for (OwnerDto owner : owners) {
                %>
                <option value="<%= owner.getOwnerId() %>">ID: <%= owner.getOwnerId() %> , Name : <%= owner.getOwnerName() %></option>
                <%
                    }
                %>
            </select>
        </td>
        </tr>
        <tr>
            <td>종류(Category):</td>
            <td>
                <select id="category" name="category" onchange="toggleGradeField()" required>
                    <option value="">구분 선택</option>
                    <option value="호텔/리조트">호텔/리조트</option>
                    <option value="게스트하우스">게스트하우스</option>
                    <option value="모텔">모텔</option>
                    <option value="펜션/풀빌라">펜션/풀빌라</option>
                    <option value="글램핑/캠핑">글램핑/캠핑</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>이름(AccommodationName):</td>
            <td><input type="text" name="name" required></td>
        </tr>
        <tr>
            <td>위치(Location):</td>
            <td><input type="text" name="location" required></td>
        </tr>
        <tr id="gradeRow" style="display:none;">
            <td>성급(Grade):</td>
            <td><input type="text" name="grade"></td>
        </tr>
        <tr>
            <td>별점(Rating):</td>
            <td><input type="text" name="rating" value="0.0" ></td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit">추가하기</button></td>
        </tr>
    </table>
</form>
</body>
</html>
