
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.nimbusds.jose.crypto.impl.AAD"%>
<%@page import="Models.Club"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.ClubDAO"%>
<div class="page-wrapper" style="min-height: 691px;">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">Welcome Student!</h3>
                        <ul class="breadcrumb">

                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="card flex-fill comman-shadow">
                <div class="card-header">
                    <div class="row align-items-center">
                        <div class="col-6">
                            <h5 class="card-title"> Club</h5>
                        </div>
                        <div class="col-6 text-end">
                            <a style="background: #ea7127;border-color:#ea7127" href="/student/clubs/create" type="button" class="btn btn-primary">Create Club</a>
                        </div>                    
                    </div>
                </div>

                <div class="card-body">
                    <ul class="nav nav-pills navtab-bg nav-justified" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a style="background: #ea7127;border-color:#ea7127;" href="#listClub" data-bs-toggle="tab" aria-expanded="false"
                               class="nav-link active" aria-selected="false" role="tab" tabindex="-1">
                                List Club
                            </a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a style="background: #ea7127;border-color:#ea7127;" href="#myClub" data-bs-toggle="tab" aria-expanded="true" class="nav-link"
                               aria-selected="true" role="tab">
                                My Club
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content">


                        <!-- List Club Tab -->
                        <div class="tab-pane active show" id="listClub" role="tabpanel">
                            <div class="row">
                                <div class="col-xl-12 d-flex">
                                    <div class="card flex-fill student-space comman-shadow">
                                        <div class="card-body">
                                            <form action="/student" method="post">
                                                <div class="table-responsive">
                                                    <table id="viewMyClub" class="table table-hover table-striped table-bordered">
                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th class="text-center">No</th>
                                                                <th class="text-center">Name</th>
                                                                <th class="text-center">Description</th>
                                                                <th class="text-center">Detail</th> 
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${sessionScope.listClub}" var="club" varStatus="count">
                                                                <c:if test="${club.isApprove == true && club.isActive == true}">
                                                                    <tr>
                                                                        <td>${count.index + 1}</td>
                                                                        <td>${club.clubName}</td>
                                                                        <td style="white-space: break-spaces;">${club.description}</td>
                                                                        <td class="text-center">
                                                                            <a style="background: #ea7127;border-color:#ea7127" href="/student/clubs/detail/${club.clubID}" type="button" class="btn btn-primary">Detail</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${empty sessionScope.listClub}">
                                                                <tr>
                                                                    <td colspan="7" class="text-center">No clubs found..</td>
                                                                </tr>
                                                            </c:if>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- My Club Tab -->
                        <div class="tab-pane" id="myClub" role="tabpanel">
                            <div class="row">
                                <div class="col-xl-12 d-flex">
                                    <div class="card flex-fill student-space comman-shadow">
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="viewClubs" class="table table-hover table-striped table-bordered">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th class="text-center">No</th>
                                                            <th class="text-center">Name</th>
                                                            <th class="text-center">Description</th>
                                                            <th class="text-center">Establish Date</th>
                                                            <th class="text-center">Detail</th>                                  
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${sessionScope.listMyClub}" var="clubM" varStatus="count">
                                                            <tr>
                                                                <td class="text-center">${count.index + 1}</td>
                                                                <td class="text-center">${clubM.getClubName()}</td>
                                                                <td class="text-center" style="white-space: break-spaces;">${clubM.getDescription()}</td>
                                                                <td>${clubM.getEstablishDate()}</td>
                                                                <td class="text-center">
                                                                    <a style="background: #ea7127;border-color:#ea7127" href="/student/clubs/viewClubMember/${clubM.clubID}" class="btn btn-primary">View Member Club</a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        <c:if test="${empty sessionScope.listMyClub}">
                                                            <tr>
                                                                <td colspan="5" class="text-center">You haven't joined the club yet.</td>
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
        </div>
    </div>
</div>
