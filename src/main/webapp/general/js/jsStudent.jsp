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



