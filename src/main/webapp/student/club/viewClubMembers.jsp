<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="page-wrapper">
        <div class="content container-fluid">
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
            </div>
            <div style="margin-top: 50px;" class="content container-fluid">
                <div class="row">
                    <div class="col-xl-12 d-flex">
                        <div class="card flex-fill student-space comman-shadow">
                            <div class="card-header d-flex align-items-center">
                                <h5 class="card-title">Members List</h5>
                                <ul class="chart-list-out student-ellips">
                                    <li class="star-menus"><a href="javascript:;"><i class="fas fa-ellipsis-v"></i></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="viewEvents" class="table table-hover table-striped table-bordered">
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
                                                <c:forEach items="${sessionScope.listClubMember}" var="liste"
                                                    varStatus="count">
                                                    <c:if test="${not empty liste.ClubRole}">
                                                        <tr>
                                                            <td class="">${count.index+1}</td>
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
                                                    <td colspan="7" class="text-center">No member found.</td>
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