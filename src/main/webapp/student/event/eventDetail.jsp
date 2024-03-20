<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Models.Event"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.EventDAO"%>
<%@page import="DAOs.EventDAO"%>
<div class="page-wrapper">
    <div class="content container-fluid">
        <div class="row justify-content-center">
            <div class="col-xl-10">
                <form action="/student" method="post">
                    <div class="card invoice-info-card">
                        <div class="card-body">
                            <div class="invoice-item invoice-item-one">
                                <div class="row">
                                    <div class="col-md-12 text-center">
                                        <div class="invoice-head">
                                            <h2>${event.getEventName()}</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div style="background: #ea7127;border-color:#ea7127; padding:0px;" class="invoice-issues-box" >
                                <div class="row">
                                    <div class="col-lg-4 col-md-4">
                                        <div class="invoice-issues-date">
                                            <p >Preparation: ${event.getPreparationTime()}</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4">
                                        <div class="invoice-issues-date">
                                            <p> Start: ${event.getHoldTime()}</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4">
                                        <div class="invoice-issues-date">
                                            <p>End: ${event.getEndTime()}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="invoice-table table table-center mb-0">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <table class="invoice-table table table-center">
                                                <thead>
                                                    <tr>
                                                        <th>Event Name</th>
                                                        <th>Description</th>
                                                        <th>Organization</th>
                                                        <th>Location</th>
                                                        <th>Category</th>
                                                        <th class="text-end">Status</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td style="white-space: break-spaces;">${event.getEventName()}</td>
                                                        <td style="white-space: break-spaces;">${event.getDescription()}</td>
                                                        <td>${event.getOrganization()}</td>
                                                        <td>${event.getLocation()}</td>
                                                        <td>${sessionScope.eventCategoryNames[event.eventID]}</td>
                                                        <%
                                                            EventDAO dao = new EventDAO();
                                                            Calendar calen = Calendar.getInstance();
                                                            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
                                                            Timestamp currentDateTime = new Timestamp(calen.getTimeInMillis());
                                                            String currentDateTimeString = format.format(currentDateTime);
                                                            session.setAttribute("currentTime", currentDateTimeString);
                                                        %>
                                                        <c:choose>
                                                            <c:when test="${sessionScope.currentTime < event.getHoldTime() && event.getApprove() eq 'AA'}">
                                                                <td class="text-end">Upcoming</td>
                                                                <c:if test="${checkParticipation == true}">
                                                                    <td>
                                                                        <div class="student-submit text-end">
                                                                            <input type="hidden" name="EventID" value="${event.getEventID()}">
                                                                            <input type="hidden" name="studentProfileID" value="${studentProfileID}">
                                                                            <input style="background: #ea7127;border-color:#ea7127" type="submit" name="action" class="btn btn-primary" value="Join">
                                                                        </div>
                                                                    </td>                                                                    
                                                                </c:if>
                                                                <c:if test="${checkParticipation == false}">
                                                                    <td>
                                                                        <div id="danger-alert-modal" class="modal fade" tabindex="-1" style="display: none;" aria-hidden="true">
                                                                            <div class="modal-dialog modal-sm">
                                                                                <div class="modal-content modal-filled bg-danger">
                                                                                    <div class="modal-body p-4">
                                                                                        <div class="text-center">
                                                                                            <i class="dripicons-wrong h1 text-white"></i>
                                                                                            <h4 class="mt-2 text-white">Oh snap!</h4>
                                                                                            <p  style="white-space: break-spaces;" class="mt-3 text-white" >Thank you for your interest, but it seems you've already participated in this event.</p>
                                                                                            <button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">Continue</button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <button type="button" class="btn btn-danger mt-1" data-bs-toggle="modal" data-bs-target="#danger-alert-modal">Join</button>
                                                                    </td>   
                                                                </c:if>
                                                            </c:when>
                                                            <c:when test="${event.getHoldTime() <= sessionScope.currentTime && sessionScope.currentTime < event.getEndTime() && event.getApprove() eq 'AA'}">
                                                                <td class="text-end">Happening</td>
                                                            </c:when>
                                                            <c:when test="${sessionScope.currentTime >= event.getEndTime() && event.getApprove() eq 'AA'}">
                                                                <td class="text-end">Finished</td>
                                                            </c:when>
                                                        </c:choose>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div class="text-end">
                                                <a style="background: #ea7127;border-color:#ea7127" href="/student/events/view" type="button" class="btn btn-primary">Back</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>