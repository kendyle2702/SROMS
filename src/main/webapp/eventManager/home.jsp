<%@page import="java.util.HashMap"%>
<%@page import="DAOs.UserProfileDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="Controllers.LoginController"%>
<%@page import="Models.UserProfile"%>
<%@page import="Models.News"%>
<%@page import="DAOs.NewsDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="Models.Event"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.EventDAO"%>
<div class="page-wrapper">
    <div class="content container-fluid">
        <%UserProfile user = (UserProfile) session.getAttribute("user");%>
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm-12"> 
                    <div class="page-sub-header">
                        <h3 class="page-title"><%=LoginController.getTimePeriod() + ", "%><span style="font-weight: bold"><%=user.getLastName() + " " + user.getFirstName()%></span></h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item active">Home</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div style="margin-top: 30px" class="card flex-fill comman-shadow">
                <div class="card-header">
                    <div class="row align-items-center">
                        <div class="col-4">
                            <h5 class="card-title">News</h5>
                        </div>
                        <div class="col-8">
                            <ul class="chart-list-out">
                                <li class="lesson-view-all"><a href="/eventmanager/news/view">View All</a></li>
                            </ul>
                        </div>

                        <!-- box show 1 new on today -->
                        <div class="card flex-fill comman-shadow">
                            <div class="card-header">
                                <div class="row align-items-center">
                                    <div class="col-4">
                                        <h5 class="card-title">Latest News</h5>
                                    </div>
                                </div>
                                <%
                                    // Create an instance of NewsDAO
                                    NewsDAO newsDAO = new NewsDAO();

                                    // Call the getLatestNews method to fetch the latest news article
                                    News latestNews = newsDAO.getLatestNews();
                                %>
                                <div class="card-header">
                                    <div class="row align-items-center">
                                        <div class="col-10">
                                            <h4 class="blog-title"><%=latestNews.getTitle()%></h3>
                                        </div>
                                        <div class="col-2">
                                            <a style="background: #ea7127;border-color:#ea7127" href="#" data-bs-toggle="modal" data-bs-target="#news_detail<%= latestNews.getNewsID()%>" class="btn btn-primary paid-cancel-btn">
                                                Read
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                                <h6>Total Event Is Not Started</h6>
                                <h3>${sessionScope.totalEventNotStarted}</h3>
                            </div>
                            <div class="db-icon">
                                <img src="${pageContext.request.contextPath}/assets/img/icons/teacher-icon-01.svg" alt="Dashboard Icon">
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
                                <h6>Total Event Is Happening </h6>
                                <h3>${sessionScope.totalevent}</h3>
                            </div>
                            <div class="db-icon">
                                <img src="${pageContext.request.contextPath}/assets/img/icons/teacher-icon-01.svg" alt="Dashboard Icon">
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
                                <h6>Total Event Finished</h6>
                                <h3>${sessionScope.totalEventTook}</h3>
                            </div>
                            <div class="db-icon">
                                <img src="${pageContext.request.contextPath}/assets/img/icons/dash-icon-01.svg" alt="Dashboard Icon">
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
                                <h6>Total Cost Of Events</h6>
                                <h3>${sessionScope.totalcost} VND</h3>
                            </div>
                            <div class="db-icon">
                                <img src="${pageContext.request.contextPath}/assets/img/icons/teacher-icon-02.svg" alt="Dashboard Icon">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-lg-6">
                    <div class="card card-chart">
                        <div class="card-header">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <h5 class="card-title">Top 10 Students Participating In The Event The Most</h5>
                                </div>
                                <div class="col-6">
                                    <ul class="chart-list-out">
                                        <li><span class="circle-blue"></span>Full Name</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div id="top10StudentChart"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-lg-6">

                    <div class="card card-chart">
                        <div class="card-header">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <h5 class="card-title">Top 5 Event With Highest Attendance</h5>
                                </div>
                                <div class="col-6">
                                    <ul class="chart-list-out">
                                        <li><span class="circle-blue"></span>Number of participants</li>
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
        <div class="modal custom-modal fade" id="news_detail<%= latestNews.getNewsID()%>" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <h3><%=latestNews.getTitle()%></h3>
                        <div class="form-header">
                            <p><%=latestNews.getContent()%></p>
                        </div>
                        <div class="modal-btn delete-action">
                            <div class="row">
                                <div class="text-center sorting">
                                    <a href="javascript:void(0);" data-bs-dismiss="modal" class="btn btn-primary paid-cancel-btn">Cancel</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%
    EventDAO eventDAO = new EventDAO();
    List<Map<String, String>> listtop5 = eventDAO.getTop5Event();
    ArrayList<String> listName = new ArrayList<>();
    ArrayList<String> listTop5 = new ArrayList<>();
    for (Map<String, String> list : listtop5) {
        for (Map.Entry<String, String> entry : list.entrySet()) {
            if (entry.getKey().equals("EventName")) {
                listName.add(entry.getValue());
            } else {
                listTop5.add(entry.getValue());
            }
        }
    }
