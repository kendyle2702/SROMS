<%@page import="DAOs.UserProfileDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="Models.UserProfile"%>
<%@page import="Controllers.LoginController"%>
<style>
    a{
        color:white;
    }
</style>
<div class="page-wrapper">
    <div class="content container-fluid">
        <%UserProfile user = (UserProfile) session.getAttribute("user");%>
        <div class="page-header">
            <div class="row">
                <div class="col">
                    <h3 class="page-title"><%=LoginController.getTimePeriod() + ", "%><span style="font-weight: bold"><%=user.getLastName() + " " + user.getFirstName()%></span></h3>

                    <ul class="breadcrumb">
                        <li class="breadcrumb-item active">Home</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">

            <div class="col-xl-4 col-sm-6 col-12 d-flex">
            </div>
            <div style="" class="col-xl-4 col-sm-6 col-12 d-flex ">
                <div class="card bg-comman w-100">
                    <div class="card-body">
                        <div class="db-widgets d-flex justify-content-between align-items-center">
                            <div class="db-info">
                                <h6>Total Club</h6>
                                <h3>${sessionScope.totalClub}</h3>
                            </div>
                            <div class="db-icon">
                                <img src="${pageContext.request.contextPath}/assets/img/icons/teacher-icon-01.svg" alt="Dashboard Icon">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-sm-12 col-12 d-flex">
            </div>
            <div class="row">
                <div class="col-xl-12 d-flex">
                    <div class="card flex-fill student-space comman-shadow">
                        <div class="card-header d-flex align-items-center">
                            <div class="col-md-12 col-lg-12">

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
                            <ul class="chart-list-out student-ellips">
                                <li class="star-menus"><a href="javascript:;"><i class="fas fa-ellipsis-v"></i></a></li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
    </footer>
    <%
        String semesterIDStringChart = (String) session.getAttribute("semesterIDStudentChart");
        int semesterID = Integer.parseInt(semesterIDStringChart);
        UserProfileDAO userDAO = new UserProfileDAO();

        List<Map.Entry<String, Integer>> clubMapList = userDAO.getTop5ClubBySemester(semesterID);

        ArrayList<String> keyClubList = new ArrayList<>();
        ArrayList<Integer> valueClubList = new ArrayList<>();

        for (Map.Entry<String, Integer> entry : clubMapList) {
            keyClubList.add(entry.getKey());
            valueClubList.add(entry.getValue());
        }

    %>
    <script>
        var options = {
            series: [{
                    name: "Point",
                    data: [{
                            x: '<%=keyClubList.get(0)%>',
                            y: <%=valueClubList.get(0)%>
                        }, {
                            x: '<%=keyClubList.get(1)%>',
                            y: <%=valueClubList.get(1)%>
                        }, {
                            x: '<%=keyClubList.get(2)%>',
                            y: <%=valueClubList.get(2)%>
                        }, {
                            x: '<%=keyClubList.get(3)%>',
                            y: <%=valueClubList.get(3)%>
                        }, {
                            x: '<%=keyClubList.get(4)%>',
                            y: <%=valueClubList.get(4)%>
                        }]
                }],
            chart: {
                type: 'line',
                height: 380
            },
            xaxis: {
                type: 'category',
            },
            title: {
                text: 'Club Name',
            },
        };

        var chart = new ApexCharts(document.querySelector("#top5ClubChart"), options);
        chart.render();
    </script>

</div>