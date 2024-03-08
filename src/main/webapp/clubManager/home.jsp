<div class="page-wrapper">
    <div class="content container-fluid">
        <!--                <div class="page-header">                               
                            <div>
                                <div class="page-sub-header">                          
                                    <div>
                                        <h3>News</h3>
                                        <p>Contents</p>
                                      
                                    </div>
                                </div>
                            </div>                     
                        </div>-->
        <div class="row">

            <div class="col-xl-4 col-sm-6 col-12 d-flex">
                <!--                        <div class="card bg-comman w-100">
                                            <div class="card-body">
                                                <div class="db-widgets d-flex justify-content-between align-items-center">
                                                    <div class="db-info">                                       
                                                        <h6>Total Event Took Place</h6>
                                                        <h3>vd: 200</h3>
                                                    </div>
                                                    <div class="db-icon">
                                                        <img src="assets/img/icons/dash-icon-01.svg" alt="Dashboard Icon">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>-->
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
                <!--                        <div class="card bg-comman w-100">
                                                                    <div class="card-body">
                                                                        <div class="db-widgets d-flex justify-content-between align-items-center">
                                                                            <div class="db-info">
                                                                                <h6>Total Cost Of Events</h6>
                                                                                <h3>vd: 1000000VND</h3>
                                                                            </div>
                                                                            <div class="db-icon">
                                                                                <img src="assets/img/icons/teacher-icon-02.svg" alt="Dashboard Icon">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>-->
            </div>
            <div class="row">
                <div class="col-xl-12 d-flex">
                    <div class="card flex-fill student-space comman-shadow">
                        <div class="card-header d-flex align-items-center">
                            <h5 class="card-title">Club List</h5>
                            <ul class="chart-list-out student-ellips">
                                <li class="star-menus"><a href="javascript:;"><i class="fas fa-ellipsis-v"></i></a></li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table star-student table-hover table-center table-borderless table-striped">
                                    <thead class="thead-light">
                                        <tr>
                                            <th class="text-center">No.</th>
                                            <th class="text-center">Name</th>
                                            <th class="text-center">Establish Date</th>
                                            <th class="text-center">Active</th>
                                            <th class="text-center">Detail</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${not empty sessionScope.Club}">
                                        <c:forEach items="${sessionScope.Club}" var="c" varStatus="varC">
                                            <tr>
                                                <td class="text-center">${varC.index +1}</td>
                                                <td class="text-center">${c.getClubName()}</td>
                                                <td class="text-center">${c.getEstablishDate()}</td>
                                            <c:choose>
                                                <c:when test="${c.getIsActive() == true}">
                                                    <td class="text-center">Accepted</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td class="text-center">Reject</td>
                                                </c:otherwise>
                                            </c:choose>
                                            <td class="text-center row">                                                                
                                                <a href="/clubmanager/viewdetail/${c.getClubID()}" class="btn btn-primary m-auto col-5">View Detail</a>
                                                <a href="/clubmanager/delete/${c.getClubID()}" class="btn btn-danger m-auto col-5">Delete</a>
                                            </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty sessionScope.Club}">
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

    <footer>
    </footer>

</div>