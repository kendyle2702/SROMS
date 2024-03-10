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
<script>
    $(document).ready(function () {
        $("#viewEvents").DataTable();
    });
    $(document).ready(function () {
        $("#viewClubs").DataTable();
    });
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


