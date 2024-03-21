<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="DAOs.UserProfileDAO"%>
<%@page import="java.util.HashMap"%>
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
    <%} else if (createStudent.equals("failDate")) {%>
    Swal.fire({
        icon: "error",
        title: "Date not valid!",
        text: "Birthdate must be less than Enroll Date!",
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
    <%} else if (editStudent.equals("failDate")) {%>
    Swal.fire({
        icon: "error",
        title: "Date not valid!",
        text: "Birthdate must be less than Enroll Date!",
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
            text: "Are you sure to block the account?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, block it!"
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
            text: "Do you want to unblock the account?",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, unblock it!"
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = document.querySelector("#unbanAccount").href;
            }
        });
    });
</script>


<script>
    Validator({
        form: "#formCreateNews",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#title", "Title is required"),
            Validator.isRequire("#content", "Content is required"),
        ]
    });
</script>
<script>
    Validator({
        form: "#formEditNews",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#title", "Title is required"),
            Validator.isRequire("#content", "Content is required"),
        ]
    });
</script>
<script>
    <%
        String createNews = (String) session.getAttribute("createNews");
        if (createNews != null) {
            if (createNews.equals("success")) {
    %>
    Swal.fire({
        position: "top-end",
        icon: "success",
        title: "Add News Successfully!",
        showConfirmButton: false,
        timer: 1000
    });
    <%
    } else {
    %>
    Swal.fire({
        position: "top-end",
        icon: "error",
        title: "Add News Failed",
        showConfirmButton: false,
        timer: 1000
    });
    <%
            }
        }
        session.removeAttribute("createNews");
    %>
</script>
<script>
    <%
        String editNews = (String) session.getAttribute("editNews");
        if (editNews != null) {
            if (editNews.equals("success")) {
    %>
    Swal.fire({
        position: "top-end",
        icon: "success",
        title: "Edit News Successfully!",
        showConfirmButton: false,
        timer: 1000
    });
    <%
    } else {
    %>
    Swal.fire({
        position: "top-end",
        icon: "error",
        title: "Edit News Failed",
        showConfirmButton: false,
        timer: 1000
    });
    <%
            }
        }
        session.removeAttribute("editNews");
    %>
</script>


<!--Create EventManager Alert-->
<script>
    <%
        String createEventManager = (String) session.getAttribute("createEventManager");
        if (createEventManager != null) {
            if (createEventManager.equals("success")) {
    %>
    Swal.fire({
        position: "top-end",
        icon: "success",
        title: "Add Event Manager Successfully!",
        showConfirmButton: false,
        timer: 1000
    });
    <%} else if (createEventManager.equals("failDate")) {%>
    Swal.fire({
        icon: "error",
        title: "Date not valid!",
        text: "Birthdate must be less than Enroll Date!",
    });
    <%
    } else {
    %>
    Swal.fire({
        position: "top-end",
        icon: "error",
        title: "Add Event Manager Failed",
        showConfirmButton: false,
        timer: 1000
    });
    <%
            }
        }
        session.removeAttribute("createEventManager");
    %>
</script>
<!--Validate Form Create Event-->
<script>
    Validator({
        form: "#formCreateEventManager",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#firstname", "First Name is required"),
            Validator.isRequire("#lastname", "Last Name is required"),
            Validator.isRequire("#birthdate", "Birthdate is required"),
            Validator.isRequire("#enrollmentdate", "Enroll Date is required"),
            Validator.isRequire("#email", "Email is required"),
            Validator.isEmail("#email", "Email is not valid format"),
            Validator.isRequire("#phone", "Phone is required"),
            Validator.isPhone("#phone", "Phone is not valid format"),
            Validator.isRequire("#staffnumber", "Staff Number is required"),
            Validator.isRequire("#academiclevel", "Academic Level is required"),
            Validator.isRequire("#degree", "Degree is required"),
            Validator.isRequire("#exprience", "Experience is required"),
            Validator.isRequire("#address", "Address is required"),
            Validator.isRequire("#uploadAvatar", "Avatar must be require"),
            Validator.isImage("#uploadAvatar", "Avatar must be image"),
        ]
    });
