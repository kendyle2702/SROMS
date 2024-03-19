<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">Event Detail</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Event Management</a></li>
                            <li class="breadcrumb-item"><a href="/eventmanager/events/viewevent">View Event</a></li>
                            <li class="breadcrumb-item"><a href="#">Event Detail</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <c:choose>
                            <c:when test="${requestScope.eventDetail.CreateBy eq 'Event Manager'}">
                                <form action="eventmanager" method="post">
                                    <div class="row">
                                        <div class="col-12">
                                            <h5 class="form-title"><span>Event Information</span></h5>
                                        </div>
                                        <c:if test="${not empty requestScope.eventDetail}"> 
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Event Name</label>
                                                    <input name="eventNameUpdate" type="text" class="form-control" value="${requestScope.eventDetail.EventName}">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Preparation Time</label>
                                                    <input name="preTimeUpdate" class="form-control" type="datetime-local" value="${requestScope.eventDetail.PreparationTime}">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Start Time</label>
                                                    <input name="holeTimeUpdate" class="form-control" type="datetime-local" value="${requestScope.eventDetail.HoldTime}">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>End Time</label>
                                                    <input name="endTimeUpdate" class="form-control" type="datetime-local" value="${requestScope.eventDetail.EndTime}">
                                                </div>
                                            </div>  
                                            <c:choose>
                                                <c:when test="${requestScope.eventDetail.EventCategoryName eq 'Compatition'}">
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Event Category</label>
                                                            <input type="text" class="form-control" value="${requestScope.eventDetail.EventCategoryName}" readonly="">
                                                        </div>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group ">
                                                            <label>Event Category<span
                                                                    class="login-danger">*</span></label>
                                                            <br>
                                                            <select id="typeOfEvent" name="catelogyEventUpdate" class="form-control">
                                                                <c:choose>
                                                                    <c:when test="${requestScope.eventDetail.EventCategoryName eq 'Soft Skills'}">
                                                                        <option value="Soft Skills" selected="">Soft Skills</option>
                                                                        <option value="Talkshow">Talkshow</option>
                                                                    </c:when>
                                                                    <c:when test="${requestScope.eventDetail.EventCategoryName eq 'TalkShow'}">
                                                                        <option value="Soft Skills">Soft Skills</option>
                                                                        <option value="Talkshow" selected="">Talkshow</option>
                                                                    </c:when>
                                                                </c:choose>                                                          
                                                            </select>
                                                        </div>
                                                    </div>  
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Location</label>
                                                    <input name="locationeUpdate"  type="text" class="form-control" value="${requestScope.eventDetail.Location}">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Cost</label>
                                                    <input name="costUpdate" type="number" class="form-control" value="${requestScope.eventDetail.Cost}">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Expected Number</label>
                                                    <input name="exnumUpdate" type="number" class="form-control" value="${requestScope.eventDetail.ExpectedNumber}">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Organization</label>
                                                    <input name="organUpdate" type="text" class="form-control" value="${requestScope.eventDetail.Organization}">
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Feedback</label>
                                                    <input name="feedbackUpdate" type="text" class="form-control" value="${requestScope.eventDetail.Feedback}" >
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
                                                        <c:when test="${sessionScope.currentTime <= requestScope.eventDetail.EndTime && sessionScope.currentTime >= requestScope.eventDetail.HoldTime && requestScope.eventDetail.Approve eq 'AA'}">
                                                            <input type="text" class="form-control" value="Happening" readonly>
                                                        </c:when>
                                                        <c:when test="${sessionScope.currentTime > requestScope.eventDetail.EndTime && requestScope.eventDetail.Approve eq 'AA'}">
                                                            <input type="text" class="form-control" value="Finished" readonly>
                                                        </c:when>
                                                        <c:when test="${sessionScope.eventDetail.Approve eq 'DL'}">
                                                            <input type="text" class="form-control" value="Rejected" readonly>
                                                        </c:when>
                                                        <c:when test="${sessionScope.currentTime < requestScope.eventDetail.HoldTime && sessionScope.currentTime < requestScope.eventDetail.EndTime  && requestScope.eventDetail.Approve eq 'AA'}">
                                                            <input type="text" class="form-control" value="Not Started" readonly>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control" value="Waiting Accept" readonly>
                                                        </c:otherwise>
                                                    </c:choose>         
                                                </div>
                                            </div>

                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Create By</label>
                                                    <input type="text" class="form-control" value="${requestScope.eventDetail.StaffNumber}" readonly>
                                                </div>
                                            </div>
                                            <div class="form-group local-forms" style="margin-top: 50px;">
                                                <label>Description</label>
                                                <textarea name="descriptionUpdate" type="text" class="form-control" >${requestScope.eventDetail.Description}</textarea>
                                            </div>
                                            <c:choose>
                                                <c:when test="${ empty requestScope.eventDetail.PrizeStructureID}">
                                                    <c:choose>
                                                        <c:when test="${requestScope.eventDetail.Approve eq 'SC'}">
                                                            <div class="row justify-content-center">
                                                                <div  class="col-1 text-center">
                                                                    <a href="/eventmanager/events/checkrequestcreate/accept/${requestScope.eventDetail.EventID}" type="button" class="btn btn-success btn-lg mb-3">Accept</a>
                                                                </div>
                                                                <div class="col-1 text-center">
                                                                    <a href="/eventmanager/events/checkrequestcreate/decline/${requestScope.eventDetail.EventID}" type="button" class="btn btn-danger btn-lg mb-3">Decline</a>
                                                                </div>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="col-12" style="margin-top: 40px;">
                                                                <div class="student-submit">
                                                                    <input name="idUpdate" type="hidden" value="${requestScope.eventDetail.EventID}">
                                                                    <input style="background: #ea7127;border-color:#ea7127;" class="btn btn-primary" name="UpdateEvent" id="submit" type="submit" value="Update">
                                                                </div>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>                                                   
                                                </c:when>                    
                                                <c:otherwise>
                                                    <div style="border: solid 1px grey; border-radius: 5px;" class="col-12">
                                                        <label>Prize Structure<span class="login-danger">*</span></label>
                                                        <div class="row">
                                                            <div class="col-lg-6 col-sm-6">
                                                                <div class="form-group">
                                                                    <label>First<span class="login-danger">*</span></label>
                                                                    <input id="firstPrize" name="firstPrizeUpdate" type="number" class="form-control" value="${requestScope.eventDetail.First}">
                                                                    <div class="message"></div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Second<span class="login-danger">*</span></label>
                                                                    <input id="secondPrize" name="secondPrizeUpdate" type="number" class="form-control" value="${requestScope.eventDetail.Second}">
                                                                    <div class="message"></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6 col-sm-6">
                                                                <div class="form-group">
                                                                    <label>Third<span class="login-danger">*</span></label>
                                                                    <input id="thirdPrize" name="thirdPrizeUpdate" type="number" class="form-control" value="${requestScope.eventDetail.Third}">
                                                                    <div class="message"></div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Encouragement<span class="login-danger">*</span></label>
                                                                    <input id="encouragementPrize" name="encouragementPrizeUpdate" type="number" class="form-control" value="${requestScope.eventDetail.Encouragement}">
                                                                    <div class="message"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <c:choose>
                                                        <c:when test="${requestScope.eventDetail.Approve eq 'SC'}">
                                                            <div class="row justify-content-center">
                                                                <div  class="col-1 text-center">
                                                                    <a href="/eventmanager/events/checkrequestcreate/accept/${requestScope.eventDetail.EventID}" type="button" class="btn btn-success btn-lg mb-3">Accept</a>
                                                                </div>
                                                                <div class="col-1 text-center">
                                                                    <a href="/eventmanager/events/checkrequestcreate/decline/${requestScope.eventDetail.EventID}" type="button" class="btn btn-danger btn-lg mb-3">Decline</a>
                                                                </div>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="col-12" style="margin-top: 40px;">
                                                                <div class="student-submit">
                                                                    <input name="prizeStructureIdUpdate" type="hidden" value="${requestScope.eventDetail.PrizeStructureID}">
                                                                    <input name="idUpdate" type="hidden" value="${requestScope.eventDetail.EventID}">
                                                                    <input style="background: #ea7127;border-color:#ea7127;" class="btn btn-primary" name="UpdateCompatition" id="submit" type="submit" value="Update">
                                                                </div>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                        <c:if test="${empty requestScope.eventDetail}">
                                            <tr>
                                                <td colspan="7" class="text-center">No events found.</td>
                                            </tr>
                                        </c:if>
                                    </div>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <form action="eventmanager" method="post">
                                    <div class="row">
                                        <div class="col-12">
                                            <h5 class="form-title"><span>Event Information</span></h5>
                                        </div>
                                        <c:if test="${not empty requestScope.eventDetail}"> 
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Event Name</label>
                                                    <input name="eventnameUpdate" type="text" class="form-control" value="${requestScope.eventDetail.EventName}" readonly>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Preparation Time</label>
                                                    <input name="pretimeUpdate" class="form-control" type="datetime-local" value="${requestScope.eventDetail.PreparationTime}" readonly>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Start Time</label>
                                                    <input name="holetimeUpdate" class="form-control" type="datetime-local" value="${requestScope.eventDetail.HoldTime}" readonly>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>End Time</label>
                                                    <input name="endtimeUpdate" class="form-control" type="datetime-local" value="${requestScope.eventDetail.EndTime}" readonly>
                                                </div>
                                            </div>  
                                            <c:choose>
                                                <c:when test="${requestScope.eventDetail.EventCategoryName eq 'Compatition'}">
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group local-forms">
                                                            <label>Event Category</label>
                                                            <input type="text" class="form-control" value="${requestScope.eventDetail.EventCategoryName}" readonly="">
                                                        </div>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group ">
                                                            <label>Event Category<span
                                                                    class="login-danger">*</span></label>
                                                            <br>
                                                            <select id="typeOfEvent" name="catelogyEventUpdate" class="form-control">
                                                                <c:choose>
                                                                    <c:when test="${requestScope.eventDetail.EventCategoryName eq 'Soft Skills'}">
                                                                        <option value="Soft Skills" selected="">Soft Skills</option>
                                                                        <option value="Talkshow">Talkshow</option>
                                                                    </c:when>
                                                                    <c:when test="${requestScope.eventDetail.EventCategoryName eq 'TalkShow'}">
                                                                        <option value="Soft Skills">Soft Skills</option>
                                                                        <option value="Talkshow" selected="">Talkshow</option>
                                                                    </c:when>
                                                                </c:choose>                                                          
                                                            </select>
                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>

                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Location</label>
                                                    <input name="locationeUpdate"  type="text" class="form-control" value="${requestScope.eventDetail.Location}" readonly>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Cost</label>
                                                    <input name="costuUpdate" type="number" class="form-control" value="${requestScope.eventDetail.Cost}" readonly>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Expected Number</label>
                                                    <input name="exnumUpdate" type="number" class="form-control" value="${requestScope.eventDetail.ExpectedNumber}" readonly>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Organization</label>
                                                    <input name="organUpdate" type="text" class="form-control" value="${requestScope.eventDetail.Organization}" readonly>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Feedback</label>
                                                    <input name="feedbackUpdate" type="text" class="form-control" value="${requestScope.eventDetail.Feedback}" readonly>
                                                </div> 
                                            </div>                                

                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Status</label>
                                                    <c:choose>
                                                        <c:when test="${sessionScope.currentTime <= requestScope.eventDetail.EndTime && sessionScope.currentTime >= requestScope.eventDetail.HoldTime && requestScope.eventDetail.Approve eq 'AA'}">
                                                            <input type="text" class="form-control" value="Happening" readonly>
                                                        </c:when>
                                                        <c:when test="${sessionScope.currentTime > requestScope.eventDetail.EndTime && requestScope.eventDetail.Approve eq 'AA'}">
                                                            <input type="text" class="form-control" value="Finished" readonly>

                                                        </c:when>
                                                        <c:when test="${requestScope.eventDetail.Approve eq 'DL'}">
                                                            <input type="text" class="form-control" value="Rejected" readonly>
                                                        </c:when>
                                                        <c:when test="${sessionScope.currentTime < requestScope.eventDetail.HoldTime && requestScope.currentTime < requestScope.eventDetail.EndTime  && requestScope.eventDetail.Approve eq 'AA'}">
                                                            <input type="text" class="form-control" value="Not Started" readonly>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control" value="Waiting Accept" readonly>
                                                        </c:otherwise>
                                                    </c:choose>         
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-group local-forms">
                                                    <label>Create By</label>
                                                    <input type="text" class="form-control" value="${requestScope.eventDetail.RollNumber}" readonly>
                                                </div>
                                            </div>
                                            <c:choose>
                                                <c:when test="${empty requestScope.eventDetail.PrizeStructureID}">

                                                </c:when>
                                                <c:otherwise>
                                                    <div style="border: solid 1px grey; border-radius: 5px;" class="col-12">
                                                        <label>Prize Structure<span class="login-danger">*</span></label>
                                                        <div class="row">
                                                            <div class="col-lg-6 col-sm-6">
                                                                <div class="form-group">
                                                                    <label>First<span class="login-danger">*</span></label>
                                                                    <input id="firstPrize" name="firstPrizeUpdate" type="number" class="form-control" value="${requestScope.eventDetail.First}" readonly="">
                                                                    <div class="message"></div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Second<span class="login-danger">*</span></label>
                                                                    <input id="secondPrize" name="secondPrizeUpdate" type="number" class="form-control" value="${requestScope.eventDetail.Second}" readonly="">
                                                                    <div class="message"></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6 col-sm-6">
                                                                <div class="form-group">
                                                                    <label>Third<span class="login-danger">*</span></label>
                                                                    <input id="thirdPrize" name="thirdPrizeUpdate" type="number" class="form-control" value="${requestScope.eventDetail.Third}" readonly="">
                                                                    <div class="message"></div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Encouragement<span class="login-danger">*</span></label>
                                                                    <input id="encouragementPrize" name="encouragementPrizeUpdate" type="number" class="form-control" value="${requestScope.eventDetail.Encouragement}" readonly="">
                                                                    <div class="message"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="col-12 col-sm-12" style="margin-top: 50px;">
                                                <div class="form-group local-forms">
                                                    <label>Description</label>
                                                    <textarea name="descriptionUpdate" type="text" class="form-control" readonly>${requestScope.eventDetail.Description}</textarea>
                                                </div>
                                            </div>
                                            <c:choose>
                                                <c:when test="${requestScope.eventDetail.Approve eq 'SC'}">
                                                    <div class="row justify-content-center">
                                                        <div  class="col-1 text-center">
                                                            <a href="/eventmanager/events/checkrequestcreate/accept/${requestScope.eventDetail.EventID}" type="button" class="btn btn-success btn-lg mb-3">Accept</a>
                                                        </div>
                                                        <div class="col-1 text-center">
                                                            <a href="/eventmanager/events/checkrequestcreate/decline/${requestScope.eventDetail.EventID}" type="button" class="btn btn-danger btn-lg mb-3">Decline</a>
                                                        </div>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                        <c:if test="${empty requestScope.eventDetail}">
                                            <tr>
                                                <td colspan="7" class="text-center">No events found.</td>
                                            </tr>
                                        </c:if>
                                    </div>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- comment -->
</div>

