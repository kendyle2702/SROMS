<%@page import="DAOs.SemesterDAO"%>
<%@page import="DAOs.EventDAO"%>
<%@page import="DAOs.ClubDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.StudentProfileDAO"%>


<div class="page-wrapper">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">Student Score</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Score Statistic</a></li>
                            <li class="breadcrumb-item active">Student Score</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="card card-table comman-shadow">
                    <div class="card-body">

                        <div class="page-header">
                            <div class="row align-items-center">
                                <div class="col">
                                    <h3 class="page-title">Student Scores</h3>
                                </div>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table id="viewStudents" class="table table-hover table-striped table-bordered">
                                <thead class="student-thread">
                                    <tr>
                                        <th>No.</th>
                                        <th>Roll Number</th>
                                        <th>Full Name</th>
                                        <th>Starting Point</th>
                                        <th>Clubs Number</th>
                                        <th>Total Clubs Point</th>
                                        <th>Events Number</th>
                                        <th>Total Events Point</th>
                                        <th>Total Activity Point</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        SemesterDAO semDAO = new SemesterDAO();
                                        String currentSemesterName = (String)session.getAttribute("semester");
                                        int semesterID = 9;
                                        
                                        StudentProfileDAO stDAO = new StudentProfileDAO();
                                        ClubDAO clubDAO = new ClubDAO();
                                        EventDAO eventDAO = new EventDAO();
                                        ResultSet rs = stDAO.getAllStudents();
                                        int count = 1;
                                        while (rs.next()) {%> 
                                    <tr>
                                        <%
                                            int countClubs = clubDAO.countClubsByStudentIDAndSemesterID(rs.getInt("StudentProfileID"), semesterID);
                                            int pointClubs = clubDAO.getClubsScoreByStudentIDAndSemesterID(rs.getInt("StudentProfileID"), semesterID);
                                            int countEvents = eventDAO.countEventsByStudentIDAndSemesterID(rs.getInt("StudentProfileID"), semesterID);
                                            int pointEvens = eventDAO.getEventsScoreByStudentIDAndSemesterID(rs.getInt("StudentProfileID"), semesterID);
                                            int total =pointClubs+pointEvens+60;
                                        %>
                                        <td><%=count++%></td>
                                        <td><%=rs.getString("RollNumber")%></td>
                                        <td><a href="/admin/account/student/detail/<%=rs.getInt("StudentProfileID")%>" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/assets/img/avatar/<%=rs.getString("Avatar")%>" alt="Avatar"></a><%=rs.getString("LastName") + " " + rs.getString("FirstName")%></td>
                                        <td>60</td>
                                        <td><%=countClubs%></td>
                                        <td><%=pointClubs%></td>
                                        <td><%=countEvents%></td>
                                        <td><%=pointEvens%></td>
                                        <td style="font-weight: bold"><%=total%></td>
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