function confirmLogin() {
    if(document.owner_login_form.email.value === ""){
        alert("이메일을 입력하세요.");
        document.owner_login_form.email.focus();
        return;
    }

     if(document.owner_login_form.pw.value === ""){
        alert("비밀번호를 입력하세요.");
        document.owner_login_form.pw.focus();
        return;
    }

    document.owner_login_form.submit();
}

function confirmJoin() {
    if(document.join_form.email.value === ""){
        alert("이메일을 입력하세요.");
        document.join_form.email.focus();
        return;
    }

    if(document.join_form.pw.value === ""){
        alert("비밀번호를 입력하세요.");
        document.join_form.pw.focus();
        return;
    }

    if(document.join_form.name.value === ""){
        alert("이름을 입력하세요.");
        document.join_form.name.focus();
        return;
    }

    if(document.join_form.phone.value === ""){
        alert("전화번호를 입력하세요.");
        document.join_form.phone.focus();
        return;
    }

    if(document.join_form.license.value === ""){
        alert("사업자번호를 입력하세요.");
        document.join_form.license.focus();
        return;
    }

    document.join_form.submit();
}

function confirmModify() {
    var name = document.modify_form.name.value;
    var phone = document.modify_form.phone.value;

    if (name === "") {
        alert("이름을 입력하세요.");
        document.modify_form.name.focus();
        return false;
    }

    if (phone === "") {
        alert("전화번호를 입력하세요.");
        document.modify_form.phone.focus();
        return false;
    }
    return true;
}

function confirmChangePassword() {
    var currentPw = document.change_pw_form.current_pw.value;
    var newPw = document.change_pw_form.new_pw.value;
    var confirmPw = document.change_pw_form.confirm_pw.value;

    if (currentPw === "") {
        alert("기존 비밀번호를 입력하세요.");
        document.change_pw_form.current_pw.focus();
        return false;
    }

    if (newPw === "") {
        alert("새 비밀번호를 입력하세요.");
        document.change_pw_form.new_pw.focus();
        return false;
    }

    if (confirmPw === "") {
        alert("새 비밀번호 확인을 입력하세요.");
        document.change_pw_form.confirm_pw.focus();
        return false;
    }

    if (newPw !== confirmPw) {
        alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        document.change_pw_form.confirm_pw.focus();
        return false;
    }

    return true;
}


function confirmDelete() {
    if (confirm("정말로 탈퇴하시겠습니까?")) {
        location.href = 'delete_owner.jsp';
    }
}

function loadRoomInfo(accommodationId) {
    fetch('load_rooms.jsp?accommodationId='+ accommodationId)
        .then(response => response.text())
        .then(data => {
            document.getElementById('roomsTable').innerHTML = data;
        })
        .catch(error => console.error('Error',error));
}

function loadReservationInfo(accommodationId) {
    fetch('load_reservations.jsp?accommodationId=' + accommodationId)
        .then(response => response.text())
        .then(data => {
            document.getElementById('reservationTable').innerHTML = data;
        })
        .catch(err => console.error('Error', err));
}

function  editAccommodation(accommodationId){
    window.location.href = 'edit_accommodation.jsp?accommodationId=' + accommodationId;
}

function deleteAccommodation(accommodationId) {
    if(confirm("정말로 삭제하시겠습니까?")){
        window.location.href = 'delete_accommodation.jsp?accommodationId=' + accommodationId;
    }
}

function validateForm() {
    var category = document.forms["accommodationForm"]["category"].value;
    var name = document.forms["accommodationForm"]["name"].value;
    var location = document.forms["accommodationForm"]["location"].value;
    var grade = document.forms["accommodationForm"]["grade"].value;

    if (category == "" || name == "" || location == "") {
        alert("양식을 채워주세요");
        if (category == "") {
            document.forms["accommodationForm"]["category"].focus();
        } else if (name == "") {
            document.forms["accommodationForm"]["name"].focus();
        } else if (location == "") {
            document.forms["accommodationForm"]["location"].focus();
        }
        return false;
    }
    if (category == "호텔/리조트" && grade == "") {
        alert("성급을 입력해주세요");
        document.forms["accommodationForm"]["grade"].focus();
        return false;
    }
    return true;
}

function toggleGradeField() {
    var category = document.getElementById("category").value;
    var gradeRow = document.getElementById("gradeRow");
    if (category === "호텔/리조트") {
        gradeRow.style.display = "table-row";
    } else {
        gradeRow.style.display = "none";
    }
}

function validateAddRoom() {
    var roomType = document.forms["addRoomForm"]["roomType"].value;
    var roomCount = document.forms["addRoomForm"]["roomCount"].value;
    var price = document.forms["addRoomForm"]["price"].value;
    if (roomType == "" || roomCount == "" || price == "") {
        alert("모든 필드를 채워주세요.");
        return false;
    }
    return true;
}

function editRoom(roomId) {
    window.location.href = 'edit_room.jsp?roomId='+ roomId;
}
function deleteRoom(roomId, accommodationId) {
    if (confirm('정말로 삭제하시겠습니까?')) {
        window.location.href = 'delete_room.jsp?roomId=' + roomId + '&accommodationId=' + accommodationId;
    }
}

