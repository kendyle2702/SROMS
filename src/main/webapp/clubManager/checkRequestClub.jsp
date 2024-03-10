<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-wrapper">
    <div class="content container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col">
                    <h3 class="page-title">Home</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item active">Home</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="row">
                <div class="col-xl-12 d-flex">
                    <div class="card flex-fill student-space comman-shadow">
                        <div class="card-header d-flex align-items-center">
                            <h5 class="card-title">List Of Clubs Awaiting Approval</h5>
                            <ul class="chart-list-out student-ellips">
                                <li class="star-menus"><a href="javascript:;"><i class="fas fa-ellipsis-v"></i></a></li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id='viewClubs' class="table star-student table-hover table-center table-borderless table-striped">
                                    <thead class="thead-light">
                                        <tr>
                                            <th class="text-center">No.</th>
                                            <th class="text-center">Club ID</th>
                                            <th class="text-center">Club Name</th>
                                            <th class="text-center">Establish Date</th>
                                            <th class="text-center">Description</th>
                                            <th class="text-center">Create By</th>
                                            <th class="text-center"></th>
                                            <th class="text-center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${not empty sessionScope.listCheckRequestClub}">
                                            <c:forEach items="${sessionScope.listCheckRequestClub}" var="c" varStatus="varC">
                                                <tr>
                                                    <td class="text-center">${varC.index +1}</td>
                                                    <td class="text-center">${c.getClubID()}</td>
                                                    <td class="text-center">${c.getClubName()}</td>
                                                    <td class="text-center">${c.getEstablishDate()}</td>
                                                    <td class="text-center" style="white-space: pre-line;">${c.getDescription()}</td>
                                                    <td class="text-center">${sessionScope.fullNameCreateClub}</td>
                                                    <td class="text-center">
                                                        <a href="/clubmanager/check/accept/${c.getClubID()}" class="btn btn-primary">Accept</a>
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="/clubmanager/check/reject/${c.getClubID()}" class="btn btn-danger">Decline</a>
                                                    </td>
                                                </tr>                                            
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${empty sessionScope.listCheckRequestClub}">
                                            <tr>
                                                <td>Not found club</td>
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
