<%@page import="Models.Club"%>
<%@page import="Models.ClubMember"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.ClubDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-wrapper">
    <div class="page-header">
        <div class="row align-items-center">
            <div class="col-sm-12">
                <div class="page-sub-header">
                    <h3 class="page-title">Members List</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Student</a></li>
                        <li class="breadcrumb-item"><a href="/student/clubs/view">View Club</a></li>
                        <li class="breadcrumb-item active">View Member Club</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="profile-header">
            <div class="row align-items-center">
                <div class="col-auto profile-image">
                    <a href="#">
                        <img class="rounded-circle" alt="User Image"
                             src="${pageContext.request.contextPath}/assets/img/logo_club/${sessionScope.myClubInfo.getLogo()}">
                    </a>
                </div>
                <div class="col ms-md-n2 profile-user-info">
                    <h4 class="user-name mb-0">${sessionScope.myClubInfo.getClubName()}</h4>

                    <h6 style="color: green;" class="text-muted">Establish Date:
                        ${sessionScope.myClubInfo.getEstablishDate()}</h6>

                    <div class="user-Location">${sessionScope.myClubInfo.getDescription()}</div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="profile-menu">
                    <ul class="nav nav-tabs nav-tabs-solid" role="tablist">
                        <c:if test="${sessionScope.getClubRole eq 'Leader Club' || sessionScope.getClubRole eq 'Board Of Directing' }">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" data-bs-toggle="tab" href="#password_tab" aria-selected="true" role="tab">Check Request Join Club</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" data-bs-toggle="tab" href="#per_details_tab" aria-selected="false" role="tab" tabindex="-1">View Club Member</a>
                            </li>
                            <li class="nav-item ms-auto"> <!-- 'ms-auto' class to push to the right -->
                                <a style="background-color: #ea7127; color: white;" class="btn btn-primary" href="${pageContext.request.contextPath}/student/createEventMyClub"><span>Create Event For Club</span></a>
                            </li>
                        </c:if>        
                        <c:if test="${sessionScope.getClubRole eq 'Member'}">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" data-bs-toggle="tab" href="#password_tab" aria-selected="true" role="tab">View Club Member</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
                <c:if test="${sessionScope.getClubRole eq 'Leader Club' || sessionScope.getClubRole eq 'Board Of Directing' }">
                    <div class="tab-content profile-tab-cont">
                        <div class="tab-pane fade" id="per_details_tab" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-xl-12 d-flex">
                                                    <div class="card flex-fill student-space comman-shadow">
                                                        <div class="card-header d-flex align-items-center">
                                                            <h5 class="card-title">List Member</h5>
                                                            <ul class="chart-list-out student-ellips">
                                                                <li class="star-menus"><a href="javascript:;"><i class="fas fa-ellipsis-v"></i></a></li>
                                                            </ul>
                                                            <div class="col-md-8 text-end">
                                                                <%
                                                                    Club myClubInfo = (Club) session.getAttribute("clubMy");
                                                                %>
                                                                <a style="background: #ea7127;border-color:#ea7127" href="/student/clubs/feedback/<%=myClubInfo.getClubID()%>" type="button" class="btn btn-primary">Point & Feedback</a>
                                                            </div>
                                                        </div>
                                                        <div class="table-responsive">
                                                            <table id="viewMemberRequest" class="table table-hover table-striped table-bordered">
                                                                <thead class="thead-light">
                                                                    <tr>
                                                                        <th class="">No.</th>
                                                                        <th class="">Full Name</th>
                                                                        <th class="">Roll Number</th>
                                                                        <th class="">Email</th>
                                                                        <th class="">Major</th>
                                                                        <th class="">Club Roll</th>
                                                                        <th></th>
                                                                            <c:choose>
                                                                                <c:when test="${sessionScope.clubRole eq 'Leader Club'}">
                                                                                <th class="">Detail</th>
                                                                                </c:when>
                                                                                <c:otherwise>

                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                </thead>
                                                                <tbody>
                                                                    <c:if test="${not empty sessionScope.listClubMember}">
                                                                        <c:forEach items="${sessionScope.listClubMember}" var="liste">
                                                                            <c:if test="${not empty liste.ClubRole && liste.ClubRole!='Decline'}">
                                                                                <c:set var="count" value="${count + 1}"/>
                                                                                <tr>
                                                                                    <td class="">${count}</td>
                                                                                    <td class="">${lieste.LastName} ${liste.FirstName}</td>
                                                                                    <td class="">${liste.RollNumber}</td>
                                                                                    <td class="">${liste.Email}</td>
                                                                                    <td class="">${liste.Major}</td>
                                                                                    <td class="">${liste.ClubRole}</td><!-- comment -->
                                                                                    <c:choose>
                                                                                        <c:when
                                                                                            test="${sessionScope.getClubRole eq 'Leader Club'}">
                                                                                            <td class="text-center">
                                                                                                <a style="background: #ea7127;border-color:#ea7127"
                                                                                                   href="/student/viewClubMember/detailMember/${liste.StudentProfileID}/${liste.ClubID}"
                                                                                                   class="btn btn-primary">Detail</a>
                                                                                            </td>
                                                                                        </c:when>
                                                                                        <c:otherwise>

                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                </tr>
                                                                            </c:if>

                                                                        </c:forEach>
                                                                    </c:if>
                                                                    <c:if test="${empty sessionScope.listClubMember}">
                                                                        <tr>
                                                                            <td colspan="6" class="text-center">No member found.</td>
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
                        </div>
                        <div id="password_tab" class="tab-pane fade active show" role="tabpanel">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-xl-12 d-flex">
                                            <div class="card flex-fill student-space comman-shadow">
                                                <div class="card-header d-flex align-items-center">
                                                    <h5 class="card-title">List Request</h5>
                                                    <ul class="chart-list-out student-ellips">
                                                        <li class="star-menus"><a href="javascript:;"><i class="fas fa-ellipsis-v"></i></a></li>
                                                    </ul>
                                                </div>                                     
                                                <div class="table-responsive">
                                                    <table id="viewMemberRequest" class="table table-hover table-striped table-bordered">
                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th class="">No.</th>                              
                                                                <th class="">Full Name</th>
                                                                <th class="">Role Number</th>
                                                                <th class="">Major</th>       
                                                                <th class="">Email</th>
                                                                <th class="">Gender</th> 
                                                                <th class="">Date Of Birthday</th> 
                                                                <th class="">Check Request</th>
                                                                <th class="">Delete</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:if test="${not empty sessionScope.listCheckRequestJoin}">
                                                                <c:forEach items="${sessionScope.listCheckRequestJoin}" var="liste" >
                                                                    <c:set var="count" value="${count + 1}"/>
                                                                    <tr>
                                                                        <td class="">${count}</td>
                                                                        <td style="padding-right: 50px;">
                                                                            <a  href="#" class="avatar avatar-lg me-2">
                                                                                <img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/assets/img/avatar/${liste.Avatar}" alt="Avatar">
                                                                            </a>
                                                                            ${liste.LastName} ${liste.FirstName}
                                                                        </td>
                                                                        <td class="">${liste.RollNumber}</td>
                                                                        <td class="">${liste.Major}</td>
                                                                        <td class="">${liste.Email}</td>
                                                                        <td class="">${liste.Gender}</td>
                                                                        <td class="">${liste.DateOfBirth}</td>
                                                                        <c:choose>                                                                                                                                             
                                                                            <c:when test="${liste.ClubRole eq 'Decline'}">
                                                                                <td></td>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <td class="">
                                                                                    <a href="/student/checkrequestjoinclub/accept/${liste.ClubID}/${liste.StudentProfileID}" class="btn btn-rounded btn-success">Accept</a> 
                                                                                    <a href="/student/checkrequestjoinclub/reject/${liste.ClubID}/${liste.StudentProfileID}" class="btn btn-rounded btn-danger">Reject</a> 
                                                                                </td>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                        <c:choose>                                                                                                                                             
                                                                            <c:when test="${liste.ClubRole eq 'Decline'}">
                                                                                <td>
                                                                                    <a href="/student/checkrequestjoinclub/delete/${liste.ClubID}/${liste.StudentProfileID}" class="btn btn-rounded btn-danger">Delete</a> 
                                                                                </td>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <td></td>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>      
                                                            <c:if test="${empty sessionScope.listCheckRequestJoin}">
                                                                <tr>
                                                                    <td colspan="9" class="text-center">No request found.</td>
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
                </c:if>
                <c:if test="${sessionScope.getClubRole eq 'Member'}">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-xl-12 d-flex">
                                            <div class="card flex-fill student-space comman-shadow">
                                                <div class="card-header d-flex align-items-center">
                                                    <h5 class="card-title">List Member</h5>
                                                    <ul class="chart-list-out student-ellips">
                                                        <li class="star-menus"><a href="javascript:;"><i class="fas fa-ellipsis-v"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="table-responsive">
                                                    <table id="viewMemberRequest" class="table table-hover table-striped table-bordered">
                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th class="">No.</th>
                                                                <th class="">Full Name</th>
                                                                <th class="">Roll Number</th>
                                                                <th class="">Email</th>
                                                                <th class="">Major</th>
                                                                <th class="">Club Roll</th>

                                                                <c:choose>
                                                                    <c:when test="${sessionScope.clubRole eq 'Leader Club'}">
                                                                        <th class="">Detail</th>
                                                                        </c:when>
                                                                        <c:otherwise>

                                                                    </c:otherwise>
                                                                </c:choose>
                                                        </thead>
                                                        <tbody>
                                                            <c:if test="${not empty sessionScope.listClubMember}">
                                                                <c:forEach items="${sessionScope.listClubMember}" var="liste">
                                                                    <c:if test="${not empty liste.ClubRole && liste.ClubRole!='Decline'}">
                                                                        <c:set var="count" value="${count + 1}"/>
                                                                        <tr>
                                                                            <td class="">${count}</td>
                                                                            <td class="">${lieste.LastName} ${liste.FirstName}</td>
                                                                            <td class="">${liste.RollNumber}</td>
                                                                            <td class="">${liste.Email}</td>
                                                                            <td class="">${liste.Major}</td>
                                                                            <td class="">${liste.ClubRole}</td>
                                                                        </tr>
                                                                    </c:if>

                                                                </c:forEach>
                                                            </c:if>
                                                            <c:if test="${empty sessionScope.listClubMember}">
                                                                <tr>
                                                                    <td colspan="6" class="text-center">No member found.</td>
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
                </c:if>
            </div>
        </div>
    </div>
</div>



