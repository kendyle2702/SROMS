<%@page import="Models.Club"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.ClubDAO"%>
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
                    ClubDAO clubDAO = new ClubDAO();

                    // Call the getAllClubs method to retrieve all clubs
                    List<Club> clubsList = clubDAO.getAllClubs();
                %>
                <div class="card-body">
                    <ul class="nav nav-pills navtab-bg nav-justified" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a style="background: #ea7127;border-color:#ea7127;" href="#listClub" data-bs-toggle="tab" aria-expanded="false"
                               class="nav-link active" aria-selected="false" role="tab" tabindex="-1">
                                List Club
                            </a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a style="background: #ea7127;border-color:#ea7127;" href="#myClub" data-bs-toggle="tab" aria-expanded="true" class="nav-link"
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
                                                        <a style="background: #ea7127;border-color:#ea7127;" href="student/clubs/detail?clubID=<%= club.getClubID()%>">Club Details</a>
                                                    </div>

                                                    <form action="registerClub" method="post">
                                                        <input style="background: #ea7127;border-color:#ea7127;" type="hidden" name="clubID" value="<%= club.getClubID()%>">
                                                        <button style="background: #ea7127;border-color:#ea7127;" type="submit" class="btn btn-info">Register</button>
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
                                            <tr>
                                                <td>
                                                    <div class="date">
                                                        <b>FCoder</b>
                                                        <p>You is member </p>
                                                    </div>
                                                </td>                
                                                <%
                                                    int id = 0;
                                                    // Iterate through the list of clubs
                                                    for (Club club : clubsList) {
                                                        id = club.getClubID();
                                                    }
                                                    //  session.setAttribute(name, value);
                                                %>
                                                <td>
                                                    <div class="lesson-confirm">
                                                        <a style="background: #ea7127;border-color:#ea7127;" href="student/clubs/viewMemberClubs/<%club.getClubID();%>" class="mb-2 mr-2 btn btn-outline-organ text-white">Club Details</a>
                                                        <a style="background: #ea7127;border-color:#ea7127;" href="student/clubs/detail/<%club.getClubID();%>" class="mb-2 mr-2 btn btn-outline-organ text-white">View Members In Club</a>
                                                    </div>
                                                </td>

                                            </tr>
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