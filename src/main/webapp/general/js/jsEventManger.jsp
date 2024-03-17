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
                title: "You have updated the the event as failure!",
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
<!--<script>
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
            Validator.isRequire("#exnum", "Expected number is required"),
            Validator.isRequire("#organization", "Organization is required"),
            Validator.isRequire("#feedback", "Feedback is not valid format"),
            Validator.isRequire("#endtime", "End time is required"),
            Validator.isRequire("#description", "Description is required"),
            Validator.isRequire("#typeOfEvent", "Type Of Event is required"),
        ]
    });
</script>-->
<!--<script>
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
            Validator.isRequire("#exnum", "Expected number is required"),
            Validator.isRequire("#organization", "Organization is required"),
            Validator.isRequire("#feedback", "Feedback is not valid format"),
            Validator.isRequire("#endtime", "End time is required"),
            Validator.isRequire("#description", "Description is required"),
            Validator.isRequire("#firtPrize", "Firt prize is required"),
            Validator.isRequire("#secondPrize", "Second prize is required"),
            Validator.isRequire("#thirdPrize", "Third prize is require"),
            Validator.isRequire("#encouragementPrize", "Encouragement prize is required")
        ]
    });
</script>-->



