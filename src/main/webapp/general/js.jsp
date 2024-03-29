<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js/feather.min.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/slimscroll/jquery.slimscroll.min.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/chart-data.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/simple-calendar/jquery.simple-calendar.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js/calander.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js/circle-progress.min.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js" data-cf-settings="18ee449b9b2154c0cc5581ea-|49" defer></script></body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.all.min.js" type="text/javascript"></script>>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/Validator.js"></script>

<script>
    $(document).ready(function () {
        $("#viewEvents").DataTable();
    });
    $(document).ready(function () {
        $("#viewClubs").DataTable();
    });
    $(document).ready(function () {
        $("#viewStudents").DataTable();
    });
    $(document).ready(function () {
        $("#viewClubList").DataTable();
    });
</script>


<!--Edit avatar and validate-->
<script>
    document.querySelector("#uploadAvatar").addEventListener('change', (e) => {
        const selectedFile = e.target.files[0];
        let isImg = false;
        let endFile = selectedFile.name.split(".")[selectedFile.name.split(".").length - 1];
        if (endFile == "jpeg" || endFile == "jpg" || endFile == "png" || endFile == "gif" || endFile == "webp") {
            isImg = true;
        } else {
            isImg = false;
        }
        if (isImg) {
            const imageURL = URL.createObjectURL(selectedFile);
            document.querySelector('#avatarImg').src = imageURL;
            document.querySelector('#avatarImg').style.display = 'block';
        } else {
            document.querySelector('#avatarImg').src = "";
            document.querySelector('#avatarImg').style.display = 'none';
        }
    });
    Validator({
        form: "#formEditProfile",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#firstname", "First Name is required"),
            Validator.isRequire("#lastname", "Last Name is required"),
            Validator.isRequire("#birthdate", "Birthdate is required"),
            Validator.isRequire("#address", "Address is required"),
            Validator.isRequire("#phone", "Phone is required"),
            Validator.isPhone("#phone", "Phone is not valid"),
            Validator.isImage("#uploadAvatar", "Avatar must be image"),
        ]
    });
</script>
<!--Edit Profile alert-->
<script>
    <%
        String editStatus = (String) session.getAttribute("editStatus");
        if (editStatus != null) {
            if (editStatus.equals("success")) {
    %>
    Swal.fire({
        position: "top-end",
        icon: "success",
        title: "Edited Successfully!",
        showConfirmButton: false,
        timer: 1000
    });
    <%
    } else {
    %>
    Swal.fire({
        position: "top-end",
        icon: "error",
        title: "Edit Failed",
        showConfirmButton: false,
        timer: 1000
    });
    <%
            }
        }
        session.removeAttribute("editStatus");
    %>
</script>


<%@include file="./js/jsAdmin.jsp" %>
<%@include file="./js/jsEventManger.jsp" %>
<%@include file="./js/jsClubManager.jsp" %>
<%@include file="./js/jsStudent.jsp" %>




