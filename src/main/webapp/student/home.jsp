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
                                                <h3 class="blog-title"><a href="/student/news/detail"><%= latestNews.getTitle()%></a></h3>
                                                <p><%= latestNews.getContent()%></p>
                                            </div>
                                            <div class="col-2">
                                                <div class="skip-group">
                                                    <button type="submit" class="btn btn-info continue-btn">Next</button>
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
                                   class="nav-link active" aria-selected="false" role="tab" tabindex="-1">
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
                            <div class="tab-pane active show" id="listClub" role="tabpanel">
                                <div class="pt-3 pb-3">
                                    <!-- List Club Tab -->
                                    <div class="tab-pane active show" id="listClub" role="tabpanel">
                                        <div class="table-responsive lesson">
                                            <table class="table table-center">
                                                <tbody>
                                                <c:forEach items="${sessionScope.listClub}" var="club">
                                                    <tr>
                                                        <td>
                                                            <!-- Club Details -->
                                                            <div class="date">
                                                                <b>${club.clubName}</b>
                                                                <p>${club.description}</p>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="lesson-confirm">
                                                                <a href="student/clubs/detail?clubID=${club.clubID}">Club Details</a>
                                                            </div>
                                                            <form action="registerClub" method="post">
                                                                <input type="hidden" name="clubID" value="${club.clubID}">
                                                                <button type="submit" class="btn btn-info">Register</button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <c:if test="${empty sessionScope.listClub}">
                                                <p>No clubs found.</p>
                                            </c:if>
                                        </div>
                                    </div>

                                    <!-- My Club Tab -->
                                    <div class="tab-pane" id="myClub" role="tabpanel">
                                        <div class="table-responsive lesson">
                                            <table class="table table-center">
                                                <tbody>
                                                <c:forEach items="${sessionScope.myclub}" var="club">
                                                    <tr>
                                                        <td>
                                                            <!-- Club Details for My Club -->
                                                            <div class="date">
                                                                <b>${club.clubName}</b>
                                                                <p>${club.description}</p>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="lesson-confirm">
                                                                <a href="student/clubs/detail?clubID=${club.clubID}">Club Details</a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <c:if test="${empty sessionScope.myclub}">
                                                <p>You haven't joined any clubs yet.</p>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>


            </div>

            <div class="row">
                <div class="col-xl-12 d-flex">
                    <div class="card flex-fill student-space comman-shadow">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="viewEvents" class="table table-hover table-striped table-bordered">
                                    <thead class="thead-light">
                                        <tr>
                                            <th class="text-center">No</th>
                                            <th class="text-center">Event ID</th>
                                            <th class="text-center">Name</th>
                                            <th class="text-center">Location</th>
                                            <th class="text-center">Date</th>
                                            <th class="text-center">Category</th>
                                            <th class="text-center">Register</th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${sessionScope.listEvent}" var="event" varStatus="count">
                                        <tr>
                                            <td>${count.index + 1}</td>
                                            <td>${event.eventID}</td>
                                            <td>${event.eventName}</td>
                                            <td>${event.location}</td>
                                            <td>${event.holdTime}</td>
                                       <td>${sessionScope.eventCategoryNames[event.eventID]}</td>
                                        <td class="text-center">
                                            <form action="student" method="post">
                                                <input type="hidden" name="action" value="registerEvent">
                                                <input type="hidden" name="EventID" value="${event.eventID}">
                                                <button type="submit" class="btn btn-primary">Register</button>
                                            </form>
                                        </td>
                                        </tr>
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

    <footer>
        <p></p>
    </footer>

</div>
