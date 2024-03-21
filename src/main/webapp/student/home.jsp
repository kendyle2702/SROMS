<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.UserProfileDAO"%>
<%@page import="Models.News"%>
<%@page import="DAOs.NewsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.StudentProfileDAO"%>
<%@page import="DAOs.UserLoginDAO"%>
<%@page import="DAOs.EventDAO"%>
<%@page import="DAOs.ClubDAO"%>
<%@page import="Controllers.LoginController"%>
<%@page import="Models.UserProfile"%>
<%@page import="DAOs.UserRoleDAO"%>
<%
    UserRoleDAO userRoleDAO = new UserRoleDAO();

    UserProfile userPro = (UserProfile) session.getAttribute("user");
    UserLoginDAO userLoginDAO = new UserLoginDAO();
    int studentProfileID = userLoginDAO.getStudentProfileIDByUserProfileID(userPro.getUserProfileID());

    StudentProfileDAO stDAO = new StudentProfileDAO();
    ResultSet rs = stDAO.getStudentProfileMoreByID(studentProfileID);
    while (rs.next()) {
%>

<div class="page-wrapper" style="min-height: 471px;">
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
        <%
            ClubDAO clubDAO = new ClubDAO();
            EventDAO eventDAO = new EventDAO();
            int semesterID = 10;
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

        %>

        <div class="row">
            <div class="col-xl-4 col-sm-6 col-12 d-flex">
                <div class="card bg-comman w-100">
                    <div class="card-body">
                        <div class="db-widgets d-flex justify-content-between align-items-center">
                            <div class="db-info">
                                <h6>Participation Event</h6>
                                <h3 class="text-center"><%=countEvents%></h3>
                            </div>  
                            <div class="db-info">
                                <h6>Point Event</h6>
                                <h3 class="text-center"><%=point_event%>/60</h3>
                            </div>
                            <div class="db-icon">
                                <img src="assets/img/icons/teacher-icon-01.svg" alt="Dashboard Icon">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-sm-6 col-12 d-flex">
                <div class="card bg-comman w-100">
                    <div class="card-body">
                        <div class="db-widgets d-flex justify-content-between align-items-center">
                            <div class="db-info">
                                <h6>Clubs</h6>
                                <h3 class="text-center"><%=countClubs%></h3>
                            </div>
                            <div class="db-info">
                                <h6>Point Club</h6>
                                <h3 class="text-center"><%=pointClubs%>/30</h3>
                            </div>
                            <div class="db-icon">
                                <img src="assets/img/icons/teacher-icon-02.svg" alt="Dashboard Icon">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-sm-6 col-12 d-flex">
                <div class="card bg-comman w-100">
                    <div class="card-body">
                        <div class="db-widgets d-flex justify-content-between align-items-center">
                            <div class="db-info text-center">
                                <h6></h6>
                                <h3></h3>
                            </div>
                            <div class="db-info text-center">
                                <h6>Total Point</h6>
                                <h3><%=total%>/150</h3>
                            </div>

                            <div class="db-icon">
                                <img src="assets/img/icons/student-icon-01.svg" alt="Dashboard Icon">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            // Create an instance of NewsDAO
            NewsDAO newsDAO = new NewsDAO();

            // Call the getLatestNews method to fetch the latest news article
            News latestNews = newsDAO.getLatestNews();
        %>

        <div class="row">
            <div class="col-12 col-lg-4 col-xl-12">
                <div class="card flex-fill comman-shadow">
                    <div class="card-header">
                        <div class="row align-items-center">
                            <div class="col-6">
                                <h5 class="card-title">Latest News</h5>
                            </div>

                            <div class="col-6">
                                <ul class="chart-list-out">
                                    <!--<li><span class="circle-blue"></span><span class="circle-gray"></span><span class="circle-gray"></span></li>-->
                                    <li class="lesson-view-all"><a href="/student/news/view">View All</a></li>
                                    <!--<li class="s    tar-menus"><a href="javascript:;"><i class="fas fa-ellipsis-v"></i></a></li>-->
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 col-xl-12 col-sm-8">
                        <div class="blog grid-blog flex-fill">
                            <a href="/student/news/detail/<%=latestNews.getNewsID()%>">
                                <div class="row align-items-center">
                                    <div class="col-8">
                                        <h3 style="color: black" class="blog-title">
                                            <%=latestNews.getTitle()%> 
                                        </h3>
                                    </div>
                                    <div class="col-4 text-end">
                                        <%=latestNews.getCreateAt()%>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card flex-fill comman-shadow">
                            <div class="card-header">
                                <div class="row align-items-center">
                                    <div class="col-6">
                                        <h5 class="card-title">Activities Point</h5>
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
            </div>
        </div>
        <%}
        %>
    </div>

    <footer>
    </footer>

</div>


<%
    String semesterIDStringChart = (String) session.getAttribute("semesterIDStudentChart");
    int semesterID = Integer.parseInt(semesterIDStringChart);
    UserProfileDAO userDAO = new UserProfileDAO();

    List<String> semesterName = new ArrayList<>(Arrays.asList("Spring 2023", "Summer 2023", "Fall 2023", "Spring 2024"));
    List<Integer> semesterInt = new ArrayList<>();
    semesterInt.add(7);
    semesterInt.add(8);
    semesterInt.add(9);
    semesterInt.add(10);
    ArrayList<Integer> valueClubList = new ArrayList<>();
    for (Integer elem : semesterInt) {
            int total = userDAO.getStudentPointByStudentProfileID(studentProfileID, elem);
            valueClubList.add(total);
        }
%>
<script>
    var options = {
        series: [{
                name: "Point",
                data: [{
                        x: '<%=semesterName.get(0)%>',
                        y: <%=valueClubList.get(0)%>
                    }, {
                        x: '<%=semesterName.get(1)%>',
                        y: <%=valueClubList.get(1)%>
                    }, {
                        x: '<%=semesterName.get(2)%>',
                        y: <%=valueClubList.get(2)%>
                    }, {
                        x: '<%=semesterName.get(3)%>',
                        y: <%=valueClubList.get(3)%>
                    }]
            }],
        chart: {
            type: 'area',
            height: 380
        },
        xaxis: {
            type: 'category',
        },
        title: {
            text: 'Semester Name',
        },
    };

    var chart = new ApexCharts(document.querySelector("#top5ClubChart"), options);
    chart.render();
</script>
