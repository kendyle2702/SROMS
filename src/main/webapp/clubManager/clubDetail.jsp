<%@page import="Models.Club"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.ClubDAO"%>
<div class="page-wrapper">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row">
                <div class="col">
                    <h3 class="page-title">Club Detail</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/clubmanager/viewclubs">View Club</a></li>
                        <li class="breadcrumb-item active">Club Detail</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="profile-header">
                    <div class="row align-items-center">
                        <div class="col-auto profile-image">
                            <a href="#">
                                <img class="rounded-circle" alt="User Image" src="${sessionScope.clubDetail.getLogo()}">
                            </a>
                        </div>
                        <div class="col ms-md-n2 profile-user-info">
                            <h4 class="user-name mb-0">${sessionScope.clubDetail.getClubName()}</h4>
                            <h6 style="color: green;" class="text-muted">Establish Date: ${sessionScope.clubDetail.getEstablishDate()}</h6>
                            <div class="user-Location">${sessionScope.clubDetail.getDescription()}</div>

                        </div>
                        <div class="col-auto profile-btn">
                            <% 
                             Club club = (Club)session.getAttribute("clubDetail");
                            %>
                            <a id="banAccount" href="${pageContext.request.contextPath}/clubmanager/clubdetail/block/<%=session.getAttribute("rsClubCurrentID")%>" style='display: <%=club.getIsActive()== true ? "block":"none" %> '><button class="mb-2 mr-2 btn-icon btn btn-danger"><i class="pe-7s-trash btn-icon-wrapper"></i>Lock Club</button></a> 
                            <a id="unbanAccount" href="${pageContext.request.contextPath}/clubmanager/clubdetail/unblock/<%=session.getAttribute("rsClubCurrentID")%>%>" style='display: <%=club.getIsActive()== false ? "block":"none" %>'><button class="mb-2 mr-2 btn-icon btn btn-primary"><i class="pe-7s-tools btn-icon-wrapper"> </i>Unlock Club</button></a> 

                        </div>
                    </div>
                </div>
                <div class="tab-content profile-tab-cont">
                    <div class="row">
                        <div class="col-xl-12 d-flex">
                            <div class="card flex-fill student-space comman-shadow">
                                <div class="card-header d-flex align-items-center">
                                    <h5 class="card-title">Member List</h5>
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
                                                    <th class="text-center">Roll Number</th>
                                                    <th class="text-center">Full Name</th>

                                                    <th class="text-center">Phone</th>
                                                    <th class="text-center">Club Role</th>


                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    ClubDAO cDAO = new ClubDAO();
                                                    ResultSet rs = (ResultSet) session.getAttribute("rsClubCurrent");
                                                    int count = 1;
                                                    while (rs.next()) {%> 
                                                <tr>
                                                    <td class="text-center"><%=count++%></td>
                                                    <td class="text-center"><%=rs.getString("RollNumber")%></td>

                                                    <td class="text-center"><%=rs.getString("LastName") + " " + rs.getString("FirstName")%></td>
                                                    <td class="text-center"><%=rs.getString("Phone")%></td>
                                                    <td class="text-center"><%=rs.getString("ClubRole")%></td>

                                                </tr>
                                                <%}
                                                %>
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