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
                                                <a href="#" data-bs-toggle="modal" data-bs-target="#news_detail<%= latestNews.getNewsID()%>" class="btn btn-primary paid-cancel-btn">
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
                                <div class="pt-3 pb-3">
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
                            </div>

                            <!-- My Club Tab -->
                            <div class="tab-pane" id="myClub" role="tabpanel">
                                <div class="pt-3 pb-3">
                                    <div class="table-responsive lesson">
                                        <table class="table table-center">
                                            <tbody>
                                                <%
                                                    ClubDAO clubDAO = new ClubDAO();
                                                    List<Models.Club> clubs = clubDAO.getMyClubs(userProfile.getUserProfileID()); // Assuming studentProfileID is available

                                                    if (clubs != null && !clubs.isEmpty()) {
                                                        for (Models.Club club : clubs) {
                                                            String semesterName = clubDAO.getSemesterNameByClubID(club.getClubID()); // Move inside the loop to ensure it's updated for each club
                                                %>
                                                <tr>
                                                    <td>
                                                        <div class="date">
                                                            <b><%= semesterName%></b>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="card-text">
                                                            <b><%= club.getClubName()%></b>
                                                            <p><%= club.getDescription()%></p> <!-- Assuming getClubRole method exists -->
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="lesson-confirm">
                                                            <a href="student/clubs/detail?clubID=<%= club.getClubID()%>">Club Details</a> <!-- Assuming getClubID method exists -->
                                                        </div>
                                                    </td>
                                                </tr>
                                                <%
                                                    }
                                                } else {
                                                %>
                                            <div class="row align-items-center">
                                                <div class="col-6">
                                                    <h5 class="card-text">You haven't joined the club yet</h5>
                                                </div>
                                                <div class="col-6">
                                                    <span class="float-end view-link"><a href="/student/clubs/view"> See More</a></span>
                                                </div>
                                            </div> 
                                            <% }%>
                                            </tbody>
                                        </table>
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

    <footer>
        <p></p>
    </footer>

</div>