</script>
<!--Validate Form Create Club-->
<script>
    Validator({
        form: "#formCreateClubManager",
        message: ".message", // Selector class
        invalid: "invalid", // T�n class message
        rules: [
            Validator.isRequire("#firstname", "First Name is required"),
            Validator.isRequire("#lastname", "Last Name is required"),
            Validator.isRequire("#birthdate", "Birthdate is required"),
            Validator.isRequire("#enrollmentdate", "Enroll Date is required"),
            Validator.isRequire("#email", "Email is required"),
            Validator.isEmail("#email", "Email is not valid format"),
            Validator.isRequire("#phone", "Phone is required"),
            Validator.isPhone("#phone", "Phone is not valid format"),
            Validator.isRequire("#staffnumber", "Staff Number is required"),
            Validator.isRequire("#academiclevel", "Academic Level is required"),
            Validator.isRequire("#degree", "Degree is required"),
            Validator.isRequire("#experience", "Experience is required"),
            Validator.isRequire("#address", "Address is required"),
            Validator.isRequire("#uploadAvatar", "Avatar must be require"),
            Validator.isImage("#uploadAvatar", "Avatar must be image"),
        ]
    });
</script>
<!--Create Club Manager Alert-->
<script>
    <%
        String createClubManager = (String) session.getAttribute("createClubManager");
        if (createClubManager != null) {
            if (createClubManager.equals("success")) {
    %>
    Swal.fire({
        position: "top-end",
        icon: "success",
        title: "Add Club Manager Successfully!",
        showConfirmButton: false,
        timer: 1000
    });
    <%} else if (createClubManager.equals("failDate")) {%>
    Swal.fire({
        icon: "error",
        title: "Date not valid!",
        text: "Birthdate must be less than Enroll Date!",
    });
    <%
    } else {
    %>
    Swal.fire({
        position: "top-end",
        icon: "error",
        title: "Add Club Manager Failed",
        showConfirmButton: false,
        timer: 1000
    });
    <%
            }
        }
        session.removeAttribute("createClubManager");
    %>
</script>
<!--Edit Event Manager Profile by Admin-->
<script>
    <%
        String editEventManager = (String) session.getAttribute("editEventManager");
        if (editEventManager != null) {
            if (editEventManager.equals("success")) {
    %>
    Swal.fire({
        position: "top-end",
        icon: "success",
        title: "Edit Event Manager Successfully!",
        showConfirmButton: false,
        timer: 1000
    });
    <%} else if (editEventManager.equals("failDate")) {%>
    Swal.fire({
        icon: "error",
        title: "Date not valid!",
        text: "Birthdate must be less than Enroll Date!",
    });
    <%
    } else {
    %>
    Swal.fire({
        position: "top-end",
        icon: "error",
        title: "Edit Event Manager Failed",
        showConfirmButton: false,
        timer: 1000
    });
    <%
            }
        }
        session.removeAttribute("editEventManager");
    %>
</script>

<!--Edit Club Manager Profile by Admin-->
<script>
    <%
        String editClubManager = (String) session.getAttribute("editClubManager");
        if (editClubManager != null) {
            if (editClubManager.equals("success")) {
    %>
    Swal.fire({
        position: "top-end",
        icon: "success",
        title: "Edit Club Manager Successfully!",
        showConfirmButton: false,
        timer: 1000
    });
    <%} else if (editClubManager.equals("failDate")) {%>
    Swal.fire({
        icon: "error",
        title: "Date not valid!",
        text: "Birthdate must be less than Enroll Date!",
    });
    <%
    } else {
    %>
    Swal.fire({
        position: "top-end",
        icon: "error",
        title: "Edit Club Manager Failed",
        showConfirmButton: false,
        timer: 1000
    });
    <%
            }
        }
        session.removeAttribute("editClubManager");
    %>
</script>

<!--Check request Events-->
<script>
    document.querySelector("#acceptEventByAdmin").addEventListener("click", function (event) {
        event.preventDefault();
        Swal.fire({
            title: "Are you sure?",
            text: "Are you sure to accept the event?",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, accept it!"
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = document.querySelector("#acceptEventByAdmin").href;
            }
        });
    });

    document.querySelector("#declineEventByAdmin").addEventListener("click", function (event) {
        event.preventDefault();
        Swal.fire({
            title: "Are you sure?",
            text: "Do you want to decline the event?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, decline it!"
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = document.querySelector("#declineEventByAdmin").href;
            }
        });
    });
</script>

