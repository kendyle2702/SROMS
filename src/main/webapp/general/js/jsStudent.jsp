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

<!-- Validate Sign-up Club -->
<script>
    document.querySelector("#uploadLogo").addEventListener('change', (e) => {
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
            document.querySelector('#logoImg').src = imageURL;
            document.querySelector('#logoImg').style.display = 'block';
        } else {
            document.querySelector('#logoImg').src = "";
            document.querySelector('#logoImg').style.display = 'none';
        }
    });
    Validator({
        form: "#formSignUpClub",
        message: ".message",
        invalid: "invalid",
        rules: [
            Validator.isRequire("#clubname", "Club Name is required"),
            Validator.isRequire("#description", "Description is required"),
            Validator.isRequire("#uploadLogo", "Logo is required"),
            Validator.isImage("#uploadLogo", "Logo must be image"),
        ]
    });
</script>

<script>
    <%
        String signUpClub = (String) session.getAttribute("signUpClub");
        if (signUpClub != null) {
            if (signUpClub.equals("success")) {
    %>
    Swal.fire({
        position: "top-end",
        icon: "success",
        title: "Sign up club successfully!",
        showConfirmButton: false,
        timer: 1000
    });
    <%
    } else {
    %>
    Swal.fire({
        position: "top-end",
        icon: "error",
        title: "Sign up club failed",
        showConfirmButton: false,
        timer: 1000
    });
    <%
            }
        }
        session.removeAttribute("signUpClub");
    %>
</script>


<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('deleteMemberClub').addEventListener('click', function (event) {
            event.preventDefault(); // Prevent the default link behavior

            // S? d?ng SweetAlert2 ?? x�c nh?n h�nh ??ng x�a
            Swal.fire({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, delete it!"
            }).then((result) => {
                if (result.isConfirmed) {
                    // N?u ng??i d�ng x�c nh?n x�a, chuy?n h??ng ??n URL ?� x�c nh?n x�a
                    window.location.href = document.getElementById('deleteMemberClub').getAttribute('href');
                }
            });
        });
    });
</script>


<c:choose>
    <c:when test="${sessionScope.checkUpdateRole == 'success'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "You have updated the role of member as successfully!",
                showConfirmButton: false,
                timer: 1500
            });
            <%session.setAttribute("checkUpdateRole", "sdsdsfdsf");%>
        </script> 
    </c:when>
    <c:when test="${sessionScope.checkUpdateRole == 'fail'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "warning",
                title: "You have updated the role of member as failure!",
                showConfirmButton: false,
                timer: 1500
            });
            <%session.setAttribute("checkUpdateRole", "sdsdsfdsf");%>
        </script> 
    </c:when>
</c:choose>

<!--Alert delete member-->
<c:choose>
    <c:when test="${sessionScope.checkDeleteMember == 'success'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "You have deleted the member as successfully!",
                showConfirmButton: false,
                timer: 1500
            });
            <%session.setAttribute("checkDeleteMember", "sdsdsfdsf");%>
        </script> 
    </c:when>
    <c:when test="${sessionScope.checkDeleteMember == 'fail'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "warning",
                title: "You have deleted the member as failure!",
                showConfirmButton: false,
                timer: 1500
            });
            <%session.setAttribute("checkDeleteMember", "sdsdsfdsf");%>
        </script> 
    </c:when>
</c:choose>
<!--Alert check request join club for student accept-->
<c:choose>
    <c:when test="${sessionScope.checkRequestJoinAccept == 'success'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "You have accepted the member as successfully!",
                showConfirmButton: false,
                timer: 1500
            });
            <%session.setAttribute("checkRequestJoinAccept", "sdsdsfdsf");%>
        </script> 
    </c:when>
    <c:when test="${sessionScope.checkRequestJoinAccept == 'fail'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "warning",
                title: "You have accepted the member as failure!",
                showConfirmButton: false,
                timer: 1500
            });
            <%session.setAttribute("checkRequestJoinAccept", "sdsdsfdsf");%>
        </script> 
    </c:when>
</c:choose>

