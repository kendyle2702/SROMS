<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="Models.Event"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.EventDAO"%>
<div class="page-wrapper">
    <div class="content container-fluid"> 
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">Check Attendance For Student</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Participants Management</a></li>
                            <li class="breadcrumb-item active"><a href="#">Check Attendance</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
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
                            <table id="viewEvents" class="table table-hover table-striped table-bordered">
                                <thead class="thead-light">
                                    <tr>
                                        <!--                                        <th class="text-center">No.</th>-->
                                        <th class="text-center">ID</th>
                                        <th class="text-center">Name</th>
                                        <th class="text-center">Location</th>
                                        <th class="text-center">End Time</th>       
                                        <th class="text-center"></th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${not empty sessionScope.listEvent}">
                                        <c:forEach items="${sessionScope.listEvent}" var="liste" varStatus="count">

                                            <%-- Scriptlets should be avoided, but for demonstration, I'm maintaining them --%>
                                            <%-- Scriptlets should be avoided, but for demonstration, I'm maintaining them --%>
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
                                                    <tr>
                                                        <td class="">${count.index+1}</td>
                                                        <td class="">${liste.getEventName()}</td>
                                                        <td class="">${liste.getLocation()}</td>
                                                        <td class="">${liste.getEndTime()}</td>
                                                        <td class="text-center">
                                                            <a style="background: #ea7127;border-color:#ea7127;" href="/eventmanager/events/checkAttendant/${liste.getEventID()}" type="button" class="btn btn-primary">Check Attendant</a>
                                                        </td>
                                                    </tr>
                                                </c:when>                                             
                                            </c:choose>
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

