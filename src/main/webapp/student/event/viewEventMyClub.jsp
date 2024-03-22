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
            <div class="row align-items-center">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">Event List</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Event</a></li>
                            <li class="breadcrumb-item active">List Event My Club</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="card flex-fill comman-shadow">

                <%
                    EventDAO dao = new EventDAO();
                    Calendar calen = Calendar.getInstance();
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
                    Timestamp currentDateTime = new Timestamp(calen.getTimeInMillis());
                    String currentDateTimeString = format.format(currentDateTime);
                    session.setAttribute("currentTime", currentDateTimeString);
                %>
                <!-- List Event Tab -->
                <!-- User participated -->
                <div class="tab-pane" id="participated" role="tabpanel">
                    <div class="row">
                        <div class="col-xl-12 d-flex">

                            <div class="table-responsive">
                                <table id="viewEvents" class="table table-hover table-striped table-bordered">
                                    <thead class="thead-light">
                                        <tr>
                                            <th class="text-center">No</th>
                                            <th class="text-center">Name</th>
                                            <th class="text-center">Start Time</th>
                                            <th class="text-center">End Time</th>
                                            <th class="text-center">Location</th>
                                            <th class="text-center">Organization</th> 
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${sessionScope.listEventMyClub}"  var="event" varStatus="count">
                                        <tr>    
                                            <td>${count.count}</td> <!-- Use count.count to get the current loop index -->
                                            <td>${event.EventName}</td> <!-- Use lowercase for property names -->
                                            <td>${event.HoldTime}</td>
                                            <td>${event.EndTime}</td>
                                            <td>${event.Location}</td>
                                            <td>${event.Organization}</td>
                                            <td class="text-center">
                                                <a style="background: #ea7127;border-color:#ea7127" href="/student/events/detail/${event.EventID}" type="button" class="btn btn-primary">Detail</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty sessionScope.listEventMyClub}">
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
    </div>
</div> 