<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="DAOs.EventDAO"%>
<%@page import="DAOs.UserLoginDAO"%>
<%@page import="Models.UserProfile"%>
<%@page import="Models.Event"%>
<%@page import="java.util.List"%>
<div class="page-wrapper" style="min-height: 691px;">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">View Events</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item active"><a href="#">View Event</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="card flex-fill comman-shadow">
                <div class="card-body">
                    <ul class="nav nav-tabs nav-tabs-solid" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a href="#listEvent" data-bs-toggle="tab" aria-expanded="false"
                               class="nav-link active" aria-selected="false" role="tab">
                                Event
                            </a>
                        </li>
                        <li class="nav-item" role="tablist  ">
                            <a href="#participated" data-bs-toggle="tab" aria-expanded="true" class="nav-link"
                               aria-selected="true" role="tab">
                                History
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <%
                            EventDAO dao = new EventDAO();
                            Calendar calen = Calendar.getInstance();
                            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
                            Timestamp currentDateTime = new Timestamp(calen.getTimeInMillis());
                            String currentDateTimeString = format.format(currentDateTime);
                            session.setAttribute("currentTime", currentDateTimeString);
                        %>

                        <!-- List Event Tab -->
                        <div class="tab-pane active show" id="listEvent" role="tabpanel">
                            <div class="row">
                                <div class="col-xl-12 d-flex">
                                    <div class="card flex-fill student-space comman-shadow">

                                        <!-- Event List -->
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="viewEvents" class="table table-hover table-striped table-bordered">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th class="text-center">No</th>
                                                            <th class="text-center">Name</th>
                                                            <th class="text-center">Start Time</th>
                                                            <th class="text-center">Category</th>
                                                            <th class="text-center">Status</th>
                                                            <th class="text-center"></th> 
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:set var="eventCount" value="0" />
                                                    <c:forEach items="${sessionScope.listEvent}"  var="event">
                                                        <c:if test="${event.getApprove() eq 'AA'}">
                                                            <c:set var="eventCount" value="${eventCount + 1}" />
                                                            <tr>    
                                                                <td>${eventCount}</td>
                                                                <td  style="white-space: break-spaces;">${event.eventName}</td>
                                                                <td>${event.holdTime}</td>
                                                                <td>${sessionScope.eventCategoryNames[event.eventID]}</td>
                                                            <c:choose>
                                                                <c:when test="${sessionScope.currentTime < event.getHoldTime() && event.getApprove() eq 'AA'}">
                                                                    <td class=""><button class="btn btn-danger btn-sm btn-rounded">Upcoming</button></td>
                                                                </c:when>
                                                                <c:when test="${event.getHoldTime() <= sessionScope.currentTime && sessionScope.currentTime < event.getEndTime() && event.getApprove() eq 'AA'}">
                                                                    <td class=""><button class="btn btn-primary btn-sm btn-rounded">Going on</button></td>
                                                                </c:when>
                                                                <c:when test="${sessionScope.currentTime >= event.getEndTime() && event.getApprove() eq 'AA'}" >
                                                                    <td class=""><button class="btn btn-success btn-sm btn-rounded">Finished</button></td>
                                                                </c:when>
                                                            </c:choose>  
                                                            <td class="text-center">
                                                                <a style="background: #ea7127;border-color:#ea7127" href="/student/events/detail/${event.eventID}" type="button" class="btn btn-primary">Detail</a>
                                                            </td>
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${empty sessionScope.listEvent}">
                                                        <tr>
                                                            <td colspan="7" class="text-center">No events found.</td>
                                                        </tr>
                                                    </c:if>
                                                    </tbody>
                                                </table>  
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- User participated -->
                        <div class="tab-pane" id="participated" role="tabpanel">
                            <div class="row">
                                <div class="col-xl-12 d-flex">
                                    <div class="card flex-fill student-space comman-shadow">

                                        <!-- Event List -->
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="viewEventsHistory" class="table table-hover table-striped table-bordered">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th class="text-center">No</th>
                                                            <th class="text-center">Name</th>
                                                            <th class="text-center">Date</th>
                                                            <th class="text-center">Category</th>
                                                            <th class="text-center">Status</th>
                                                            <th class="text-center"></th> 
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:set var="eventCount" value="0" />
                                                    <c:forEach items="${sessionScope.listEventStudent}"  var="event">
                                                        <c:if test="${sessionScope.currentTime > event.getEndTime() && event.getApprove() eq 'AA'}">
                                                            <c:set var="eventCount" value="${eventCount + 1}" />
                                                            <tr>    
                                                                <td>${eventCount}</td>
                                                                <td>${event.eventName}</td>
                                                                <td>${event.holdTime}</td>
                                                                <td>${sessionScope.eventCategoryNames[event.eventID]}</td>
                                                            <c:choose>
                                                                <c:when test="${sessionScope.currentTime < event.getHoldTime() && event.getApprove() eq 'AA'}">
                                                                    <td class=""><button class="btn btn-danger btn-sm btn-rounded">Upcoming</button></td>
                                                                </c:when>
                                                                <c:when test="${event.getHoldTime() <= sessionScope.currentTime && sessionScope.currentTime < event.getEndTime() && event.getApprove() eq 'AA'}">
                                                                    <td class=""><button class="btn btn-primary btn-sm btn-rounded">Going on</button></td>
                                                                </c:when>
                                                                <c:when test="${sessionScope.currentTime >= event.getEndTime() && event.getApprove() eq 'AA'}" >
                                                                    <td class=""><button class="btn btn-success btn-sm btn-rounded">Finished</button></td>
                                                                </c:when>
                                                            </c:choose>
                                                            <td class="text-center">
                                                                <a style="background: #ea7127;border-color:#ea7127" href="/student/events/detail/${event.eventID}" type="button" class="btn btn-primary">Detail</a>
                                                            </td>
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${empty sessionScope.listEvent}">
                                                        <tr>
                                                            <td colspan="6" class="text-center">No events found.</td>
                                                        </tr>
                                                    </c:if>
                                                    </tbody>
                                                </table>  
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>