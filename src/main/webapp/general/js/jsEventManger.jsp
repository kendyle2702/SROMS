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
    <c:when test="${sessionScope.checkCreateEvent == 'failDate'}">
        <script>
            Swal.fire({
                icon: "error",
                title: "Date not valid!",
                text: "Please enter \"Prepare Date < Start Date, Start Date < End Date and Prepare Date < End Date\"",
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
<script>
    $(document).ready(function () {
        $('#viewEvaluateCompotitionStudent').DataTable();
    });
</script>

<script>
    function handleCheckboxChange(checkbox) {
        if (checkbox.checked) {
            var checkboxes = document.getElementsByClassName("prize-checkbox");
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i] !== checkbox) {
                    checkboxes[i].checked = false;
                }
            }
        }
    }
</script>

<c:choose>
    <c:when test="${sessionScope.checkComposition == 'success'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "You have evaluate compostition students the event as successfully!",
                showConfirmButton: false,
                timer: 1500
            });
        </script> 
        <%session.setAttribute("checkComposition", "sdsdsfdsf");%>
    </c:when>
    <c:when test="${sessionScope.checkComposition == 'fail'}">
        <script>
            Swal.fire({
                position: "top-end",
                icon: "warning",
                title: "You have evaluate composition students the event as failure!",
                showConfirmButton: false,
                timer: 1500
            });
        </script> 
        <%session.setAttribute("checkComposition", "sdsdsfdsf");%>
    </c:when>
</c:choose> 