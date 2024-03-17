<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DAOs.EventDAO"%>
<%@page import="DAOs.ClubDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.StudentProfileDAO"%>
<%@page import="DAOs.UserLoginDAO"%>
<%@page import="Models.UserProfile"%>
<div class="page-wrapper" style="min-height: 471px;">
    <div class="content container-fluid">

        <div class="row justify-content-center">
            <div class="col-xl-10">
                <div class="card invoice-info-card">
                    <div class="card-body">
                        <div class="invoice-item invoice-item-one">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="invoice-head text-center">
                                        <h2>Club Point</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            UserProfile userPro = (UserProfile) session.getAttribute("user");
                            UserLoginDAO userLoginDAO = new UserLoginDAO();
                            int studentProfileID = userLoginDAO.getStudentProfileIDByUserProfileID(userPro.getUserProfileID());

                            StudentProfileDAO stDAO = new StudentProfileDAO();
                            ResultSet rs = stDAO.getStudentProfileMoreByID(studentProfileID);
                            while (rs.next()) {
                        %>
                        <div class="invoice-item invoice-item-two">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="invoice-info">
                                        <p>Full Name: <b><%=rs.getString("LastName") + " " + rs.getString("FirstName")%></b></p> 
                                        <p>Student Roll number: <b><%=rs.getString("RollNumber")%></b></p> 
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <form id="selectSemester" action="/student" method="post" style="margin-top: 20px">
                                        <div class="row">
                                            <div class="col-12 col-sm-4 col-md-6">
                                                <div class="form-group local-forms">
                                                    <%String semesterIDString = (String) session.getAttribute("semesterIDStudentScore");%>
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
                                                    <input type="hidden" name="selectStudentScoreSemester" value="selectStudentScoreSemester">
                                                    <button type="submit" name="filterStudentScore" class="btn btn-primary"><i style="margin-right: 10px" class="fas fa-clipboard-list"></i>Select</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>



                        <%
                            ClubDAO clubDAO = new ClubDAO();
                            EventDAO eventDAO = new EventDAO();
                            int semesterID = Integer.parseInt(semesterIDString);
                            int countClubs = clubDAO.countClubsByStudentIDAndSemesterID(rs.getInt("StudentProfileID"), semesterID);
                            int countEvents = eventDAO.countEventsByStudentIDAndSemesterID(rs.getInt("StudentProfileID"), semesterID);

                            int pointClubs = clubDAO.getClubsScoreByStudentIDAndSemesterID(rs.getInt("StudentProfileID"), semesterID);
                            int pointEvensNormal = eventDAO.getEventsScoreByStudentIDAndSemesterID(rs.getInt("StudentProfileID"), semesterID);
                            int pointEvensCompetition = eventDAO.getEventsScoreCompetitionByStudentIDAndSemesterID(rs.getInt("StudentProfileID"), semesterID);
                            int point_default = 60;
                            int total = 0;

                            int point_event = pointEvensNormal + pointEvensCompetition;
                            if (point_event > 60) {
                                point_event = 60;
                            }
                            if (pointClubs > 30) {
                                pointClubs = 30;
                            }
                            total = point_default + pointClubs + point_event;

                            ResultSet e_rs = eventDAO.getNameEventByStudentIDAndSemesterID(semesterID, rs.getInt("StudentProfileID"));
                            ResultSet ep_rs = eventDAO.getPointEventByStudentIDAndSemesterID(semesterID, rs.getInt("StudentProfileID"));
                            ResultSet c_rs = clubDAO.getNameClubsByStudentIDAndSemesterID(semesterID, rs.getInt("StudentProfileID"));
                            ResultSet cp_rs = clubDAO.getPointClubByStudentIDAndSemesterID(semesterID, rs.getInt("StudentProfileID"));

                        %>


                        <div class="invoice-item invoice-table-wrap">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="table-responsive">
                                        <table class="invoice-table table table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Content rated</th>
                                                    <th>Activity name</th>
                                                    <th>Point</th>
                                                    <th class="text-end">Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%  if (countEvents != 0) {%> 
                                                <tr>
                                                    <td style="vertical-align: top">Event</td>
                                                    <td>
                                                        <%while (e_rs.next()) {%>
                                                        <div>
                                                            <p><%=e_rs.getString("EventName")%></p>
                                                        </div>
                                                        <%}%>
                                                    </td>
                                                    <td>
                                                        <% while (ep_rs.next()) {%>
                                                        <div>
                                                            <p><%=ep_rs.getInt("Point")%></p>
                                                        </div>
                                                        <% }%>
                                                    </td>
                                                    <td class="text-end"><%=point_event%></td>
                                                </tr>
                                                <% }
                                                    if (countClubs != 0) { %>
                                                <tr>
                                                    <td>Club</td>
                                                    <td>
                                                        <%while (c_rs.next()) {%>
                                                        <div>
                                                            <p><%=c_rs.getString("ClubRole") + " on " + c_rs.getString("ClubName")%></p>
                                                        </div>
                                                        <%}%>
                                                    </td>
                                                    <td>
                                                        <%
                                                            while (cp_rs.next()) {%>
                                                        <div>
                                                            <p><%=cp_rs.getInt("ClubPoint")%></p>
                                                        </div>
                                                        <%}
                                                        %>
                                                    </td>
                                                    <td class="text-end"><%=pointClubs%></td>
                                                </tr>
                                                <% }%>
                                                <tr>
                                                    <td>Total</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td class="text-end"><%=total%></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row align-items-center justify-content-center">
                            <div class="col-lg-6 col-md-6">
                                <div class="invoice-terms">
                                    <ol>
                                        <h4><strong>Default Points:</strong></h4>
                                        <ul>
                                            Each user is allocated a default of 60 points.
                                        </ul>
                                        <strong>Points from Events:</strong>
                                        <ul>
                                            Points from events include points from regular events and competitive events.
                                            The total points from events should not exceed 60 points. If it exceeds, only a maximum of 60 points will be considered.
                                        </ul>

                                        <strong>Points from Clubs:</strong>
                                        <ul>
                                            Each user can only receive a maximum of 30 points from clubs.
                                        </ul>

                                        <strong>Total Points:</strong>
                                        <ul>
                                            The total points for each user are calculated by adding the default points, points from events, and points from clubs.</li>
                                        </ul>

                                    </ol>

                                    <p><strong>Note:</strong> If the points from events or clubs exceed the specified limit, the points will be trimmed to ensure that the total points do not exceed 150 points.</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="invoice-total-card">
                                    <div class="invoice-total-box">
                                        <div class="invoice-total-inner">
                                            <p>Default: <span><%=point_default%></span></p>
                                            <p>Event: <span><%=point_event%></span></p>
                                            <p>Club: <span><%=pointClubs%></span></p>
                                        </div>
                                        <div class="invoice-total-footer">
                                            <h4>Total: <span><%=total%></span></h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="invoice-sign text-end">
                            <a style="background: #ea7127;border-color:#ea7127" href="/student" type="button" class="btn btn-primary">Back</a>
                        </div>
                    </div>
                </div>
                <%}
                %>
            </div>
        </div>
    </div>
</div>