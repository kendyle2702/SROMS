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
