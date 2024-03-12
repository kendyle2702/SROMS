<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.EventDAO"%>
<%@page import="DAOs.EventDAO"%>
<div class="page-wrapper">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="page-title">Event Detail</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item active">Event Detail</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <form action="eventmanager" method="post">
                            <div class="row">
                                <div class="col-12">
                                    <h5 class="form-title"><span>Event Information</span></h5>
                                </div>
                                <c:if test="${not empty sessionScope.event}"> 
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Id</label>
                                            <input name="idupdate" type="text" class="form-control" value="${sessionScope.event.getEventID()}" readonly="">
                                        </div>
                                    </div>

                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Name</label>
                                            <input name="eventnameupdate" type="text" class="form-control" value="${sessionScope.event.getEventName()}">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Preparation Time</label>
                                            <input name="pretimeupdate" class="form-control" type="datetime-local" value="${sessionScope.event.getPreparationTime()}">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Hold Time</label>
                                            <input name="holetimeupdate" class="form-control" type="datetime-local" value="${sessionScope.event.getHoldTime()}">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Location</label>
                                            <input name="locationeupdate"  type="text" class="form-control" value="${sessionScope.event.getLocation()}">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Cost</label>
                                            <input name="costupdate" type="number" class="form-control" value="${sessionScope.event.getCost()}">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Expected Number</label>
                                            <input name="exnumupdate" type="number" class="form-control" value="${sessionScope.event.getExpectedNumber()}">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Organization</label>
                                            <input name="organupdate" type="text" class="form-control" value="${sessionScope.event.getOrganization()}">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Feedback</label>
                                            <input name="feedbackupdate" type="text" class="form-control" value="${sessionScope.event.getFeedback()}" >
                                        </div> 
                                    </div>                                
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Is Approve</label>
                                            <c:choose>
                                                <c:when test="${liste.getApprove() eq 'AA'}">
                                                    <input type="text" class="form-control" value="Accept" readonly="">
                                                </c:when>                                            
                                                <c:otherwise>
                                                    <input type="text" class="form-control" value="Waiting" readonly=""> 
                                                </c:otherwise>
                                            </c:choose>
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
                                                <c:when test="${sessionScope.currentTime <= liste.getEndTime() && liste.getApprove() eq 'AA'}">
                                                    <input type="text" class="form-control" value="Happening" readonly="">
                                                </c:when>
                                                <c:when test="${sessionScope.currentTime > liste.getEndTime() && liste.getApprove() eq 'AA'}">
                                                    <input type="text" class="form-control" value="Finished" readonly="">   
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" class="form-control" value="Waiting Accept" readonly="">  
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Create By</label>
                                            <input type="text" class="form-control" value="<%= (String) session.getAttribute("role")%>" readonly>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>End Time</label>
                                            <input name="endtimeupdate" class="form-control" type="datetime-local" value="${sessionScope.event.getEndTime()}">
                                        </div>
                                    </div>  
                                    <div class="col-12 col-sm-4">
                                        <div class="form-group local-forms">
                                            <label>Description</label>
                                            <textarea name="descriptionupdate" type="text" class="form-control" >${sessionScope.event.getDescription()}</textarea>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="student-submit">
                                            <input style="background: #ea7127;border-color:#ea7127;" class="btn btn-primary" name="updateEvent" id="submit" type="submit" value="Update">
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${empty sessionScope.event}">
                                    <tr>
                                        <td colspan="7" class="text-center">No events found.</td>
                                    </tr>
                                </c:if>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>