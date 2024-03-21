<%@page import="DAOs.EventDAO"%>
<%@page import="Models.Club"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.ClubDAO"%>
<div class="page-wrapper">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row">
                <div class="col">
                    <h3 class="page-title">Club Point Detail</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/clubmanager/viewclubpoint">View Club Point</a></li>
                        <li class="breadcrumb-item active">Club Point Detail</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="profile-header">
                    <div class="row align-items-center">
                        <div class="col-auto profile-image">
                            <a href="#">
                                <img class="rounded-circle" alt="User Image" src="${pageContext.request.contextPath}/assets/img/logo_club/${sessionScope.clubDetail.getLogo()}">
                            </a>
                        </div>
                        <div class="col ms-md-n2 profile-user-info">
                            <h4 class="user-name mb-0">${sessionScope.clubDetail.getClubName()}</h4>
                            <h6 style="color: green;" class="text-muted">Establish Date: ${sessionScope.clubDetail.getEstablishDate()}</h6>
                            <div class="user-Location">${sessionScope.clubDetail.getDescription()}</div>

                        </div>
                    </div>
                </div>
                <div class="tab-content profile-tab-cont">
                    <div class="row">
                        <div class="col-xl-12 d-flex">
                            <div class="card flex-fill student-space comman-shadow">
                                <div class="card-header d-flex align-items-center">
                                    <h5 class="card-title">Member List</h5>
                                    <ul class="chart-list-out student-ellips">
                                        <li class="star-menus"><a href="javascript:;"><i class="fas fa-ellipsis-v"></i></a></li>
                                    </ul>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id='viewClubs' class="table table-hover table-striped table-bordered">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th class="text-center">No.</th>
                                                    <th class="text-center">Roll Number</th>
                                                    <th class="text-center">Full Name</th>
                                                    <th class="text-center">Club Role</th>
                                                    <th class="text-center">Events Number</th>
                                                    <th class="text-center">Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    EventDAO eventDAO = new EventDAO();
                                                    ClubDAO cDAO = new ClubDAO();
                                                    String idSemString = (String) session.getAttribute("semesterIDClubScore");
                                                    int semesterID = Integer.parseInt(idSemString);
                                                    ResultSet rs = (ResultSet) session.getAttribute("memberCurrentClub");
                                                    int count = 1;
                                                    while (rs.next()) {
                                                        int studentID = rs.getInt("StudentProfileID");
                                                        int totalEventNormal = eventDAO.getEventsScoreByStudentIDAndSemesterID(studentID, semesterID);
                                                        int totalEventCompetition = eventDAO.getEventsScoreCompetitionByStudentIDAndSemesterID(studentID, semesterID);
                                                        int totalScore = ((totalEventNormal + totalEventCompetition) >= 60 ? 60 : (totalEventNormal + totalEventCompetition));
                                                %>
                                                <tr>
                                                    <td class="text-center"><%=count++%></td>
                                                    <td class="text-center"><%=rs.getString("RollNumber")%></td>

                                                    <td class="text-center"><%=rs.getString("LastName") + " " + rs.getString("FirstName")%></td>
                                                    <td class="text-center"><%=rs.getString("ClubRole")%></td>


                                                    <td class="text-center"><%=eventDAO.countEventsByStudentIDAndSemesterID(studentID, semesterID)%></td>
                                                    <td class="text-center"><%=totalScore%></td>
                                                </tr>
                                                <%}
                                                %>
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