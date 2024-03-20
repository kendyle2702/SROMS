<%@page import="DAOs.NewsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.StudentProfileDAO"%>

<div class="page-wrapper">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">News</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">News</a></li>
                            <li class="breadcrumb-item active">View News</li>
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
                                    <h3 class="page-title">News</h3>
                                </div>
                                <div class="col-auto text-end float-end ms-auto download-grp">
                                    <a style="background: #ea7127;border-color:#ea7127 " href="/admin/news/create" class="btn btn-primary"><i class="fas fa-plus"></i></a>
                                </div>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table id="viewStudents" class="table table-hover table-striped table-bordered">
                                <thead class="student-thread">
                                    <tr>
                                        <th>No.</th>
                                        <th>Title</th>
                                        <th>Create At</th>
                                        <th class="text-end">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        NewsDAO newsDAO = new NewsDAO();
                                        ResultSet rs = newsDAO.getAllNewsReturnResultSet();
                                        int count = 1;
                                        while (rs.next()) {%> 
                                        <tr>
                                            <td><%=count++%></td>
                                            <td style="white-space: break-spaces;"><%=rs.getString("Title")%></td>
                                            <td><%=rs.getDate("CreateAt")%></td>
                                            <td><a href="/admin/news/detail/<%=rs.getInt("NewsID")%>"><button  style="background:#ea7127 ;border-color: #ea7127;color:white;" class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-primary"><i class="feather-edit-3"></i>Detail</button></a></td>
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