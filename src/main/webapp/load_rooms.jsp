<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="com.example.database_project.dao.RoomDao, com.example.database_project.dto.RoomDto" %>
<%
  String accommodationId = request.getParameter("accommodationId");

  RoomDao roomDao = RoomDao.getInstance();
  List<RoomDto> rooms = roomDao.getRoomsByAccommodationId(Integer.parseInt(accommodationId));
%>
<tr>
  <th>객실 고유번호(RoomID)</th>
  <th>객실 타입(RoomType)</th>
  <th>잔여 객실 수(RoomCount)</th>
  <th>가격(Price)</th>
  <th>노출여부(Availability)</th>
  <th> 비고 </th>
</tr>
<%
  for (RoomDto room : rooms) {

%>
<tr>
  <td><%= room.getRoomId() %></td>
  <td><%= room.getRoomType() %></td>
  <td><%= room.getRoomCount() %></td>
  <td><%= room.getPrice() %></td>
  <td><%= room.isAvailability() ? "Yes" : "No" %></td>
  <td>
    <button onclick="editRoom(<%= room.getRoomId()%>)">수정</button>
    <button onclick="deleteRoom(<%= room.getRoomId() %>, <%= accommodationId%>)">삭제</button>
  </td>
</tr>
<%
  }
%>
