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
                        <h3 class="page-title">Create Event</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/eventmanager/events/evaluate">Attendance And Evaluate</a></li>
                            <li class="breadcrumb-item"><a href="#">Evaluate Form</a></li>
                            <li class="breadcrumb-item"><a href="#">Evaluate Student Form</a></li>
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
                                <form action="/eventmanager" method="post">
                                    <table id="tableCheckAttendance" class="table table-hover table-striped">                         
                                        <thead class="thead-light">
                                            <tr>
                                                <th class="">No.</th>                              
                                                <th class="">Full Name</th>
                                                <th class="">Roll Number</th>
                                                <th class="">Major</th>       
                                                <th class="">Email</th> 
                                                <th class="">Evaluate</th> 
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${not empty sessionScope.listAttendant}">
                                                <c:forEach items="${sessionScope.listAttendant}" var="liste" varStatus="count">
                                                    <tr>
                                                        <td class="">${count.index+1}</td>
                                                        <td style="padding-right: 50px;">
                                                            <a  href="#" class="avatar avatar-lg me-2">
                                                                <img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/assets/img/avatar/${liste.Avatar}" alt="Avatar">
                                                            </a>
                                                            ${liste.LastName} ${liste.FirstName}
                                                        </td>
                                                        <td class="">${liste.RollNumber}</td>
                                                        <td class="">${liste.Major}</td>
                                                        <td class="">${liste.Email}</td>

                                                        <td>
                                                            <textarea style="border-color:#ea7127;" id="" name="evaluateStudent/${liste.StudentProfileID}/${liste.EventID}" class="form-control" placeholder="Enter evaluate for ${liste.FirstName}">${liste.Report}</textarea>
                                                        </td>                                
                                                    </tr>
                                                </c:forEach>
                                                <tr>
                                                    <td  colspan="6">
                                                        <input style="background: #ea7127;border-color:#ea7127; margin-left:1300px;width: 150px;height: 60px" class="btn btn-primary" name="evaluateStudentForm" type="submit" value="Submit">
                                                    </td>
                                                </tr>
                                            </c:if>         
                                            <c:if test="${empty sessionScope.listAttendant}">
                                                <tr>
                                                    <td colspan="7" class="text-center">No events found.</td>
                                                </tr>
                                            </c:if>
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
