<%@page import="Models.News"%>
<%@page import="DAOs.NewsDAO"%>
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
                        <h3 class="page-title">Home</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="card flex-fill comman-shadow">
                <div class="card-header">
                    <div class="row align-items-center">
                        <div class="col-4">
                            <h5 class="card-title"> New</h5>
                        </div>
                        <div class="col-8">
                            <ul class="chart-list-out">
                                <li class="lesson-view-all"><a href="/eventmanager/news/view">View All</a></li>
                            </ul>
                        </div>

                        <!-- box show 1 new on today -->
                        <div class="card flex-fill comman-shadow">
                            <div class="card-header">
                                <div class="row align-items-center">
                                    <div class="col-4">
                                        <h5 class="card-title">Today's New</h5>
                                    </div>
                                </div>
                                <%
                                    // Create an instance of NewsDAO
                                    NewsDAO newsDAO = new NewsDAO();

                                    // Call the getLatestNews method to fetch the latest news article
                                    News latestNews = newsDAO.getLatestNews();
                                %>
                                <div class="card-header">
                                    <div class="row align-items-center">
                                        <div class="col-10">
                                            <h3 class="blog-title"><%= latestNews.getTitle()%></h3>
                                        </div>
                                        <div class="col-2">
                                            <a style="background: #ea7127;border-color:#ea7127" href="#" data-bs-toggle="modal" data-bs-target="#news_detail<%= latestNews.getNewsID()%>" class="btn btn-primary paid-cancel-btn">
                                                Read
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-3 col-sm-6 col-12 d-flex">
                <div class="card bg-comman w-100">
                    <div class="card-body">
                        <div class="db-widgets d-flex justify-content-between align-items-center">
                            <div class="db-info">
                                <h6>Total Event Is Not Started</h6>
                                <h3>${sessionScope.totalEventNotStarted}</h3>
                            </div>
                            <div class="db-icon">
                                <img src="${pageContext.request.contextPath}/assets/img/icons/teacher-icon-01.svg" alt="Dashboard Icon">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 col-12 d-flex">
                <div class="card bg-comman w-100">
                    <div class="card-body">
                        <div class="db-widgets d-flex justify-content-between align-items-center">
                            <div class="db-info">
                                <h6>Total Event Is Happening </h6>
                                <h3>${sessionScope.totalevent}</h3>
                            </div>
                            <div class="db-icon">
                                <img src="${pageContext.request.contextPath}/assets/img/icons/teacher-icon-01.svg" alt="Dashboard Icon">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 col-12 d-flex">
                <div class="card bg-comman w-100">
                    <div class="card-body">
                        <div class="db-widgets d-flex justify-content-between align-items-center">
                            <div class="db-info">                                       
                                <h6>Total Event Finished</h6>
                                <h3>${sessionScope.totalEventTook}</h3>
                            </div>
                            <div class="db-icon">
                                <img src="${pageContext.request.contextPath}/assets/img/icons/dash-icon-01.svg" alt="Dashboard Icon">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 col-12 d-flex">
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
                                            <th class="text-center">Name</th>
                                            <th class="text-center">Location</th>
                                            <th class="text-center">Start Time</th>            
                                            <th class="text-center">Status</th>       
                                            <th class="text-center"></th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${not empty sessionScope.listEvent}">
                                            <c:forEach items="${sessionScope.listEvent}" var="liste">
                                                <c:if test="${liste.getApprove() eq 'AA'}">
                                                    <c:set var="count" value="${count + 1}"/>
                                                    <tr>
                                                        <td class="">${count}</td>                                                        
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
                                                            <c:when test="${sessionScope.currentTime <= liste.getEndTime() && sessionScope.currentTime >= liste.getHoldTime() && liste.getApprove() eq 'AA'}">
                                                                <td class=""><button type="button" class="btn btn-block btn-outline-success btn-rounded active">Happening</button></td>
                                                            </c:when>
                                                            <c:when test="${sessionScope.currentTime > liste.getEndTime() && liste.getApprove() eq 'AA'}">
                                                                <td class=""><button type="button" class="btn btn-block btn-outline-primary btn-rounded active">Finished</button></td>
                                                            </c:when>                            
                                                            <c:when test="${sessionScope.currentTime < liste.getHoldTime() && sessionScope.currentTime < liste.getEndTime()  && liste.getApprove() eq 'AA'}">
                                                                <td class=""><button type="button" class="btn btn-block btn-outline-secondary btn-rounded active">Not Started</button></td>
                                                            </c:when>

                                                        </c:choose>                    
                                                        <td class="text-center">
                                                            <a href="/eventmanager/events/detail/${liste.getEventID()}" class="mb-2 mr-2 btn btn-outline-organ text-white" style="background-color: #ea7127; border-color: #ea7127;">
                                                                <i class="feather-edit-3"></i>Detail</a>
                                                        </td>
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
        <div class="modal custom-modal fade" id="news_detail<%= latestNews.getNewsID()%>" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <h3><%=latestNews.getTitle()%></h3>
                        <div class="form-header">
                            <p><%=latestNews.getContent()%></p>
                        </div>
                        <div class="modal-btn delete-action">
                            <div class="row">
                                <div class="text-center sorting">
                                    <a href="javascript:void(0);" data-bs-dismiss="modal" class="btn btn-primary paid-cancel-btn">Cancel</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

