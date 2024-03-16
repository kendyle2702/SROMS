<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.EventDAO"%>
<%@page import="DAOs.EventDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-wrapper">
    <div class="content container-fluid">
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="page-title">Event Detail</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/admin/events">Check Request Events</a></li>
                        <li class="breadcrumb-item active">Detail</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="card comman-shadow">
                    <div class="card-body">
                        <div>
                            <div class="row">
                                <div class="col-12">
                                    <h5 class="form-title"><span>Event Information</span></h5>
                                </div>
                                <c:if test="${not empty sessionScope.event}"> 
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Name</label>
                                            <input disabled="" name="eventnameupdate" type="text" class="form-control" value="${sessionScope.event.getEventName()}">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Event Category</label>
                                            <input type="text" class="form-control" value="${sessionScope.eventCategoryName}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Preparation Time</label>
                                            <input disabled name="pretimeupdate" class="form-control" type="datetime-local" value="${sessionScope.event.getPreparationTime()}">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Start Time</label>
                                            <input disabled name="holetimeupdate" class="form-control" type="datetime-local" value="${sessionScope.event.getHoldTime()}">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>End Time</label>
                                            <input disabled name="endtimeupdate" class="form-control" type="datetime-local" value="${sessionScope.event.getEndTime()}">
                                        </div>
                                    </div> 
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Location</label>
                                            <input disabled name="locationeupdate"  type="text" class="form-control" value="${sessionScope.event.getLocation()}">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Cost</label>
                                            <input disabled name="costupdate" type="number" class="form-control" value="${sessionScope.event.getCost()}">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Expected Number</label>
                                            <input disabled name="exnumupdate" type="number" class="form-control" value="${sessionScope.event.getExpectedNumber()}">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Organization</label>
                                            <input disabled name="organupdate" type="text" class="form-control" value="${sessionScope.event.getOrganization()}">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Feedback</label>
                                            <input disabled name="feedbackupdate" type="text" class="form-control" value="${sessionScope.event.getFeedback()}" >
                                        </div> 
                                    </div>                                
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Status</label>
                                            <%
                                                EventDAO dao = new EventDAO();
                                                Calendar calen = Calendar.getInstance();
                                                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
                                                Timestamp currentDateTime = new Timestamp(calen.getTimeInMillis());
                                                String currentDateTimeString = format.format(currentDateTime);
                                                session.setAttribute("currentTime", currentDateTimeString);
                                            %>
                                            <c:choose>
                                                 <c:when test="${liste.getApprove() eq 'DL'}">
                                                    <input type="text" class="form-control" value="Decline" readonly="">
                                                </c:when>
                                                <c:when test="${liste.getApprove() eq 'AA'}">
                                                    <input type="text" class="form-control" value="Accept" readonly="">   
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" class="form-control" value="Waiting Accept" readonly="">  
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Create By Role</label>
                                            <input type="text" class="form-control" value="${sessionScope.event.getCreatedBy()}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Create By ID Number</label>
                                            <input type="text" class="form-control" value="${sessionScope.idNumber}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-8">
                                        <div class="form-group local-forms">
                                            <label>Description</label>
                                            <textarea disabled name="descriptionupdate" type="text" class="form-control" rows="4">${sessionScope.event.getDescription()}</textarea>
                                        </div>
                                    </div>
                                    <div class="col-12 text-center">
                                        <c:choose>
                                            <c:when test="${sessionScope.event.getApprove() eq 'EC' || sessionScope.event.getApprove() eq 'EA'}">
                                                <a id="acceptEventByAdmin" href="${pageContext.request.contextPath}/admin/events/accept/${sessionScope.event.getEventID()}"> <button class="mb-2 mr-2 btn-icon btn btn-primary">Accept</button></a> 
                                                <a id="declineEventByAdmin" href="${pageContext.request.contextPath}/admin/events/decline/${sessionScope.event.getEventID()}" ><button class="mb-2 mr-2 btn-icon btn btn-danger">Decline</button></a> 
                                            </c:when>    
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/admin/events"><button class="mb-2 mr-2 btn-icon btn btn-primary">Back</button></a> 
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </c:if>
                                <c:if test="${empty sessionScope.event}">
                                    <tr>
                                        <td colspan="7" class="text-center">No events found.</td>
                                    </tr>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>