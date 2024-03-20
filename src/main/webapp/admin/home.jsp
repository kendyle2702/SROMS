<%@page import="DAOs.UserRoleDAO"%>
<%@page import="Models.UserProfile"%>
<%@page import="Controllers.LoginController"%>
<%
    UserRoleDAO userRoleDAO = new UserRoleDAO();
%>
<div class="page-wrapper">
    <div class="content container-fluid">
        <%UserProfile user = (UserProfile) session.getAttribute("user");%>
        <div class="page-header">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title"><%=LoginController.getTimePeriod() + ", "%><span style="font-weight: bold"><%=user.getLastName() + " " + user.getFirstName()%></span></h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item active">Home</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-xl-3 col-sm-6 col-12 d-flex">
                <div class="card bg-comman w-100">
                    <div class="card-body">
                        <div class="db-widgets d-flex justify-content-between align-items-center">
                            <div class="db-info">
                                <h6>Admin</h6>
                                <h3><%=userRoleDAO.countAdmin()%></h3>
                            </div>
                            <div class="db-icon">
                                <img src="assets/img/icons/admin_mini.png" alt="Dashboard Icon">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-sm-6 col-12 d-flex">
                <div class="card bg-comman w-100">
                    <div class="card-body">
                        <div class="db-widgets d-flex justify-content-between align-items-center">
                            <div class="db-info">
                                <h6>Event Manager</h6>
                                <h3><%=userRoleDAO.countEventManager()%></h3>
                            </div>
                            <div class="db-icon">
                                <img src="assets/img/icons/eventManager_mini.png" alt="Dashboard Icon">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 col-12 d-flex">
                <div class="card bg-comman w-100">
                    <div class="card-body">
                        <div class="db-widgets d-flex justify-content-between align-items-center">
                            <div class="db-info">
                                <h6>Club Manager</h6>
                                <h3><%=userRoleDAO.countClubManager()%></h3>
                            </div>
                            <div class="db-icon">
                                <img src="assets/img/icons/clubManager_mini.png" alt="Dashboard Icon">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 col-12 d-flex">
                <div class="card bg-comman w-100">
                    <div class="card-body">
                        <div class="db-widgets d-flex justify-content-between align-items-center">
                            <div class="db-info">
                                <h6>Student</h6>
                                <h3><%=userRoleDAO.countStudent()%></h3>
                            </div>
                            <div class="db-icon">
                                <img src="assets/img/icons/student_mini.png" alt="Dashboard Icon">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-6 col-sm-12 col-12">
                <div class="card">
                    <form id="selectSemester" action="/admin" method="post" style="margin-top: 20px;margin-left: 10px">
                        <div class="row">
                            <div class="col-12 col-sm-6">
                                <div class="form-group local-forms">
                                    <%String semesterIDString = (String) session.getAttribute("semesterIDStudentChart");%>
                                    <label>Select Semester</label>
                                    <select class="form-select form-control select" name="semesterID">
                                        <option value="10" <%=semesterIDString.equals("10") ? "selected" : ""%> >Spring 2024</option>
                                        <option value="9" <%=semesterIDString.equals("9") ? "selected" : ""%>>Fall 2023</option>
                                        <option value="8" <%=semesterIDString.equals("8") ? "selected" : ""%>>Summer 2023</option>
                                        <option value="7" <%=semesterIDString.equals("7") ? "selected" : ""%>>Spring 2023</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6">
                                <div class="form-group">
                                    <input type="hidden" name="selectChartSemester" value="selectChartSemester">
                                    <button type="submit" name="filterStudentScore" class="btn btn-primary"><i style="margin-right: 10px" class="fas fa-clipboard-list"></i>Select</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-lg-6">
                <div class="card card-chart">
                    <div class="card-header">
                        <div class="row align-items-center">
                            <div class="col-6">
                                <h5 class="card-title">Top 5 students</h5>
                            </div>
                            <div class="col-6">
                                <ul class="chart-list-out">
                                    <li><span class="circle-blue"></span>Point</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="top5StudentChart"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-lg-6">

                <div class="card card-chart">
                    <div class="card-header">
                        <div class="row align-items-center">
                            <div class="col-6">
                                <h5 class="card-title">Top 5 Clubs</h5>
                            </div>
                            <div class="col-6">
                                <ul class="chart-list-out">
                                    <li><span class="circle-blue"></span>Point</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="top5ClubChart"></div>
                    </div>
                </div>

            </div>
        </div>
<!--        <div class="row">
            <div class="col-xl-6 d-flex">

                <div class="card flex-fill student-space comman-shadow">
                    <div class="card-header d-flex align-items-center">
                        <h5 class="card-title"></h5>
                    </div>
                    <div class="card-body">

                    </div>
                </div>

            </div>
            <div class="col-xl-6 d-flex">

                <div class="card flex-fill comman-shadow">
                    <div class="card-header d-flex align-items-center">
                        <h5 class="card-title ">Chart </h5>
                    </div>
                    <div class="card-body">

                    </div>
                </div>

            </div>
        </div>-->

    </div>
    <footer>
    </footer>

</div>

