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
                        <h3 class="page-title">Check Request Create Event</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item active"><a href="#">Manage Event Requests</a></li>
                            <li class="breadcrumb-item active"><a href="#">Check Request Create Event</a></li>
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
                                            <th class="text-center">End Time</th>
                                            <th class="text-center">Expected Number</th>
                                            <th class="text-center">Cost</th>                                      
                                            <th class="text-center">Location</th>                            
                                            <th class="text-center"></th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${not empty sessionScope.listEvent}">
                                            <c:forEach items="${sessionScope.listEvent}" var="liste" varStatus="count">
                                                <c:if test="${liste.getApprove() eq 'SC'}">
                                                    <tr>
                                                        <td class="">${count.index+1}</td>
                                                        <td style="width: 50px;" class="">${liste.getEventName()}</td>
                                                        <td class="">${liste.getHoldTime()}</td><!-- comment -->
                                                        <td class="">${liste.getEndTime()}</td>
                                                        <td class="">${liste.getExpectedNumber()}</td>
                                                        <td class="">${liste.getCost()}</td>
                                                        <td>${liste.getLocation()}</td>                                                  
                                                        <td class="text-center"><a style="background: #ea7127;border-color:#ea7127;" href="/eventmanager/events/detail/${liste.getEventID()}" type="button" class="mb-2 mr-2 btn btn-outline-organ text-white" style="background-color: #ea7127; border-color: #ea7127;">
                                                                <i class="feather-edit-3"></i>View Request Details</a></td>
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
