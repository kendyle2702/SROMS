<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="DAOs.EventDAO"%>
<%@page import="DAOs.ClubDAO"%>
<%@page import="java.util.List"%>
<%@page import="Models.News"%>
<%@page import="DAOs.NewsDAO"%>

<div class="page-wrapper" style="min-height: 691px;">
    <div class="content container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">Welcome Student!</h3>
                        <ul class="breadcrumb">

                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12 col-lg-12 col-xl-12">
                <div class="card flex-fill comman-shadow">
                    <div class="card-header">
                        <div class="row align-items-center">
                            <div class="col-4">
                                <h5 class="card-title"> New</h5>
                            </div>
                            <div class="col-8">
                                <ul class="chart-list-out">
                                    <li class="lesson-view-all"><a href="/student/news/view">View All</a></li>
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

                <div class="card flex-fill comman-shadow">
                    <div class="card-header">
                        <div class="row align-items-center">
                            <div class="col-6">
                                <h5 class="card-title"> Club</h5>
                            </div>
                            <div class="col-6">
                                <span class="float-end view-link"><a href="/student/clubs/view"> View All</a></span>
                            </div>
                        </div>
                    </div>

                    <div class="card-body">
                        <ul class="nav nav-pills navtab-bg nav-justified" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a href="#listClub" data-bs-toggle="tab" aria-expanded="false"
                                   class="nav-link active" aria-selected="false" role="tab">
                                    List Club
                                </a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a href="#myClub" data-bs-toggle="tab" aria-expanded="true" class="nav-link"
                                   aria-selected="true" role="tab">
                                    My Club
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content">

                            <!-- List Club Tab -->
                            <div class="tab-pane active show" id="listClub" role="tabpanel">
                                <div class="row">
                                    <div class="col-xl-12 d-flex">
                                        <div class="card flex-fill student-space comman-shadow">
                                            <div class="card-body">
                                                <form action="/student" method="post">
                                                    <div class="table-responsive">
                                                        <table id="viewClubs" class="table table-hover table-striped table-bordered">
                                                            <thead class="thead-light">
                                                                <tr>
                                                                    <th class="text-center">No</th>
                                                                    <th class="text-center">Name</th>
                                                                    <th class="text-center">Description</th>
                                                                    <th class="text-center">Detail</th> 
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:forEach items="${sessionScope.listClub}" var="club" varStatus="count">
                                                                <c:if test="${count.index < 3}">
                                                                    <tr>
                                                                        <td>${count.index + 1}</td>
                                                                        <td >${club.clubName}</td>
                                                                        <td style="white-space: break-spaces;">${club.description}</td>
                                                                        <td class="text-center">
                                                                            <a style="background: #ea7127;border-color:#ea7127" href="/student/clubs/detail/${club.clubID}" type="button" class="btn btn-primary">Detail</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${empty sessionScope.listClub}">
                                                                <tr>
                                                                    <td colspan="7" class="text-center">No clubs found..</td>
                                                                </tr>
                                                            </c:if>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- My Club Tab -->
                            <div class="tab-pane" id="myClub" role="tabpanel">
                                <div class="row">
                                    <div class="col-xl-12 d-flex">
                                        <div class="card flex-fill student-space comman-shadow">
                                            <div class="card-body">
                                                <form action="/student" method="post">
                                                    <div class="table-responsive">
                                                        <table id="viewMyClub" class="table table-hover table-striped table-bordered">
                                                            <thead class="thead-light">
                                                                <tr>
                                                                    <th class="text-center">No</th>
                                                                    <th class="text-center">Name</th>
                                                                    <th class="text-center">Description</th>
                                                                    <th class="text-center">Establish Date</th>
                                                                    <th class="text-center">Detail</th> 
                                                                    <th></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:forEach items="${sessionScope.listMyClub}" var="clubM" varStatus="count">
                                                                <tr>
                                                                    <td class="text-center">${count.index + 1}</td>
                                                                    <td  style="white-space: break-spaces;">${clubM.getClubName()}</td>
                                                                    <td style="white-space: break-spaces;">${clubM.getDescription()}</td>
                                                                    <td class="text-center">${clubM.getEstablishDate()}</td>
                                                                    <td class="text-center">
                                                                        <a style="background: #ea7127;border-color:#ea7127" href="/student/clubs/detail/${club.clubID}" type="button" class="btn btn-primary">Detail</a>
                                                                    </td>
                                                                    <td class="text-center">
                                                                        <a style="background: #ea7127;border-color:#ea7127;border-radius: 10px;" href="/student/clubs/viewClubMember/${clubM.clubID}" class="btn btn-primary">View Member Club</a>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                            <c:if test="${empty sessionScope.listMyClub}">
                                                                <tr>
                                                                    <td colspan="7" class="text-center">You haven't joined the club yet.</td>
                                                                </tr>
                                                            </c:if>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card flex-fill comman-shadow">
                <div class="card-body">
                    <ul class="nav nav-pills navtab-bg nav-justified" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a href="#listEvent" data-bs-toggle="tab" aria-expanded="false"
                               class="nav-link active" aria-selected="false" role="tab">
                                Upcoming Event
                            </a>
                        </li>
                        <li class="nav-item" role="tablist  ">
                            <a href="#participated" data-bs-toggle="tab" aria-expanded="true" class="nav-link"
                               aria-selected="true" role="tab">
                                User participated 
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content">

                        <%
                            EventDAO dao = new EventDAO();
                            Calendar calen = Calendar.getInstance();
                            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
                            Timestamp currentDateTime = new Timestamp(calen.getTimeInMillis());
                            String currentDateTimeString = format.format(currentDateTime);
                            session.setAttribute("currentTime", currentDateTimeString);
                        %>

                        <!-- List Event Tab -->
                        <div class="tab-pane active show" id="listEvent" role="tabpanel">
                            <div class="row">
                                <div class="col-xl-12 d-flex">
                                    <div class="card flex-fill student-space comman-shadow">

                                        <!-- Event List -->
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="viewEvents" class="table table-hover table-striped table-bordered">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th class="text-center">No</th>
                                                            <th class="text-center">Name</th>
                                                            <th class="text-center">Location</th>
                                                            <th class="text-center">Date</th>
                                                            <th class="text-center">Category</th>
                                                            <th class="text-center"></th> 
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:set var="eventCount" value="0" />
                                                    <c:forEach items="${sessionScope.listEvent}"  var="event">
                                                        <c:if test="${sessionScope.currentTime < event.getHoldTime() && event.getApprove() eq 'AA'}">
                                                            <c:set var="eventCount" value="${eventCount + 1}" />
                                                            <tr>    
                                                                <td>${eventCount}</td>
                                                                <td style="white-space: break-spaces;">${event.eventName}</td>
                                                                <td style="white-space: break-spaces;">${event.location}</td>
                                                                <td>${event.holdTime}</td>
                                                                <td>${sessionScope.eventCategoryNames[event.eventID]}</td>
                                                                <td class="text-center">
                                                                    <a style="background: #ea7127;border-color:#ea7127;border-radius: 10px;" href="/student/events/detail/${event.eventID}" type="button" class="btn btn-primary">Detail</a>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
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

                        <!-- User participated -->
                        <div class="tab-pane" id="participated" role="tabpanel">
                            <div class="row">
                                <div class="col-xl-12 d-flex">
                                    <div class="card flex-fill student-space comman-shadow">

                                        <!-- Event List -->
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="viewEvents" class="table table-hover table-striped table-bordered">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th class="text-center">No</th>
                                                            <th class="text-center">Name</th>
                                                            <th class="text-center">Location</th>
                                                            <th class="text-center">Date</th>
                                                            <th class="text-center">Category</th>
                                                            <th class="text-center"></th> 
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:set var="eventCount" value="0" />
                                                    <c:forEach items="${sessionScope.listEventStudent}"  var="event">
                                                        <c:if test="${sessionScope.currentTime > event.getEndTime() && event.getApprove() eq 'AA'}">
                                                            <c:set var="eventCount" value="${eventCount + 1}" />
                                                            <tr>    
                                                                <td>${eventCount}</td>
                                                                <td style="white-space: break-spaces;">${event.eventName}</td>
                                                                <td style="white-space: break-spaces;">${event.location}</td>
                                                                <td>${event.holdTime}</td>
                                                                <td>${sessionScope.eventCategoryNames[event.eventID]}</td>
                                                                <td class="text-center">
                                                                    <a style="background: #ea7127;border-color:#ea7127;border-radius: 10px;" href="/student/events/detail/${event.eventID}" type="button" class="btn btn-primary">Detail</a>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
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