<!--Alert check request join club for student reject-->
<c:choose>
    <c:when test="${sessionScope.checkRequestJoinReject == 'success'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "You have rejected the member as successfully!",
                showConfirmButton: false,
                timer: 1500
            });
            <%session.setAttribute("checkRequestJoinReject", "sdsdsfdsf");%>
        </script> 
    </c:when>
    <c:when test="${sessionScope.checkRequestJoinReject == 'fail'}">
               <script>
            Swal.fire({
                position: "top-end",
                icon: "warning",
                title: "You have rejected the member as failure!",
                showConfirmButton: false,
                timer: 1500
            });
            <%session.setAttribute("checkRequestJoinReject", "sdsdsfdsf");%>
        </script> 
    </c:when>
</c:choose>

<!--alert remove request-->
<c:choose>
    <c:when test="${sessionScope.checkRequestJoinRemove == 'success'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "You have removed the member as successfully!",
                showConfirmButton: false,
                timer: 1500
            });
            <%session.setAttribute("checkRequestJoinRemove", "sdsdsfdsf");%>
        </script> 
    </c:when>
    <c:when test="${sessionScope.checkRequestJoinRemove == 'fail'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "warning",
                title: "You have removed the member as failure!",
                showConfirmButton: false,
                timer: 1500
            });
            <%session.setAttribute("checkRequestJoinRemove", "sdsdsfdsf");%>
        </script> 
    </c:when>
</c:choose>


<script>
    $(document).ready(function () {
        $('#viewMemberRequest').DataTable();
    });
</script>
<script>
    $(document).ready(function () {
        $('#viewMyClub').DataTable();
    });
</script>
<script>
    $(document).ready(function () {
        $('#viewEventsHistory').DataTable();
    });
</script>

<script>
    Validator({
        form: "#createEventFormal",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#eventname", "Event Name is required"),
            Validator.isRequire("#pretime", "Preparation Time is required"),
            Validator.isRequire("#holdtime", "Start Time is required"),
            Validator.isRequire("#endtime", "End Time is required"),
            Validator.isRequire("#location", "Location is required"),
            Validator.isRequire("#cost", "Cost is required"),
            Validator.isPositive("#cost", "Cost must be postive integer"),
            Validator.isRequire("#exnum", "Expected Number is required"),
            Validator.isPositive("#exnum", "Expected Number must be postive integer"),

            Validator.isRequire("#organization", "Organization is required"),
            Validator.isRequire("#feedback", "Feedback is required"),
            Validator.isRequire("#description", "Description is required"),
        ]
    });
</script>     
<script>
    Validator({
        form: "#createCompetition",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#eventname", "Event Name is required"),
            Validator.isRequire("#pretime", "Preparation Time is required"),
            Validator.isRequire("#holdtime", "Start Time is required"),
            Validator.isRequire("#endtime", "End Time is required"),
            Validator.isRequire("#location", "Location is required"),
            Validator.isRequire("#cost", "Cost is required"),
            Validator.isPositive("#cost", "Cost must be postive integer"),
            Validator.isRequire("#exnum", "Expected Number is required"),
            Validator.isPositive("#exnum", "Expected Number must be postive integer"),

            Validator.isRequire("#organization", "Organization is required"),
            Validator.isRequire("#feedback", "Feedback is required"),
            Validator.isRequire("#description", "Description is required"),
            Validator.isRequire("#firtPrize", "First Prize is required"),
            Validator.isPositive("#firtPrize", "First Prize must be postive integer"),
            Validator.isRequire("#secondPrize", "Second Prize is required"),
            Validator.isPositive("#secondPrize", "Second Prize must be postive integer"),
            Validator.isRequire("#thirdPrize", "Third Prize is required"),
            Validator.isPositive("#thirdPrize", "Third Prize must be postive integer"),
            Validator.isRequire("#encouragementPrize", "Encouragement Prize is required"),
        ]
    });
</script>  


<!--point and feedback club-->
<c:choose>
    <c:when test="${sessionScope.checkRequestJoin == 'success'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "Thank for your feedback the member",
                showConfirmButton: false,
                timer: 1500
            });
            <%session.setAttribute("checkEvaluateStudentMember", "sdsdsfdsf");%>
        </script> 
    </c:when>
    <c:when test="${sessionScope.checkRequestJoin == 'fail'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "warning",
                title: "false for feedback!",
                showConfirmButton: false,
                timer: 1500
            });
            <%session.setAttribute("checkEvaluateStudentMember", "sdsdsfdsf");%>
        </script> 
    </c:when>
</c:choose>
