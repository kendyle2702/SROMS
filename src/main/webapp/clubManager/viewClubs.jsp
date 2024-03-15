<div class="page-wrapper">
    <div class="content container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col">
                    <h3 class="page-title">View Clubs</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item active">View Clubs</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">        
            <div class="col-xl-4 col-sm-12 col-12 d-flex">
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
                                <table id='viewClubs' class="table table-hover table-striped table-bordered">
                                    <thead class="thead-light">
                                        <tr>
                                            <th class="text-center">No.</th>
                                            <th class="text-center">Name</th>
                                            <th class="text-center">Establish Date</th>
                                            <th class="text-center">Status</th>
                                            <th class="text-center">Action</th>


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
                                                    <td class="text-center" ><button class="btn btn-outline-success active">Active</button></td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td class="text-center" ><button class="btn btn-outline-success active">Inactive</button></td>
                                                </c:otherwise>
                                            </c:choose>
                                            <td  class="text-center">                                                                
                                                <button style="background-color: #ea7127; border: none;" class="btn btn-primary btn-sm"><a style="color: white" href="/clubmanager/clubdetail/${c.getClubID()}" >View Detail</a></button>
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