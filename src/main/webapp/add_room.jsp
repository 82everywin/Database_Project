<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="owner_form.js"></script>
    <title>객실 추가</title>

</head>
<body>
<h1>새로운 객실 정보 추가</h1>
<form name="addRoomForm" action="insert_room.jsp" method="post" onsubmit="return validateAddRoom()">

    <input type="hidden" name="accommodationId" value="<%= request.getParameter("accommodationId") %>">
    <table>
        <tr>
            <td>객실 타입(Room Type):</td>
            <td><input type="text" name="roomType" required></td>
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
