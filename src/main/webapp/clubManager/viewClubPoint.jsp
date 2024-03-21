<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
                        <h3 class="page-title">Club Point</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item active">View Club Point</li>
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
                                    <h3 class="page-title">Club Point</h3>
                                </div>
                                <form id="selectSemester" action="/clubmanager" method="post" style="margin-top: 20px">
                                    <div class="row">
                                        <div class="col-12 col-sm-4">
                                            <div class="form-group local-forms">
                                                <%String semesterIDString = (String) session.getAttribute("semesterIDClubScore");%>
                                                <label>Select Semester</label>
                                                <select id="selectSemester" class="form-select form-control select" name="semesterID">
                                                    <option value="10" <%=semesterIDString.equals("10") ? "selected" : ""%> >Spring 2024</option>
                                                    <option value="9" <%=semesterIDString.equals("9") ? "selected" : ""%>>Fall 2023</option>
                                                    <option value="8" <%=semesterIDString.equals("8") ? "selected" : ""%>>Summer 2023</option>
                                                    <option value="7" <%=semesterIDString.equals("7") ? "selected" : ""%>>Spring 2023</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-4">
                                            <div class="form-group">
                                                <input type="hidden" name="selectClubScoreSemester" value="selectClubScoreSemester">
                                                <button type="submit" name="filterStudentScore" class="btn btn-primary"><i style="margin-right: 10px" class="fas fa-clipboard-list"></i>Select</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table id="viewStudents" class="table table-hover table-striped table-bordered">
                                <thead class="student-thread">
                                    <tr>
                                        <th>No.</th>
                                        <th>Logo</th>
                                        <th>Club Name</th>
                                        <th>Member Number</th>
                                        <th>Total Club Point</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int semesterID = Integer.parseInt(semesterIDString);
                                        ClubDAO clubDAO = new ClubDAO();
                                        EventDAO eventDAO = new EventDAO();
                                        ResultSet rs = clubDAO.getAllCLubReturnResultSet();
                                        int count = 1;
                                        while (rs.next()) {%> 
                                    <tr>
                                        <%
                                            ArrayList<Integer> listIDStudent = clubDAO.getAllStudentInClub(rs.getInt("ClubID"), semesterID);
                                            int totalScore = 0;
                                            int totalEventNormal = 0;
                                            int totalEventCompetition = 0;
                                            for (Integer studentID : listIDStudent) {
                                                totalEventNormal += eventDAO.getEventsScoreByStudentIDAndSemesterID(studentID, semesterID);
                                                totalEventCompetition += eventDAO.getEventsScoreCompetitionByStudentIDAndSemesterID(studentID, semesterID);
                                            }
                                            totalScore = totalEventNormal+totalEventCompetition;
                                        %>
                                        <td><%=count++%></td>
                                        <td><a href="#" class="avatar avatar-xl me-2"><img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/assets/img/logo_club/<%=rs.getString("Logo")%>" alt="Logo"></a></td>
                                        <td><%=rs.getString("ClubName")%></td>
                                        <td><%=listIDStudent.size()%></td>
                                        <td><%=totalScore%></td>
                                        <td><a href="/clubmanager/viewclubpoint/detail/<%=rs.getInt("ClubID")%>"><button style="background:#ea7127 ;border-color: #ea7127;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-warning"><i class="feather-edit-3"></i>Detail</button></a></td>
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