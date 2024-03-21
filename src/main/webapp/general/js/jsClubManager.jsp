<script>
    document.querySelector("#banClub").addEventListener("click", function (event) {
        event.preventDefault();
        Swal.fire({
            title: "Are you sure?",
            text: "Are you sure to block the club?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, block it!"
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = document.querySelector("#banClub").href;
            }
        });
    });

    document.querySelector("#unbanClub").addEventListener("click", function (event) {
        event.preventDefault();
        Swal.fire({
            title: "Are you sure?",
            text: "Do you want to unblock the club?",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, unblock it!"
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = document.querySelector("#unbanClub").href;
            }
        });
    });
</script>
<c:choose>
    <c:when test="${sessionScope.checkrequestClub   == 'acceptSuccess'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "You have successfully accepted the club!",
                showConfirmButton: false,
                timer: 1000
            });
        </script>
        <%session.setAttribute("checkrequestClub", "sdsdsfdsf");%>
    </c:when>
    <c:when test="${sessionScope.checkrequestClub   == 'acceptFail'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "You have successfully rejected the club!",
                showConfirmButton: false,
                timer: 1000
            });
        </script>  
        <%session.setAttribute("checkrequestClub", "sdsdsfdsf");%>
    </c:when> 
</c:choose>

<c:choose>
    <c:when test="${sessionScope.checkrequestClub   == 'rejectSuccess'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "You have successfully reject created the club!",
                showConfirmButton: false,
                timer: 1000
            });
        </script>
        <%session.setAttribute("checkrequestClub", "sdsdsfdsf");%>
    </c:when>
    <c:when test="${sessionScope.checkrequestClub   == 'rejectFail'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "You have failed rejected create the club!",
                showConfirmButton: false,
                timer: 1000
            });
        </script>  
        <%session.setAttribute("checkrequestClub", "sdsdsfdsf");%>
    </c:when> 
</c:choose>
