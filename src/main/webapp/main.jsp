<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Home</title>
    <script src="form.js"></script>
</head>
<body>
<h2><%= session.getAttribute("name")%>님 안녕하세요</h2><br/>
<p><%= session.getAttribute("email")%></p>
<br/>
<hr>
<button onclick="location.href='logout.jsp'">로그아웃</button>
<button onclick="location.href='edit_user.jsp'">회원정보 수정</button>
<button onclick="confirmDelete()">탈퇴하기</button>
<p>------------------------------------------------------------</p>
<h1>숙박업소 검색</h1>
<form action="select_results.jsp" method="get">
    <h3>가격대로 검색</h3>
    최소 가격: <input type="number" name="min_price" >
    최대 가격: <input type="number" name="max_price" >
    <br>
    <button type="submit" name="search_type" value="price">가격대로 검색</button>
    <br>

    <h3>위치 및 이름으로 검색</h3>
    위치: <input type="text" name="location" >
    <br>
    <button type="submit" name="search_type" value="location">위치로 검색</button>
    <br>

    <h3>평점으로 검색</h3>
    평점:
    <select name="rating" >
        <option value="0">0 이상</option>
        <option value="0.5">0.5 이상</option>
        <option value="1">1 이상</option>
        <option value="1.5">1.5 이상</option>
        <option value="2">2 이상</option>
        <option value="2.5">2.5 이상</option>
        <option value="3">3 이상</option>
        <option value="3.5">3.5 이상</option>
        <option value="4">4 이상</option>
        <option value="4.5">4.5 이상</option>
        <option value="5">5 이상</option>
    </select>
    <br><br>

    <h3>정렬 기준</h3>
    정렬 기준:
    <select name="sort_order" required>
        <option value="price_asc">낮은 가격순</option>
        <option value="price_desc">높은 가격순</option>
        <option value="rating_asc">낮은 평점순</option>
        <option value="rating_desc">높은 평점순</option>
    </select>
    <br>
    <button type="submit" name="search_type" value="rating">평점으로 검색</button>
    <br>

</form>
</body>
</html>