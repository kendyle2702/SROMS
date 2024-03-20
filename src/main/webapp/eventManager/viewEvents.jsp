<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Models.Event"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.EventDAO"%>

<div class="page-wrapper">
    <div class="content container-fluid">
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">View Event</h3>
                        <ul class="breadcrumb">>
                            <li class="breadcrumb-item active"><a href="#">Event</a></li>
                            <li class="breadcrumb-item active"><a href="#">View Event</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="content container-fluid">
            <div class="row">
                <div class="col-xl-12 d-flex">
                    <div class="card flex-fill student-space comman-shadow">
                        <div class="card-header d-flex align-items-center">
                            <h5 class="card-title">Event List</h5>
                            <ul class="chart-list-out student-ellips">
                                <li class="star-menus"><a href="javascript:;"><i class="fas fa-ellipsis-v"></i></a></li>
                            </ul>
                        </div>
                        <div class="card-body">                                      
                            <div class="table-responsive">

                                <table id="viewEvents" class="table table-hover table-striped table-bordered" >
                                    <thead class="thead-light">
                                        <tr>
                                            <th class="text-center">No.</th>                                       
                                            <th style="width: 50px;" class="text-center">Name</th>
                                            <th class="text-center">Start Time</th>
                                            <th class="text-center">Organization</th>                                         
                                            <th class="text-center">Location</th>
                                            <th class="text-center">Status</th>       
                                            <th class="text-center"></th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${not empty sessionScope.listEvent}">
                                            <c:forEach items="${sessionScope.listEvent}" var="liste" >
                                                <c:if test="${liste.getApprove() eq 'AA'}">
                                                     <c:set var="count" value="${count + 1}"/>
                                                    <tr>
                                                        <td class="">${count}</td>
                                                        <td style="width: 50px;" class="">${liste.getEventName()}</td>
                                                        <td class="">${liste.getHoldTime()}</td><!-- comment -->
                                                        <td class="">${liste.getOrganization()}</td>                                                         
                                                        <td class="">${liste.getLocation()}</td>
                                                        <%
                                                            EventDAO dao = new EventDAO();
                                                            List<Event> events = dao.eventList();

                                                            Calendar calen = Calendar.getInstance();
                                                            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
                                                            Timestamp currentDateTime = new Timestamp(calen.getTimeInMillis());
                                                            String currentDateTimeString = format.format(currentDateTime);
                                                            session.setAttribute("currentTime", currentDateTimeString);
                                                        %>
                                                        <c:choose>
                                                            <c:when test="${sessionScope.currentTime <= liste.getEndTime() && sessionScope.currentTime >= liste.getHoldTime() && liste.getApprove() eq 'AA'}">
                                                                <td class=""><button type="button" class="btn btn-block btn-outline-success active">Happening</button></td>
                                                            </c:when>
                                                            <c:when test="${sessionScope.currentTime > liste.getEndTime() && liste.getApprove() eq 'AA'}">
                                                                <td class=""><button type="button" class="btn btn-block btn-outline-primary active">Finished</button></td>
                                                            </c:when>                            
                                                            <c:when test="${sessionScope.currentTime < liste.getHoldTime() && sessionScope.currentTime < liste.getEndTime()  && liste.getApprove() eq 'AA'}">
                                                                <td class=""><button type="button" class="btn btn-block btn-outline-secondary active">Not Started</button></td>
                                                            </c:when>
                                                        </c:choose>                                       
                                                        <td><a style="background: #ea7127;border-color:#ea7127;" href="/eventmanager/events/detail/${liste.getEventID()}" type="button" class="mb-2 mr-2 btn btn-outline-organ text-white" style="background-color: #ea7127; border-color: #ea7127;">
                                                                <i class="feather-edit-3"></i>Detail</a></td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
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
    </div>
</div>
