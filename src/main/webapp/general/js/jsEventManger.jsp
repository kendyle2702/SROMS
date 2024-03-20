<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



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
                title: "You have updated the event as failure!",
                showConfirmButton: false,
                timer: 1000
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
