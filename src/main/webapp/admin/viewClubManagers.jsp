<%@page import="DAOs.ManagerProfileDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.StudentProfileDAO"%>


<div class="page-wrapper">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">Club Managers</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Club Managers</a></li>
                            <li class="breadcrumb-item active">View Club Managers</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="card card-table comman-shadow">
                    <div class="card-body">

                        <div class="page-header">
                            <div class="row align-items-center">
                                <div class="col">
                                    <h3 class="page-title">Club Manager Accounts</h3>
                                </div>
                                <div class="col-auto text-end float-end ms-auto download-grp">
                                    <a style="background: #ea7127;border-color:#ea7127 " href="/admin/account/clubmanager/create" class="btn btn-primary"><i class="fas fa-plus"></i></a>
                                </div>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table id="viewStudents" class="table table-hover table-striped table-bordered">
                                <thead class="student-thread">
                                    <tr>
                                        <th>No.</th>
                                        <th>Staff Number</th>
                                        <th>Full Name</th>
                                        <th>Username/Email</th>
                                        <th>Academic Level</th>
                                        <th>Status</th>
                                        <th class="text-end">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        ManagerProfileDAO mDAO = new ManagerProfileDAO();
                                        ResultSet rs = mDAO.getAllClubManager();
                                        int count = 1;
                                        while (rs.next()) {%> 
                                    <tr>
                                        <td><%=count++%></td>
                                        <td><%=rs.getString("StaffNumber")%></td>
                                        <td><a href="/admin/account/clubmanager/detail/<%=rs.getInt("ManagerProfileID")%>" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="${pageContext.request.contextPath}/assets/img/avatar/<%=rs.getString("Avatar")%>" alt="Avatar"></a><%=rs.getString("FirstName") + " " + rs.getString("LastName")%></td>
                                        <td><%=rs.getString("Username")%></td>
                                        <td><%=rs.getString("AcademicLevel")%></td>
                                        <td><%=rs.getBoolean("IsActive") == true ? "<button class=\"btn btn-primary btn-sm btn-rounded\">Active</button>" : "<button class=\"btn btn-danger btn-sm btn-rounded\">Blocked</button>"%></td>
                                        <td><a href="/admin/account/clubmanager/detail/<%=rs.getInt("ManagerProfileID")%>"><button  style="background:#ea7127 ;border-color: #ea7127;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-primary"><i class="feather-edit-3"></i>Detail</button></a></td>
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