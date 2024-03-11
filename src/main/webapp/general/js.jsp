<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js/feather.min.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/slimscroll/jquery.slimscroll.min.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
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

<!--Student Profile alert-->
<script>
    Validator({
        form: "#formCreateStudent",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#firstname", "First Name is required"),
            Validator.isRequire("#lastname", "Last Name is required"),
            Validator.isRequire("#birthdate", "Birthdate is required"),
            Validator.isRequire("#enrolldate", "Enroll Date is required"),
            Validator.isRequire("#email", "Email is required"),
            Validator.isEmail("#email", "Email is not valid format"),
            Validator.isRequire("#phone", "Phone is required"),
            Validator.isPhone("#phone", "Phone is not valid format"),
            Validator.isRequire("#rollnumber", "Roll Number is required"),
            Validator.isRequire("#membercode", "Member Code is required"),
            Validator.isRequire("#major", "Major is required"),
            Validator.isRequire("#mode", "Mode is required"),
            Validator.isRequire("#address", "Address is required"),
            Validator.isRequire("#uploadAvatar", "Avatar must be require"),
            Validator.isImage("#uploadAvatar", "Avatar must be image"),
        ]
    });
</script>
<script>
    <%
        String createStudent = (String) session.getAttribute("createStudent");
        if (createStudent != null) {
            if (createStudent.equals("success")) {
    %>
    Swal.fire({
        position: "top-end",
        icon: "success",
        title: "Add Student Successfully!",
        showConfirmButton: false,
        timer: 1000
    });
    <%
    } else {
    %>
    Swal.fire({
        position: "top-end",
        icon: "error",
        title: "Add Student Failed",
        showConfirmButton: false,
        timer: 1000
    });
    <%
            }
        }
        session.removeAttribute("createStudent");
    %>
</script>
<!--alert check request accept -->
<c:choose>
    <c:when test="${sessionScope.checkRequestClub   == 'acceptSuccess'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "You have successfully accepted the club!",
                showConfirmButton: false,
                timer: 1000
            });
        </script>
        <%session.setAttribute("checkRequestClub", "sdsdsfdsf");%>
    </c:when>
    <c:when test="${sessionScope.checkRequestClub   == 'rejectSuccess'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "You have successfully rejected the club!",
                showConfirmButton: false,
                timer: 1000
            });
        </script>  
        <%session.setAttribute("checkRequestClub", "sdsdsfdsf");%>
    </c:when> 

</c:choose>
<c:choose>
    <c:when test="${sessionScope.checkRequestClub   == 'acceptFail'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "warning",
                title: "You have accepted the club as failure!",
                showConfirmButton: false,
                timer: 1000
            });
        </script> 
        <%session.setAttribute("checkRequestClub", "sdsdsfdsf");%>
    </c:when>
    <c:when test="${sessionScope.checkRequestClub   == 'rejectFail'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "warning",
                title: "You have rejected the club as failure!",
                showConfirmButton: false,
                timer: 1000
            });
        </script> 
        <%session.setAttribute("checkRequestClub", "sdsdsfdsf");%>
    </c:when>

</c:choose>
<c:choose>
    <c:when test="${sessionScope.checkUpdateEvent == 'success'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "You have updated the event as successfully!",
                showConfirmButton: false,
                timer: 1000
            });
        </script> 
        <%session.setAttribute("checkUpdateEvent", "sdsdsfdsf");%>
    </c:when>
    <c:when test="${sessionScope.checkUpdateEvent == 'failed'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "warning",
                title: "You have updated the the event as failure!",
                showConfirmButton: false,
                timer: 1000
            });
        </script> 
        <%session.setAttribute("checkUpdateEvent", "sdsdsfdsf");%>
    </c:when>
</c:choose>


<!--Status register and join for Student-->
<script>
    <%
        String statusJoinEvent = (String) session.getAttribute("joinEvent");
        String statusRegisterClub = (String) session.getAttribute("registerClub");
        if (statusJoinEvent != null) {
            if (statusJoinEvent.equals("success")) {
    %>
    Swal.fire({
        position: "top-end",
        icon: "success",
        title: "You have successfully registered for the event!",
        showConfirmButton: false,
        timer: 1500
    });
    <%
    } else if (statusJoinEvent.equals("fail")) {
    %>
    Swal.fire({
        position: "top-end",
        icon: "error",
        title: "Registration failed. Please try again later.",
        showConfirmButton: false,
        timer: 1500
    });
    <%
            }
        }
        session.removeAttribute("joinEvent");

        if (statusRegisterClub != null) {
            if (statusRegisterClub.equals("success")) {
    %>
    Swal.fire({
        position: "top-end",
        icon: "success",
        title: "You have successfully registered for the club!",
        showConfirmButton: false,
        timer: 1500
    });
    <%
    } else if (statusRegisterClub.equals("fail")) {
    %>
    Swal.fire({
        position: "top-end",
        icon: "error",
        title: "Registration failed. Please try again later.",
        showConfirmButton: false,
        timer: 1500
    });
    <%
            }
        }
        session.removeAttribute("registerClub");
    %>
</script>
<!--Edit Student Profile by Admin-->
<script>
    <%
        String editStudent = (String) session.getAttribute("editStudent");
        if (editStudent != null) {
            if (editStudent.equals("success")) {
    %>
    Swal.fire({
        position: "top-end",
        icon: "success",
        title: "Edit Student Successfully!",
        showConfirmButton: false,
        timer: 1000
    });
    <%
    } else {
    %>
    Swal.fire({
        position: "top-end",
        icon: "error",
        title: "Edit Student Failed",
        showConfirmButton: false,
        timer: 1000
    });
    <%
            }
        }
        session.removeAttribute("editStudent");
    %>
</script>
<script>
    Validator({
        form: "#formEditStudent",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#firstname", "First Name is required"),
            Validator.isRequire("#lastname", "Last Name is required"),
            Validator.isRequire("#birthdate", "Birthdate is required"),
            Validator.isRequire("#enrolldate", "Enroll Date is required"),
            Validator.isRequire("#email", "Email is required"),
            Validator.isEmail("#email", "Email is not valid format"),
            Validator.isRequire("#phone", "Phone is required"),
            Validator.isPhone("#phone", "Phone is not valid format"),
            Validator.isRequire("#rollnumber", "Roll Number is required"),
            Validator.isRequire("#membercode", "Member Code is required"),
            Validator.isRequire("#major", "Major is required"),
            Validator.isRequire("#mode", "Mode is required"),
            Validator.isRequire("#address", "Address is required"),
        ]
    });
</script> 
<script>
    document.querySelector("#banAccount").addEventListener("click", function (event) {
        event.preventDefault();
        Swal.fire({
            title: "Are you sure?",
            text: "Are you sure to ban the account ?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, ban it!"
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = document.querySelector("#banAccount").href;
            }
        });
    });

    document.querySelector("#unbanAccount").addEventListener("click", function (event) {
        event.preventDefault();
        Swal.fire({
            title: "Are you sure?",
            text: "Do you want to unban the account?",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, unban it!"
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = document.querySelector("#unbanAccount").href;
            }
        });
    });
</script>

