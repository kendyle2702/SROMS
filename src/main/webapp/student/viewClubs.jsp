<%@page import="Models.Club"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.ClubsDAO"%>
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
                <%                            // Instantiate the ClubsDAO
                    ClubsDAO clubsDAO = new ClubsDAO();

                    // Call the getAllClubs method to retrieve all clubs
                    List<Club> clubsList = clubsDAO.getAllClubs();
                %>
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
                                    <%
                                        // Check if there are any clubs in the list
                                        if (clubsList != null && !clubsList.isEmpty()) {
                                    %>
                                    <table class="table table-center">
                                        <tbody>
                                            <%
                                                // Iterate through the list of clubs
                                                for (Club club : clubsList) {
                                            %>
                                            <tr>
                                                <td>
                                                    <div class="date">
                                                        <b><%= club.getClubName()%></b>
                                                        <p><%= club.getDescription()%></p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="lesson-confirm">
                                                        <a href="student/clubs/detail?clubID=<%= club.getClubID()%>">Club Details</a>
                                                    </div>
                                                    <form action="registerClub" method="post">
                                                        <input type="hidden" name="clubID" value="<%= club.getClubID()%>">
                                                        <button type="submit" class="btn btn-info">Register</button>
                                                    </form>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                    <%
                                    } else {
                                    %>
                                    <p>No clubs found.</p>
                                    <%
                                        }
                                    %>
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



    </div>


</div>