%>
<script>
    var options = {
        series: [{
                name: "Number of participants",
                data: [{
                        x: '<%=listName.get(0)%>',
                        y: <%=listTop5.get(0)%>
                    }, {
                        x: '<%=listName.get(1)%>',
                        y: <%=listTop5.get(1)%>
                    }, {
                        x: '<%=listName.get(2)%>',
                        y: <%=listTop5.get(2)%>
                    }, {
                        x: '<%=listName.get(3)%>',
                        y: <%=listTop5.get(3)%>
                    }, {
                        x: '<%=listName.get(4)%>',
                        y: <%=listTop5.get(4)%>
                    }]
            }],
        chart: {
            type: 'bar',
            height: 380
        },
        xaxis: {
            type: 'category',
        },
        title: {
            text: 'Event Name',
        },
    };
    var chart = new ApexCharts(document.querySelector("#top5ClubChart"), options);
    chart.render();</script>



<%
    List<Map<String, String>> listTop5Student = eventDAO.getTop5Student();
    ArrayList<String> listFullName = new ArrayList<>();
    ArrayList<String> numberEvent = new ArrayList<>();
    for (Map<String, String> list : listTop5Student) {
        for (Map.Entry<String, String> entry : list.entrySet()) {
            if (entry.getKey().equals("FullName")) {
                listFullName.add(entry.getValue());
            } else {
                numberEvent.add(entry.getValue());
            }
        }
    }
%>


<script>
    var options = {
        series: [{
                name: "Top 10 Students Participating In The Event The Most",
                data: [{
                        x: '<%=listFullName.get(0)%>',
                        y: <%=numberEvent.get(0)%>
                    }, {
                        x: '<%=listFullName.get(1)%>',
                        y: <%=numberEvent.get(1)%>
                    }, {
                        x: '<%=listFullName.get(2)%>',
                        y: <%=numberEvent.get(2)%>
                    }, {
                        x: '<%=listFullName.get(3)%>',
                        y: <%=numberEvent.get(3)%>
                    }, {
                        x: '<%=listFullName.get(4)%>',
                        y: <%=numberEvent.get(4)%>
                    }
                    , {
                        x: '<%=listFullName.get(5)%>',
                        y: <%=numberEvent.get(5)%>
                    }
                    , {
                        x: '<%=listFullName.get(6)%>',
                        y: <%=numberEvent.get(6)%>
                    }
                    , {
                        x: '<%=listFullName.get(7)%>',
                        y: <%=numberEvent.get(7)%>
                    }
                    , {
                        x: '<%=listFullName.get(8)%>',
                        y: <%=numberEvent.get(8)%>
                    }
                    , {
                        x: '<%=listFullName.get(9)%>',
                        y: <%=numberEvent.get(9)%>
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
            text: 'Full Name',
        },
    };
    var chart = new ApexCharts(document.querySelector("#top10StudentChart"), options);
    chart.render();
</script>
