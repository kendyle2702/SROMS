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
                        <h3 class="page-title">List Events Awaiting Approval</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item active"><a href="#">Manage Event Requests</a></li>
                            <li class="breadcrumb-item active"><a href="#">List Events Awaiting Approval</a></li>
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
                            <h5 class="card-title">List Events Awaiting Approval</h5>
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

                                            <th class="text-center">Status</th>       
                                            <th class="text-center"></th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${not empty sessionScope.listEvent}">
                                            <c:forEach items="${sessionScope.listEvent}" var="liste" varStatus="count">
                                                <c:if test="${liste.getApprove() eq 'EA' || liste.getApprove() eq 'EC'|| liste.getApprove() eq 'AA' || liste.getApprove() eq 'DL'}">
                                                    <tr>
                                                        <td class="">${count.index+1}</td>
                                                        <td style="width: 50px;" class="">${liste.getEventName()}</td>
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
                                                            <c:when test="${liste.getApprove() eq 'AA'}">
                                                                <td class="text-center"><a type="button" class=" mb-2 mr-2 btn btn-outline-organ btn-outline-success active">Accepted</a></td>
                                                            </c:when>
                                                            <c:when test="${liste.getApprove() eq 'DL'}">
                                                                <td class="text-center"><a type="button" class=" mb-2 mr-2 btn btn-outline-organ btn-outline-danger active">Rejected</a></td>
                                                            </c:when>     
                                                            <c:otherwise>
                                                                <td class="text-center"><a type="button" class="mb-2 mr-2 btn btn-outline-organ btn-outline-primary active">Waiting</a></td>
                                                            </c:otherwise>
                                                        </c:choose>                                       
                                                        <td class="text-center"><a style="background: #ea7127;border-color:#ea7127;" href="/eventmanager/events/detail/${liste.getEventID()}" type="button" class="mb-2 mr-2 btn btn-outline-organ text-white" style="background-color: #ea7127; border-color: #ea7127;">
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