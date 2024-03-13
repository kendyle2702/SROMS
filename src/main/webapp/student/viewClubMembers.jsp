<div class="page-wrapper">
    <div class="content container-fluid">
        <div class="row">
            <div class="col-xl-12 d-flex">
                <div class="card flex-fill student-space comman-shadow">
                    <div class="card-header d-flex align-items-center">
                        <h5 class="card-title">Members List</h5>
                        <ul class="chart-list-out student-ellips">
                            <li class="star-menus"><a href="javascript:;"><i class="fas fa-ellipsis-v"></i></a></li>
                        </ul>
                    </div>
                    <div class="card-body">                                      
                        <div class="table-responsive">
                            <table id="viewEvents" class="table table-hover table-striped table-bordered" >
                                <thead class="thead-light">
                                    <tr>
                                        <th class="">No.</th>
                                        <th class="">Full Name</th>
                                        <th class="">Roll Number</th>
                                        <th class="">Email</th>
                                        <th class="">Major</th>
                                        <th class="">Club Roll</th>
                                </thead>
                                <tbody>
                                <c:if test="${not empty sessionScope.listClubMember}">
                                    <c:forEach items="${sessionScope.listClubMember}" var="liste" varStatus="count">
                                        <tr>
                                            <td class="">${count.index+1}</td>
                                            <td class="">${lieste.LastName} ${liste.FirstName}</td>
                                            <td class="">${liste.RollNumber}</td>
                                            <td class="">${liste.Email}</td>
                                            <td class="">${liste.Major}</td>
                                            <td class="">${liste.ClubRole}</td><!-- comment -->
                                        </tr>
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
