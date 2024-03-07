<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Models.Event"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.EventDAO"%>
<%@page import="DAOs.EventDAO"%>
<div class="page-wrapper">
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
                                            <table class="table star-student table-hover table-center table-borderless table-striped">
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th class="text-center">No.</th>
                                                        <th class="text-center">ID</th>
                                                        <th class="text-center">Name</th>
                                                        <th class="text-center">Preparation Time</th>
                                                        <th class="text-center">Hold Time</th>
                                                        <th class="text-center">End Time.</th>
                                                        <th class="text-center">Cost</th>
                                                        <th class="text-center">Expected Number</th>
                                                        <th class="text-center">Organization</th>
                                                        <th class="text-center">Description</th>
                                                        <th class="text-center">Feedback</th>
                                                        <th class="text-center">Is Approve</th><!-- comment -->
                                                        <th class="text-center">Created By</th>                                           
                                                        <th class="text-center">Location</th>
                                                        <th class="text-center">Status</th>       
                                                        <th class="text-center"></th> 
                                                        <th class="text-center"></th> 
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:if test="${not empty sessionScope.listEvent}">
                                                    <c:forEach items="${sessionScope.listEvent}" var="liste" varStatus="count">
                                                        <tr>

                                                            <td class="text-center">${count.index+1}</td>
                                                            <td class="text-center">${liste.getEventID()}</td>
                                                            <td class="text-start">${liste.getEventName()}</td>
                                                            <td class="text-center">${liste.getPreparationTime()}</td>
                                                            <td class="text-center">${liste.getHoldTime()}</td><!-- comment -->
                                                            <td class="text-center">${liste.getEndTime()}</td>
                                                            <td class="text-center">${liste.getCost()}</td>
                                                            <td class="text-center">${liste.getExpectedNumber()}</td>
                                                            <td class="text-center">${liste.getOrganization()}</td>
                                                            <td class="text-center">${liste.getDescription()}</td>
                                                            <td class="text-center">${liste.getFeedback()}</td>
                                                            <c:choose>
                                                                <c:when test="${liste.getApprove() eq 'none'}">
                                                                    <td class="text-center">Waiting</td>
                                                                </c:when>
                                                                <c:when test="${liste.getApprove() eq 'CE'}">
                                                                    <td class="text-center">Accepted</td>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td class="text-center">Rejected</td>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <td class="text-center">${liste.getCreatedBy()}</td>                                                          
                                                            <c:forEach items="${sessionScope.numberParti}" var="num">
                                                                <c:choose>
                                                                    <c:when test="${num.EventID == liste.getEventID() && num.TotalParticipants != 0}">
<!--                                                                        <td class="text-center">${num.TotalParticipants}</td>-->
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <!--                                                                        <td class="text-center">0</td>-->
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                            <td class="text-center">${liste.getLocation()}</td>
                                                            <%
                                                                EventDAO dao = new EventDAO();
                                                                List<Event> events = dao.eventList();
                                                                Calendar calen = Calendar.getInstance();
                                                                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                                                Timestamp currentTimestamp = new Timestamp(calen.getTimeInMillis());
                                                                String isActive = "";
                                                                String eventEndDateTimeString = ""; // Define outside the loop

                                                                for (Event event : events) {
                                                                    eventEndDateTimeString = format.format(event.getEndTime());
                                                                    isActive = event.getApprove();

                                                                    if (currentTimestamp.compareTo(Timestamp.valueOf(eventEndDateTimeString)) < 0) {
                                                            %>
                                                            <td class="text-end">Happening</td>
                                                            <%
                                                                break;
                                                            } else if (currentTimestamp.compareTo(Timestamp.valueOf(eventEndDateTimeString)) >= 0) {
                                                            %>
                                                            <td class="text-end">Finished</td>
                                                            <%
                                                                    break;
                                                                }
                                                            %>
                                                            <td class="text-end">Waiting</td>
                                                            <%
                                                                }
                                                            %>

                                                            <td><a href="/eventmanager/events/detail/${liste.getEventID()}" type="button" class="btn btn-primary">Detail</a></td>
                                                        </tr>
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


                    <footer>
                        <p></p>
                    </footer>

                </div>

            </div>