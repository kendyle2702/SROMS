<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="Models.Event"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.EventDAO"%>
<div class="page-wrapper">
    <div class="content container-fluid">
        <div class="page-header">                               
            <div>
                <div class="page-sub-header">                          
                    <div>
                        <h3>News</h3>
                        <p>Contents</p>
                        <a href="#">View more</a>
                    </div>
                </div>
            </div>                     
        </div>
        <div class="row">
            <div class="col-xl-4 col-sm-6 col-12 d-flex">
                <div class="card bg-comman w-100">
                    <div class="card-body">
                        <div class="db-widgets d-flex justify-content-between align-items-center">
                            <div class="db-info">
                                <h6>Total Event Is Taking Place</h6>
                                <h3>${sessionScope.totalevent}</h3>
                            </div>
                            <div class="db-icon">
                                <img src="${pageContext.request.contextPath}/assets/img/icons/teacher-icon-01.svg" alt="Dashboard Icon">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-sm-6 col-12 d-flex">
                <div class="card bg-comman w-100">
                    <div class="card-body">
                        <div class="db-widgets d-flex justify-content-between align-items-center">
                            <div class="db-info">                                       
                                <h6>Total Event Took Place</h6>
                                <h3>${sessionScope.totalEventTook}</h3>
                            </div>
                            <div class="db-icon">
                                <img src="${pageContext.request.contextPath}/assets/img/icons/dash-icon-01.svg" alt="Dashboard Icon">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-sm-12 col-12 d-flex">
                <div class="card bg-comman w-100">
                    <div class="card-body">
                        <div class="db-widgets d-flex justify-content-between align-items-center">
                            <div class="db-info">
                                <h6>Total Cost Of Events</h6>
                                <h3>${sessionScope.totalcost} VND</h3>
                            </div>
                            <div class="db-icon">
                                <img src="${pageContext.request.contextPath}/assets/img/icons/teacher-icon-02.svg" alt="Dashboard Icon">
                            </div>
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
                                            <th class="text-center">No.</th>
                                            <th class="text-center">ID</th>
                                            <th class="text-center">Name</th>
                                            <th class="text-center">Location</th>
                                            <th class="text-center">Date</th>
                                            <!--                                            <th class="text-center">Type Of Event</th>-->
                                            <th class="text-center">Status</th>       
                                            <th class="text-center"></th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${not empty sessionScope.listEvent}">
                                        <c:forEach items="${sessionScope.listEvent}" var="liste" varStatus="count">
                                            <tr>
                                                <td class="">${count.index+1}</td>
                                                <td class="">${liste.getEventID()}</td>
                                                <td class="">${liste.getEventName()}</td>
                                                <td class="">${liste.getLocation()}</td>
                                                <td class="">${liste.getHoldTime()}</td>
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
                                                <c:when test="${sessionScope.currentTime <= liste.getEndTime() && liste.getApprove() eq 'AA'}">
                                                    <td class="">Happening</td>
                                                </c:when>
                                                <c:when test="${sessionScope.currentTime > liste.getEndTime() && liste.getApprove() eq 'AA'}">
                                                    <td class="">Finished</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td class="">Waiting Accept</td>
                                                </c:otherwise>
                                            </c:choose>
                                            <td class="text-center">
                                                <a href="/eventmanager/events/detail/${liste.getEventID()}" type="button" class="btn btn-primary">Detail</a>
                                            </td>
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
        </div>

        <footer>
            <p></p>
        </footer>

    </div>

</div>

