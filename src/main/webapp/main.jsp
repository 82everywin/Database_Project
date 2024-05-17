<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Main</title>
    <script src="form.js"></script>
</head>
<body>
<h2><%= session.getAttribute("name")%>님 안녕하세요</h2>
<p><%= session.getAttribute("email")%></p>

<button onclick="location.href='logout.jsp'">로그아웃</button>
<button onclick="location.href='edit_user.jsp'">회원정보 수정</button>
<button onclick="confirmDelete()">탈퇴하기</button>
<hr>

<h1>숙박업소 검색</h1>
<form action="select_results.jsp" method="get">
    <h2>[전체 검색] </h2>
    정렬 기준:
    <select name="choice_order">
        <option value="price">가격</option>
        <option value="rating">평점</option>
    </select>

    <select name="choice_high_low">
        <option value="desc">높은순</option>
        <option value="asc">낮은순</option>
    </select>
    <br>
    <button type="submit" name="search_type" value="order">검색</button>
    <br>

    <h2>[상세 조회 검색] </h2>
    <h4>✅ 체크박스를 활용하여 원하는 검색을 해주세😀</h4>
    <h3> 📌위치로 검색</h3>
    <input type="checkbox" name="search_detail" value="location">
    위치: <input type="text" name="location" >
    <br>

    <h3> 📌이름으로 검색</h3>
    <input type="checkbox" name="search_detail" value="name">
    이름: <input type="text" name="name" >
    <br>

    <h3> 📌카테고리로 검색</h3>
    <input type="checkbox" name="search_detail" value="category">
    카테고리:
    <select name="category" >
        <option value="호텔/리조트">호텔/리조트</option>
        <option value="펜션/풀빌라">펜션/풀빌라</option>
        <option value="모텔">모텔</option>
        <option value="게스트하우스">게스트 하우스</option>
        <option value="글램핑/캠핑">글램핑/캠핑</option>
    </select>
    <br>

    <h3>📌가격대로 검색</h3>
    <input type="checkbox" name="search_detail" value="price">
    가격대:
    <br>
    최소 가격: <input type="number" name="min_price" >
    최대 가격: <input type="number" name="max_price" >
    <br>

    <h3> 📌평점으로 검색</h3>
    평점:
    <input type="checkbox" name="search_detail" value="rating">
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
    <br>
    <button type="submit" name="search_type" value="detail">검색</button>
    <br>

</form>
</body>
</html>
