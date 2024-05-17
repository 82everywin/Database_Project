function toggleAll(source) {
    checkboxes = document.querySelectorAll('input[type="checkbox"]');
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i] !== source)
            checkboxes[i].checked = source.checked;
    }
}

function uncheckAll() {
    document.getElementById('search_all').checked = false;
}

document.addEventListener('DOMContentLoaded', (event) => {
    document.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
        if (checkbox.id !== 'search_all') {
            checkbox.addEventListener('click', uncheckAll);
        }
    });
});

function confirmLogin() {
    if(document.login_form.email.value === ""){
        alert("이메일을 입력하세요.");
        document.login_form.email.focus();
        return;
    }

    if(document.login_form.pw.value === ""){
        alert("비밀번호를 입력하세요.");
        document.login_form.pw.focus();
        return;
    }

    document.login_form.submit();
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
        location.href = 'delete_user.jsp';
    }
}