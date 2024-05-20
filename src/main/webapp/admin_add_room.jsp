<%@ page import="com.example.database_project.dao.AccommodationDao" %>
<%@ page import="com.example.database_project.dto.AccommodationDto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="owner_form.js"></script>
    <title>객실 추가</title>

</head>
<body>
<%
    String accommodationIdParam = request.getParameter("accommodationId");
    int selectedAccommodationId = -1;
    if (accommodationIdParam != null && !accommodationIdParam.isEmpty()) {
        selectedAccommodationId = Integer.parseInt(accommodationIdParam);
    }

    AccommodationDao accommodationDao = AccommodationDao.getInstance();
    List<AccommodationDto> accommodations = accommodationDao.getAllAccommodations();
%>
<h1>[관리자 모드] 객실 정보 추가</h1>
<form name="addRoomForm" action="admin_insert_room.jsp" method="post" onsubmit="return validateAddRoom()">

      <table>
        <%
            if (selectedAccommodationId == -1) {
        %>
        <tr>
            <td>숙소(Accommodation):</td>
            <td>
                <select name="accommodationId" required>
                    <option value="">숙소 선택</option>
                    <%
                        for (AccommodationDto accommodation : accommodations) {
                    %>
                    <option value="<%= accommodation.getAccommodationId() %>">ID: <%= accommodation.getAccommodationId() %>, Name: <%= accommodation.getAccommodationName() %></option>
                    <%
                        }
                    %>
                </select>
            </td>
        </tr>
        <%
        } else {
            AccommodationDto selectedAccommodation = accommodationDao.getAccommodationById(selectedAccommodationId);
        %>
        <tr>
            <td>숙소(Accommodation):</td>
            <td>
                <input type="hidden" name="accommodationId" value="<%= selectedAccommodationId %>">
                <%= selectedAccommodation.getAccommodationName() %>
            </td>
        </tr>
        <%
            }
        %>
        <tr>
            <td>객실 타입(Room Type):</td>
            <td><input type="text" name="roomType" required></td>
        </tr>
          <tr>
              <td>허용 인원 수(Count):</td>
              <td><input type="number" name="count" required></td>
          </tr>
        <tr>
            <td>객실 수(Room Count):</td>
            <td><input type="number" name="roomCount" required></td>
        </tr>
        <tr>
            <td>가격(Price):</td>
            <td><input type="number" name="price" required></td>
        </tr>
        <tr>
            <td>노출여부(Availability):</td>
            <td>
                <select name="availability">
                    <option value="true">Yes</option>
                    <option value="false">No</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit">추가하기</button></td>
        </tr>
    </table>
</form>
</body>
</html>
