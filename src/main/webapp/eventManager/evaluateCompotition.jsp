<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="Models.Event"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.EventDAO"%>
<div class="page-wrapper">
    <div class="content container-fluid"> 
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">Evaluate Student</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Attendance And Evaluate</a></li>
                            <li class="breadcrumb-item"><a href="#">Evaluate Student</a></li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="content container-fluid"> 
            <div class="row">
                <div class="col-xl-12 d-flex">
                    <div class="card flex-fill student-space comman-shadow">
                        <div class="card-header d-flex align-items-center">
                            <h5 class="card-title">Event List</h5>
                            <ul class="chart-list-out student-ellips">
                                <li class="star-menus"><a href="javascript:;"><i class="fas fa-ellipsis-v"></i></a></li>
                            </ul>
                        </div>

                        <div class="card-body">                                      
                            <div class="table-responsive">
                                <table id="viewEvents" class="table table-hover table-striped table-bordered">
                                    <thead class="thead-light">
                                        <tr>
                                            <th class="text-center">No</th>
                                            <th class="text-center">Name</th>
                                            <th class="text-center">Location</th>
                                            <th class="text-center">End Time</th>       
                                            <th class="text-center"></th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%List<Map<String, String>> check = (List<Map<String, String>>) session.getAttribute("evaluateCompotitionStudent");
                                            if (check != null) {
                                        %>
                                        <%-- Scriptlets should be avoided, but for demonstration, I'm maintaining them --%>
                                        <%-- Scriptlets should be avoided, but for demonstration, I'm maintaining them --%>
                                        <%
                                            EventDAO dao = new EventDAO();
                                            Calendar calen = Calendar.getInstance();
                                            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
                                            Timestamp currentDateTime = new Timestamp(calen.getTimeInMillis());
                                            String currentDateTimeString = format.format(currentDateTime);
                                            int count = 0;
                                            for (Map<String, String> liste : check) {
                                                count++;

                                        %>
                                        <tr>
                                            <td class=""><%=count%></td>
                                            <td class=""><%=liste.get("EventName")%></td>
                                            <td class=""><%=liste.get("Location")%></td>
                                            <td class=""><%=liste.get("EndTime")%></td>
                                            <td class="text-center">
                                                <a style="background: #ea7127;border-color:#ea7127;" href="/eventmanager/events/compositionstudent/<%=liste.get("EventID")%>" type="button" class="btn btn-primary">Composition Student</a>
                                            </td>
                                        </tr>
                                        <%}
                                            }%>                                             
                                        <c:if test="${empty sessionScope.evaluateCompotitionStudent}">
                                            <tr>
                                                <td colspan="7" class="text-center">No events found.</td>
                                            </tr>
                                        </c:if>
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