<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <style>
        table {
            border: 1px solid #444444;
            padding: 5px;
            margin-left: auto;
            margin-right: auto;
        }

        .c {
            text-align: center;
        }
    </style>
    <script src="owner_form.js"> </script>
</head>
<body>

<p class="c">[관리자 모드] 회원 추가</p>
<form action="admin_insert_owner.jsp" method="post" name="join_form">
    <table>
        <tr>
            <td>Email</td>
            <td><input type="email" name="email"></td>
        </tr>

        <tr>
            <td>이름</td>
            <td><input type="text" name="name"></td>
        </tr>

        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pw"></td>
        </tr>

        <tr>
            <td>전화번호</td>
            <td><input type="text" name="phone"></td>
            <td>('-' 형식을 붙여주세요)</td>
        </tr>

        <tr>
            <td>사업자 등록 번호</td>
            <td><input type="text" name="license"></td>
            <td>('-' 형식을 붙여주세요)</td>
        </tr>
    </table>
    <br/>
    <div class="c">
        <button onclick="confirmJoin()">가입하기</button>
        <button type="reset">초기화</button>
    </div>
</form>

</body>
</html>
