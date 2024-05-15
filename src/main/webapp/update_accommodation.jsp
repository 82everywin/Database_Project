<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.database_project.dao.AccommodationDao" %>
<%@ page import="com.example.database_project.dto.AccommodationDto" %>
<%
    request.setCharacterEncoding("utf-8");
    int accommodationId = Integer.parseInt(request.getParameter("accommodationId"));
    String category = request.getParameter("category");
    String name = request.getParameter("name");
    String location = request.getParameter("location");
    String grade = request.getParameter("grade");

    AccommodationDao accommodationDao = AccommodationDao.getInstance();
    AccommodationDto accommodation = new AccommodationDto(accommodationId, category, name, location, grade);

    accommodationDao.updateAccommodation(accommodation);
    response.sendRedirect("owner_rooms.jsp");
%>
