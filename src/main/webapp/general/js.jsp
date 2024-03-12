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
        timer: 1500
    });
    <%
    } else {
    %>
    Swal.fire({
        position: "top-end",
        icon: "error",
        title: "Add Student Failed",
        showConfirmButton: false,
        timer: 1500
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
                timer: 1500
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
                timer: 1500
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
                timer: 1500
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
                timer: 1500
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
                timer: 1500
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
                timer: 1500
            });
        </script> 
        <%session.setAttribute("checkUpdateEvent", "sdsdsfdsf");%>
    </c:when>
</c:choose>

<!--check create event -->
<c:choose>
    <c:when test="${sessionScope.checkCreateEvent == 'success'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "You have create the event as successfully!",
                showConfirmButton: false,
                timer: 1500
            });
        </script> 
        <%session.setAttribute("checkCreateEvent", "sdsdsfdsf");%>
    </c:when>
    <c:when test="${sessionScope.checkCreateEvent == 'fail'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "warning",
                title: "You have create the the event as failure!",
                showConfirmButton: false,
                timer: 1500
            });
        </script> 
        <%session.setAttribute("checkCreateEvent", "sdsdsfdsf");%>
    </c:when>
</c:choose>
<!--alert check attendance -->
<c:choose>
    <c:when test="${sessionScope.checkAttendanceAlert == 'success'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "You have check attendance the event as successfully!",
                showConfirmButton: false,
                timer: 1500
            });
        </script> 
        <%session.setAttribute("checkAttendanceAlert", "sdsdsfdsf");%>
    </c:when>
    <c:when test="${sessionScope.checkAttendanceAlert == 'fail'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "warning",
                title: "You have check attendance the event as failure!",
                showConfirmButton: false,
                timer: 1500
            });
        </script> 
        <%session.setAttribute("checkAttendanceAlert", "sdsdsfdsf");%>
    </c:when>
</c:choose>
<!--alert evaluate student attendance -->
<c:choose>
    <c:when test="${sessionScope.checkEvaluateStudent == 'success'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "You have evaluate students the event as successfully!",
                showConfirmButton: false,
                timer: 1500
            });
        </script> 
        <%session.setAttribute("checkEvaluateStudent", "sdsdsfdsf");%>
    </c:when>
    <c:when test="${sessionScope.checkEvaluateStudent == 'fail'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "warning",
                title: "You have evaluate students the event as failure!",
                showConfirmButton: false,
                timer: 1500
            });
        </script> 
        <%session.setAttribute("checkEvaluateStudent", "sdsdsfdsf");%>
    </c:when>
</c:choose>

<script>
    Validator({
        form: "#createEvent",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#eventname", "Event name is required"),
            Validator.isRequire("#preparetime", "Preparation time is required"),
            Validator.isRequire("#holdtime", "Hold time is required"),
            Validator.isRequire("#location", "Location is required"),
            Validator.isRequire("#cost", "Cost is required"),
            Validator.isEmail("#exnum", "Expected number is required"),
            Validator.isRequire("#organization", "Organization is required"),
            Validator.isPhone("#feedback", "Feedback is not valid format"),
            Validator.isRequire("#endtime", "End time is required"),
            Validator.isRequire("#description", "Description is required"),
            Validator.isRequire("#typeOfEvent", "Type Of Event is required"),
            
        ]
    });
</script>
<script>
    Validator({
        form: "#createCompatition",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#eventname", "Event name is required"),
            Validator.isRequire("#preparetime", "Preparation time is required"),
            Validator.isRequire("#holdtime", "Hold time is required"),
            Validator.isRequire("#location", "Location is required"),
            Validator.isRequire("#cost", "Cost is required"),
            Validator.isEmail("#exnum", "Expected number is required"),
            Validator.isRequire("#organization", "Organization is required"),
            Validator.isPhone("#feedback", "Feedback is not valid format"),
            Validator.isRequire("#endtime", "End time is required"),
            Validator.isRequire("#description", "Description is required"),
            Validator.isRequire("#firtPrize", "Firt prize is required"),
            Validator.isRequire("#secondPrize", "Second prize is required"),
            Validator.isRequire("#thirdPrize", "Third prize is require"),
            Validator.isImage("#encouragementPrize", "Encouragement prize is required")
        ]
    });
</script>



