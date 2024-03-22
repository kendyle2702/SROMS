<%@page import="Models.Club"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.ClubDAO"%>



<div class="page-wrapper" style="min-height: 691px;">
    <div class="content container-fluid">
        <div class="content container-fluid">
            <div class="page-header">
                <div class="row align-items-center">
                    <div class="col-sm-12">
                        <div class="page-sub-header">
                            <h3 class="page-title">Feedback</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/">Home</a></li>
                                <li class="breadcrumb-item"><a href="/student/clubs/view">View Club</a></li>
                                <li class="breadcrumb-item"><a href="/student/clubs/viewClubMember/${sessionScope.clubId}">View Member Club</a></li>
                                <li class="breadcrumb-item active">Feedback</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-xl-12 d-flex">
                                    <div class="card flex-fill student-space comman-shadow">
                                        <div class="card-header d-flex align-items-center">
                                            <h5 class="card-title">Evaluate Members</h5>
                                            <ul class="chart-list-out student-ellips">
                                                <li class="star-menus"><a href="javascript:;"><i class="fas fa-ellipsis-v"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="row">


                                            <div class="col-md-4">

                                                <form id="selectSemester" action="/student" method="post" style="margin-top: 20px">
                                                    <div class="row">
                                                        <div class="col-12 col-sm-4 col-md-6">
                                                            <div class="form-group local-forms">
                                                                <%
                                                                    String semesterIDString = (String) session.getAttribute("semesterIDStudentScore");
                                                                    Club myClubInfo = (Club) session.getAttribute("clubMy");
                                                                %>
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
                                                                <input type="hidden" name="clubIDfromViewClubMember" value="<%=myClubInfo.getClubID()%>">
                                                                <input type="hidden" name="selectClubScoreSemester" value="selectClubScoreSemester">
                                                                <button type="submit" name="filterStudentScore" class="btn btn-primary"><i style="margin-right: 10px" class="fas fa-clipboard-list"></i>Select</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>        
                                        <%
                                            ClubDAO clubDAO = new ClubDAO();
                                            int semesterID = Integer.parseInt(semesterIDString);
                                            ResultSet c_rs = clubDAO.getAllMenberClubByClubIDAndSemesterID(myClubInfo.getClubID(), semesterID);
                                        %>
                                        <div class="table-responsive">
                                            <form action="/student" method="post">
                                                <table id="viewMemberRequest" class="table table-hover table-striped table-bordered">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th class="">Full Name</th>
                                                            <th class="">Roll Number</th>
                                                            <th class="">Email</th>
                                                            <th class="">Club Roll</th>
                                                            <th class="">Point</th>
                                                            <th class="">Feedback</th>
                                                        </tr> 
                                                    </thead>
                                                    <% while (c_rs.next()) {%>
                                                    <tbody>
                                                        <tr>
                                                            <td><%= c_rs.getString("LastName") + " " + c_rs.getString("FirstName")%></td>
                                                            <td><%=c_rs.getString("RollNumber")%></td>
                                                            <td><%=c_rs.getString("Email")%></td>
                                                            <td><%=c_rs.getString("ClubRole")%></td>
                                                            <%
                                                                if (semesterID == 10) {
                                                            %>
                                                            <td>
                                                                <div>
                                                                    <input type="number" class="form-control" name="pointStudent/<%=c_rs.getInt("ClubID")%>/<%=c_rs.getInt("StudentProfileID")%>/<%=c_rs.getInt("SemesterID")%>" value="<%=c_rs.getInt("ClubPoint")%>">   
                                                                    <div class="message"></div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div>
                                                                    <input type="text" class="form-control" name="reportStudent/<%=c_rs.getInt("ClubID")%>/<%=c_rs.getInt("StudentProfileID")%>" value="<%=c_rs.getString("Report")%>">
                                                                    <div class="message"></div>
                                                                </div>
                                                            </td>
                                                            <%} else {%>
                                                            <td><%=c_rs.getInt("ClubPoint")%></td>
                                                            <td><%=c_rs.getString("Report")%></td>
                                                            <%}
                                                            %>
                                                        </tr>
                                                        <% }%> 
                                                        <%if (semesterID == 10) {%>
                                                        <tr>
                                                            <td class="text-end"  colspan="6">
                                                                <input style="background: #ea7127;border-color:#ea7127;" class="btn btn-primary" name="pointAndReportForStudent" type="submit" value="Submit">
                                                            </td>
                                                        </tr>
                                                        <%}%>
                                                    </tbody> 
                                                </table>
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
    </div>