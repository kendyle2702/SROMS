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
            <div class="col-12 col-lg-4 col-xl-8">
                <div class="card flex-fill comman-shadow">
                    <div class="card-header">
                        <div class="row align-items-center">
                            <div class="col-6">
                                <h5 class="card-title">Today's News</h5>
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
                            <a href="/student/news/detail/<%=latestNews.getNewsID() %>">
                                <div class="row align-items-center">
                                    <div class="col-8">
                                        <h3 style="color: black" class="blog-title">
                                            <%=latestNews.getTitle() %> 
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
                    <div class="col-12 col-lg-12 col-xl-12 d-flex">
                        <div class="card flex-fill comman-shadow">
                            <div class="card-header">
                                <div class="row align-items-center">
                                    <div class="col-6">
                                        <h5 class="card-title">Activities Point History</h5>
                                    </div>
                                    <div class="col-6">
                                        <ul class="chart-list-out">
                                            <li><span class="circle-blue"></span>Club</li>
                                            <li><span class="circle-green"></span>Event</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div id="apexcharts-area" style="min-height: 365px;"><div id="apexchartsshdqfk87" class="apexcharts-canvas apexchartsshdqfk87 apexcharts-theme-light" style="width: 998px; height: 350px;"><svg id="SvgjsSvg1095" width="998" height="350" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" class="apexcharts-svg apexcharts-zoomable" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><foreignObject x="0" y="0" width="998" height="350"><div class="apexcharts-legend apexcharts-align-center position-bottom" xmlns="http://www.w3.org/1999/xhtml" style="inset: auto 0px 1px; position: absolute; max-height: 175px;"><div class="apexcharts-legend-series" rel="1" seriesname="Teachers" data:collapsed="false" style="margin: 2px 5px;"><span class="apexcharts-legend-marker" rel="1" data:collapsed="false" style="background: rgb(61, 94, 225); color: rgb(61, 94, 225); height: 12px; width: 12px; left: 0px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span class="apexcharts-legend-text" rel="1" i="0" data:default-text="Teachers" data:collapsed="false" style="color: rgb(55, 61, 63); font-size: 12px; font-weight: 400; font-family: Helvetica, Arial, sans-serif;">Teachers</span></div><div class="apexcharts-legend-series" rel="2" seriesname="Students" data:collapsed="false" style="margin: 2px 5px;"><span class="apexcharts-legend-marker" rel="2" data:collapsed="false" style="background: rgb(112, 196, 207); color: rgb(112, 196, 207); height: 12px; width: 12px; left: 0px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span class="apexcharts-legend-text" rel="2" i="1" data:default-text="Students" data:collapsed="false" style="color: rgb(55, 61, 63); font-size: 12px; font-weight: 400; font-family: Helvetica, Arial, sans-serif;">Students</span></div></div><style type="text/css">

                                                    .apexcharts-legend {
                                                        display: flex;
                                                        overflow: auto;
                                                        padding: 0 10px;
                                                    }
                                                    .apexcharts-legend.position-bottom, .apexcharts-legend.position-top {
                                                        flex-wrap: wrap
                                                    }
                                                    .apexcharts-legend.position-right, .apexcharts-legend.position-left {
                                                        flex-direction: column;
                                                        bottom: 0;
                                                    }
                                                    .apexcharts-legend.position-bottom.apexcharts-align-left, .apexcharts-legend.position-top.apexcharts-align-left, .apexcharts-legend.position-right, .apexcharts-legend.position-left {
                                                        justify-content: flex-start;
                                                    }
                                                    .apexcharts-legend.position-bottom.apexcharts-align-center, .apexcharts-legend.position-top.apexcharts-align-center {
                                                        justify-content: center;
                                                    }
                                                    .apexcharts-legend.position-bottom.apexcharts-align-right, .apexcharts-legend.position-top.apexcharts-align-right {
                                                        justify-content: flex-end;
                                                    }
                                                    .apexcharts-legend-series {
                                                        cursor: pointer;
                                                        line-height: normal;
                                                    }
                                                    .apexcharts-legend.position-bottom .apexcharts-legend-series, .apexcharts-legend.position-top .apexcharts-legend-series{
                                                        display: flex;
                                                        align-items: center;
                                                    }
                                                    .apexcharts-legend-text {
                                                        position: relative;
                                                        font-size: 14px;
                                                    }
                                                    .apexcharts-legend-text *, .apexcharts-legend-marker * {
                                                        pointer-events: none;
                                                    }
                                                    .apexcharts-legend-marker {
                                                        position: relative;
                                                        display: inline-block;
                                                        cursor: pointer;
                                                        margin-right: 3px;
                                                        border-style: solid;
                                                    }

                                                    .apexcharts-legend.apexcharts-align-right .apexcharts-legend-series, .apexcharts-legend.apexcharts-align-left .apexcharts-legend-series{
                                                        display: inline-block;
                                                    }
                                                    .apexcharts-legend-series.apexcharts-no-click {
                                                        cursor: auto;
                                                    }
                                                    .apexcharts-legend .apexcharts-hidden-zero-series, .apexcharts-legend .apexcharts-hidden-null-series {
                                                        display: none !important;
                                                    }
                                                    .apexcharts-inactive-legend {
                                                        opacity: 0.45;
                                                                }</style></foreignObject><g id="SvgjsG1097" class="apexcharts-inner apexcharts-graphical" transform="translate(39.25, 30)"><defs id="SvgjsDefs1096"><clipPath id="gridRectMaskshdqfk87"><rect id="SvgjsRect1103" width="957.75" height="269.348" x="-4.5" y="-2.5" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="gridRectMarkerMaskshdqfk87"><rect id="SvgjsRect1104" width="952.75" height="268.348" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><line id="SvgjsLine1102" x1="0" y1="0" x2="0" y2="264.348" stroke="#b6b6b6" stroke-dasharray="3" class="apexcharts-xcrosshairs" x="0" y="0" width="1" height="264.348" fill="#b1b9c4" filter="none" fill-opacity="0.9" stroke-width="1"></line><g id="SvgjsG1114" class="apexcharts-xaxis" transform="translate(0, 0)"><g id="SvgjsG1115" class="apexcharts-xaxis-texts-g" transform="translate(0, -4)"><text id="SvgjsText1117" font-family="Helvetica, Arial, sans-serif" x="0" y="293.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1118">Jan</tspan><title>Jan</title></text><text id="SvgjsText1120" font-family="Helvetica, Arial, sans-serif" x="158.125" y="293.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1121">Feb</tspan><title>Feb</title></text><text id="SvgjsText1123" font-family="Helvetica, Arial, sans-serif" x="316.25" y="293.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1124">Mar</tspan><title>Mar</title></text><text id="SvgjsText1126" font-family="Helvetica, Arial, sans-serif" x="474.375" y="293.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1127">Apr</tspan><title>Apr</title></text><text id="SvgjsText1129" font-family="Helvetica, Arial, sans-serif" x="632.5" y="293.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1130">May</tspan><title>May</title></text><text id="SvgjsText1132" font-family="Helvetica, Arial, sans-serif" x="790.625" y="293.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1133">Jun</tspan><title>Jun</title></text><text id="SvgjsText1135" font-family="Helvetica, Arial, sans-serif" x="948.75" y="293.348" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1136">Jul</tspan><title>Jul</title></text></g><line id="SvgjsLine1137" x1="0" y1="265.348" x2="948.75" y2="265.348" stroke="#e0e0e0" stroke-dasharray="0" stroke-width="1"></line></g><g id="SvgjsG1154" class="apexcharts-grid"><g id="SvgjsG1155" class="apexcharts-gridlines-horizontal"><line id="SvgjsLine1164" x1="0" y1="0" x2="948.75" y2="0" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine1165" x1="0" y1="44.058" x2="948.75" y2="44.058" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine1166" x1="0" y1="88.116" x2="948.75" y2="88.116" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine1167" x1="0" y1="132.174" x2="948.75" y2="132.174" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine1168" x1="0" y1="176.232" x2="948.75" y2="176.232" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine1169" x1="0" y1="220.29" x2="948.75" y2="220.29" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine1170" x1="0" y1="264.348" x2="948.75" y2="264.348" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line></g><g id="SvgjsG1156" class="apexcharts-gridlines-vertical"></g><line id="SvgjsLine1157" x1="0" y1="265.348" x2="0" y2="271.348" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1158" x1="158.125" y1="265.348" x2="158.125" y2="271.348" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1159" x1="316.25" y1="265.348" x2="316.25" y2="271.348" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1160" x1="474.375" y1="265.348" x2="474.375" y2="271.348" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1161" x1="632.5" y1="265.348" x2="632.5" y2="271.348" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1162" x1="790.625" y1="265.348" x2="790.625" y2="271.348" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1163" x1="948.75" y1="265.348" x2="948.75" y2="271.348" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1172" x1="0" y1="264.348" x2="948.75" y2="264.348" stroke="transparent" stroke-dasharray="0"></line><line id="SvgjsLine1171" x1="0" y1="1" x2="0" y2="264.348" stroke="transparent" stroke-dasharray="0"></line></g><g id="SvgjsG1105" class="apexcharts-line-series apexcharts-plot-series"><g id="SvgjsG1106" class="apexcharts-series" seriesName="Teachers" data:longestSeries="true" rel="1" data:realIndex="0"><path id="SvgjsPath1109" d="M 0 154.203C 55.34375 154.203 102.78125 88.11599999999999 158.125 88.11599999999999C 213.46875 88.11599999999999 260.90625 22.028999999999996 316.25 22.028999999999996C 371.59375 22.028999999999996 419.03125 127.76819999999998 474.375 127.76819999999998C 529.71875 127.76819999999998 577.15625 167.4204 632.5 167.4204C 687.84375 167.4204 735.28125 167.4204 790.625 167.4204C 845.96875 167.4204 893.40625 220.29 948.75 220.29" fill="none" fill-opacity="1" stroke="rgba(61,94,225,0.85)" stroke-opacity="1" stroke-linecap="butt" stroke-width="5" stroke-dasharray="0" class="apexcharts-line" index="0" clip-path="url(#gridRectMaskshdqfk87)" pathTo="M 0 154.203C 55.34375 154.203 102.78125 88.11599999999999 158.125 88.11599999999999C 213.46875 88.11599999999999 260.90625 22.028999999999996 316.25 22.028999999999996C 371.59375 22.028999999999996 419.03125 127.76819999999998 474.375 127.76819999999998C 529.71875 127.76819999999998 577.15625 167.4204 632.5 167.4204C 687.84375 167.4204 735.28125 167.4204 790.625 167.4204C 845.96875 167.4204 893.40625 220.29 948.75 220.29" pathFrom="M -1 352.464L -1 352.464L 158.125 352.464L 316.25 352.464L 474.375 352.464L 632.5 352.464L 790.625 352.464L 948.75 352.464"></path><g id="SvgjsG1107" class="apexcharts-series-markers-wrap" data:realIndex="0"><g class="apexcharts-series-markers"><circle id="SvgjsCircle1178" r="0" cx="0" cy="0" class="apexcharts-marker w655bwja1 no-pointer-events" stroke="#ffffff" fill="#3d5ee1" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" default-marker-size="0"></circle></g></g></g><g id="SvgjsG1110" class="apexcharts-series" seriesName="Students" data:longestSeries="true" rel="2" data:realIndex="1"><path id="SvgjsPath1113" d="M 0 246.7248C 55.34375 246.7248 102.78125 140.98559999999998 158.125 140.98559999999998C 213.46875 140.98559999999998 260.90625 105.73919999999998 316.25 105.73919999999998C 371.59375 105.73919999999998 419.03125 211.4784 474.375 211.4784C 529.71875 211.4784 577.15625 202.6668 632.5 202.6668C 687.84375 202.6668 735.28125 123.36239999999998 790.625 123.36239999999998C 845.96875 123.36239999999998 893.40625 242.319 948.75 242.319" fill="none" fill-opacity="1" stroke="rgba(112,196,207,0.85)" stroke-opacity="1" stroke-linecap="butt" stroke-width="5" stroke-dasharray="0" class="apexcharts-line" index="1" clip-path="url(#gridRectMaskshdqfk87)" pathTo="M 0 246.7248C 55.34375 246.7248 102.78125 140.98559999999998 158.125 140.98559999999998C 213.46875 140.98559999999998 260.90625 105.73919999999998 316.25 105.73919999999998C 371.59375 105.73919999999998 419.03125 211.4784 474.375 211.4784C 529.71875 211.4784 577.15625 202.6668 632.5 202.6668C 687.84375 202.6668 735.28125 123.36239999999998 790.625 123.36239999999998C 845.96875 123.36239999999998 893.40625 242.319 948.75 242.319" pathFrom="M -1 352.464L -1 352.464L 158.125 352.464L 316.25 352.464L 474.375 352.464L 632.5 352.464L 790.625 352.464L 948.75 352.464"></path><g id="SvgjsG1111" class="apexcharts-series-markers-wrap" data:realIndex="1"><g class="apexcharts-series-markers"><circle id="SvgjsCircle1179" r="0" cx="0" cy="0" class="apexcharts-marker w4w40mk3jg no-pointer-events" stroke="#ffffff" fill="#70c4cf" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" default-marker-size="0"></circle></g></g></g><g id="SvgjsG1108" class="apexcharts-datalabels" data:realIndex="0"></g><g id="SvgjsG1112" class="apexcharts-datalabels" data:realIndex="1"></g></g><line id="SvgjsLine1173" x1="0" y1="0" x2="948.75" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1174" x1="0" y1="0" x2="948.75" y2="0" stroke-dasharray="0" stroke-width="0" class="apexcharts-ycrosshairs-hidden"></line><g id="SvgjsG1175" class="apexcharts-yaxis-annotations"></g><g id="SvgjsG1176" class="apexcharts-xaxis-annotations"></g><g id="SvgjsG1177" class="apexcharts-point-annotations"></g><rect id="SvgjsRect1180" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe" class="apexcharts-zoom-rect"></rect><rect id="SvgjsRect1181" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe" class="apexcharts-selection-rect"></rect></g><rect id="SvgjsRect1101" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe"></rect><g id="SvgjsG1138" class="apexcharts-yaxis" rel="0" transform="translate(9.25, 0)"><g id="SvgjsG1139" class="apexcharts-yaxis-texts-g"><text id="SvgjsText1140" font-family="Helvetica, Arial, sans-serif" x="20" y="31.6" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1141">80</tspan></text><text id="SvgjsText1142" font-family="Helvetica, Arial, sans-serif" x="20" y="75.65799999999999" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1143">70</tspan></text><text id="SvgjsText1144" font-family="Helvetica, Arial, sans-serif" x="20" y="119.71599999999998" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1145">60</tspan></text><text id="SvgjsText1146" font-family="Helvetica, Arial, sans-serif" x="20" y="163.77399999999997" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1147">50</tspan></text><text id="SvgjsText1148" font-family="Helvetica, Arial, sans-serif" x="20" y="207.83199999999997" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1149">40</tspan></text><text id="SvgjsText1150" font-family="Helvetica, Arial, sans-serif" x="20" y="251.88999999999996" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1151">30</tspan></text><text id="SvgjsText1152" font-family="Helvetica, Arial, sans-serif" x="20" y="295.948" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1153">20</tspan></text></g></g><g id="SvgjsG1098" class="apexcharts-annotations"></g></svg><div class="apexcharts-tooltip apexcharts-theme-light"><div class="apexcharts-tooltip-title" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div><div class="apexcharts-tooltip-series-group" style="order: 1;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(61, 94, 225);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-label"></span><span class="apexcharts-tooltip-text-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group" style="order: 2;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(112, 196, 207);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-label"></span><span class="apexcharts-tooltip-text-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div><div class="apexcharts-xaxistooltip apexcharts-xaxistooltip-bottom apexcharts-theme-light"><div class="apexcharts-xaxistooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div></div><div class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light"><div class="apexcharts-yaxistooltip-text"></div></div></div></div>
                                <div class="resize-triggers"><div class="expand-trigger"><div style="width: 1049px; height: 416px;"></div></div><div class="contract-trigger"></div></div></div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-12 col-xl-12 d-flex">
                        <div class="card flex-fill comman-shadow">
                            <div class="card-header d-flex align-items-center">
                                <h5 class="card-title">Teaching History</h5>
                                <ul class="chart-list-out student-ellips">
                                    <li class="star-menus"><a href="javascript:;"><i class="fas fa-ellipsis-v"></i></a></li>
                                </ul>
                            </div>
                            <div class="card-body">
                                <div class="teaching-card">
                                    <ul class="steps-history">
                                        <li>Sep22</li>
                                        <li>Sep23</li>
                                        <li>Sep24</li>
                                    </ul>
                                    <ul class="activity-feed">
                                        <li class="feed-item d-flex align-items-center">
                                            <div class="dolor-activity">
                                                <span class="feed-text1"><a>Mathematics</a></span>
                                                <ul class="teacher-date-list">
                                                    <li><i class="fas fa-calendar-alt me-2"></i>September 5, 2022</li>
                                                    <li>|</li>
                                                    <li><i class="fas fa-clock me-2"></i>09:00 am - 10:00 am (60 Minutes)</li>
                                                </ul>
                                            </div>
                                            <div class="activity-btns ms-auto">
                                                <button type="submit" class="btn btn-info">In Progress</button>
                                            </div>
                                        </li>
                                        <li class="feed-item d-flex align-items-center">
                                            <div class="dolor-activity">
                                                <span class="feed-text1"><a>Geography </a></span>
                                                <ul class="teacher-date-list">
                                                    <li><i class="fas fa-calendar-alt me-2"></i>September 5, 2022</li>
                                                    <li>|</li>
                                                    <li><i class="fas fa-clock me-2"></i>09:00 am - 10:00 am (60 Minutes)</li>
                                                </ul>
                                            </div>
                                            <div class="activity-btns complete ms-auto">
                                                <button type="submit" class="btn btn-info">Completed</button>
                                            </div>
                                        </li>
                                        <li class="feed-item d-flex align-items-center">
                                            <div class="dolor-activity">
                                                <span class="feed-text1"><a>Botony</a></span>
                                                <ul class="teacher-date-list">
                                                    <li><i class="fas fa-calendar-alt me-2"></i>September 5, 2022</li>
                                                    <li>|</li>
                                                    <li><i class="fas fa-clock me-2"></i>09:00 am - 10:00 am (60 Minutes)</li>
                                                </ul>
                                            </div>
                                            <div class="activity-btns ms-auto">
                                                <button type="submit" class="btn btn-info">In Progress</button>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-12 col-xl-4 d-flex">
                <div class="card flex-fill comman-shadow">
                    <div class="card-body">
                        <div id="calendar-doctor" class="calendar-container"><div class="calendar"><header><h2 class="month">march <div class="year">2024</div></h2><a class="simple-calendar-btn btn-prev" href="#"></a><a class="simple-calendar-btn btn-next" href="#"></a></header><table><thead><td>sun</td><td>mon</td><td>tue</td><td>wed</td><td>thu</td><td>fri</td><td>sat</td></thead><tbody><tr><td><div class="day wrong-month disabled" data-date="2024-02-24T17:00:00.000Z">25</div></td><td><div class="day wrong-month disabled" data-date="2024-02-26T05:00:00.000Z">26</div></td><td><div class="day wrong-month disabled" data-date="2024-02-27T05:00:00.000Z">27</div></td><td><div class="day wrong-month disabled" data-date="2024-02-28T05:00:00.000Z">28</div></td><td><div class="day wrong-month disabled" data-date="2024-02-29T05:00:00.000Z">29</div></td><td><div class="day disabled" data-date="2024-03-01T05:00:00.000Z">1</div></td><td><div class="day disabled" data-date="2024-03-02T05:00:00.000Z">2</div></td></tr><tr><td><div class="day disabled" data-date="2024-03-03T05:00:00.000Z">3</div></td><td><div class="day disabled" data-date="2024-03-04T05:00:00.000Z">4</div></td><td><div class="day disabled" data-date="2024-03-05T05:00:00.000Z">5</div></td><td><div class="day disabled" data-date="2024-03-06T05:00:00.000Z">6</div></td><td><div class="day disabled" data-date="2024-03-07T05:00:00.000Z">7</div></td><td><div class="day disabled" data-date="2024-03-08T05:00:00.000Z">8</div></td><td><div class="day disabled" data-date="2024-03-09T05:00:00.000Z">9</div></td></tr><tr><td><div class="day disabled" data-date="2024-03-10T05:00:00.000Z">10</div></td><td><div class="day disabled" data-date="2024-03-11T05:00:00.000Z">11</div></td><td><div class="day disabled" data-date="2024-03-12T05:00:00.000Z">12</div></td><td><div class="day disabled" data-date="2024-03-13T05:00:00.000Z">13</div></td><td><div class="day disabled" data-date="2024-03-14T05:00:00.000Z">14</div></td><td><div class="day disabled" data-date="2024-03-15T05:00:00.000Z">15</div></td><td><div class="day disabled" data-date="2024-03-16T05:00:00.000Z">16</div></td></tr><tr><td><div class="day disabled" data-date="2024-03-17T05:00:00.000Z">17</div></td><td><div class="day disabled" data-date="2024-03-18T05:00:00.000Z">18</div></td><td><div class="day has-event" data-date="2024-03-19T05:00:00.000Z">19</div></td><td><div class="day has-event" data-date="2024-03-20T05:00:00.000Z">20</div></td><td><div class="day today disabled" data-date="2024-03-21T05:00:00.000Z">21</div></td><td><div class="day has-event" data-date="2024-03-22T05:00:00.000Z">22</div></td><td><div class="day disabled" data-date="2024-03-23T05:00:00.000Z">23</div></td></tr><tr><td><div class="day disabled" data-date="2024-03-24T05:00:00.000Z">24</div></td><td><div class="day disabled" data-date="2024-03-25T05:00:00.000Z">25</div></td><td><div class="day disabled" data-date="2024-03-26T05:00:00.000Z">26</div></td><td><div class="day disabled" data-date="2024-03-27T05:00:00.000Z">27</div></td><td><div class="day disabled" data-date="2024-03-28T05:00:00.000Z">28</div></td><td><div class="day disabled" data-date="2024-03-29T05:00:00.000Z">29</div></td><td><div class="day disabled" data-date="2024-03-30T05:00:00.000Z">30</div></td></tr></tbody></table><div class="event-container"><div class="close"></div><div class="event-wrapper"></div></div></div></div>
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
        <%}
        %>
    </div>

    <footer>
    </footer>

</div>