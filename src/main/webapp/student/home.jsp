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
            <div class="col-12 col-lg-12 col-xl-8">
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
                                            <h5 class="card-title">Today?s New</h5>
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
                                    <div class="table-responsive lesson">
                                        <table class="table table-center">
                                            <tbody>
                                                <%-- Retrieve the club with the latest establishment date --%>
                                                <% DAOs.ClubsDAO clubsDAO = new DAOs.ClubsDAO();
                                                    Models.Club latestClub = clubsDAO.getClubByLatestEstablishDate();
                                                    if (latestClub != null) {%>
                                                <tr>
                                                    <td>
                                                        <div class="date">
                                                            <b><%= latestClub.getClubName()%></b>
                                                            <p><%= latestClub.getDescription()%></p>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="lesson-confirm">
                                                            <a href="/student/clubs/detail">Club Details</a>
                                                        </div>
                                                        <button type="submit" class="btn btn-info">Register</button>
                                                    </td>
                                                </tr>
                                                <% }%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                            <div class="tab-pane" id="myClub" role="tabpanel">
                                <div class="pt-3 pb-3">
                                    <div class="table-responsive lesson">
                                        <table class="table table-center">
                                            <tbody>
                                                <%
                                                    List<Models.Club> clubs = clubsDAO.getClubsForStudent(userProfile.getUserProfileID()); // Assuming studentProfileID is available
                                                    if (clubs != null && !clubs.isEmpty()) {
                                                        for (Models.Club club : clubs) {
                                                %>
                                                <tr>
                                                    <td>
                                                        <div class="date">
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

            <div class="col-12 col-lg-12 col-xl-4 d-flex">
                <div class="card flex-fill comman-shadow">
                    <div class="card-body">
                        <div class="calendar-info calendar-info1">
                            <div class="up-come-header">
                                <h2>Upcoming Events</h2>
                                <span><a href="javascript:;"><i class="feather-plus"></i></a></span>
                            </div>
                            <div class="upcome-event-date">
                                <h3>10 Jan</h3>
                                <span><i class="fas fa-ellipsis-h"></i></span>
                            </div>
                            <div class="calendar-details">
                                <p>08:00 am</p>
                                <div class="calendar-box normal-bg">
                                    <div class="calandar-event-name">
                                        <h4>Botony</h4>
                                        <h5>Lorem ipsum sit amet</h5>
                                    </div>
                                    <span>08:00 - 09:00 am</span>
                                </div>
                            </div>
                            <div class="calendar-details">
                                <p>09:00 am</p>
                                <div class="calendar-box normal-bg">
                                    <div class="calandar-event-name">
                                        <h4>Botony</h4>
                                        <h5>Lorem ipsum sit amet</h5>
                                    </div>
                                    <span>09:00 - 10:00 am</span>
                                </div>
                            </div>
                            <div class="calendar-details">
                                <p>10:00 am</p>
                                <div class="calendar-box normal-bg">
                                    <div class="calandar-event-name">
                                        <h4>Botony</h4>
                                        <h5>Lorem ipsum sit amet</h5>
                                    </div>
                                    <span>10:00 - 11:00 am</span>
                                </div>
                            </div>
                            <div class="upcome-event-date">
                                <h3>10 Jan</h3>
                                <span><i class="fas fa-ellipsis-h"></i></span>
                            </div>
                            <div class="calendar-details">
                                <p>08:00 am</p>
                                <div class="calendar-box normal-bg">
                                    <div class="calandar-event-name">
                                        <h4>English</h4>
                                        <h5>Lorem ipsum sit amet</h5>
                                    </div>
                                    <span>08:00 - 09:00 am</span>
                                </div>
                            </div>
                            <div class="calendar-details">
                                <p>09:00 am</p>
                                <div class="calendar-box normal-bg">
                                    <div class="calandar-event-name">
                                        <h4>Mathematics </h4>
                                        <h5>Lorem ipsum sit amet</h5>
                                    </div>
                                    <span>09:00 - 10:00 am</span>
                                </div>
                            </div>
                            <div class="calendar-details">
                                <p>10:00 am</p>
                                <div class="calendar-box normal-bg">
                                    <div class="calandar-event-name">
                                        <h4>History</h4>
                                        <h5>Lorem ipsum sit amet</h5>
                                    </div>
                                    <span>10:00 - 11:00 am</span>
                                </div>
                            </div>
                            <div class="calendar-details">
                                <p>11:00 am</p>
                                <div class="calendar-box break-bg">
                                    <div class="calandar-event-name">
                                        <h4>Break</h4>
                                        <h5>Lorem ipsum sit amet</h5>
                                    </div>
                                    <span>11:00 - 12:00 am</span>
                                </div>
                            </div>
                            <div class="calendar-details">
                                <p>11:30 am</p>
                                <div class="calendar-box normal-bg">
                                    <div class="calandar-event-name">
                                        <h4>History</h4>
                                        <h5>Lorem ipsum sit amet</h5>
                                    </div>
                                    <span>11:30 - 12:00 am</span>
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
