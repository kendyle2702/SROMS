<%@page import="java.sql.ResultSet"%>
<div class="page-wrapper">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">Detail News</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">News</a></li>
                            <li class="breadcrumb-item"><a href="/admin/news">View News</a></li>
                            <li class="breadcrumb-item active">Detail News</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="card comman-shadow">
                    <div class="card-body">
                        <%
                            ResultSet rsNews = (ResultSet) session.getAttribute("rsNews");
                            while (rsNews.next()) {%>
                                <form id="formEditNews" action="${pageContext.request.contextPath}/admin/news" method="post">
                                    <div class="row">
                                        <div class="col-12">
                                            <h5 class="form-title student-info">News Information</h5>
                                        </div>
                                        <div class="col-12 col-sm-12">
                                            <div class="form-group local-forms">
                                                <label>Title <span class="login-danger">*</span></label>
                                                <input id="title" name="title" class="form-control" type="text" value="<%=rsNews.getString("Title") %>">
                                                <div class="message"></div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12">
                                            <div class="form-group local-forms">
                                                <label>Content <span class="login-danger">*</span></label>
                                                <textarea id="content" name="content" class="form-control" rows="3"><%=rsNews.getString("Content")%></textarea>
                                                <div class="message"></div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12">
                                            <div class="form-group local-forms">
                                                <label>Create At <span class="login-danger">*</span></label>
                                                <input disabled="" id="title" name="title" class="form-control" type="text" value="<%=rsNews.getString("CreateAt")%>">
                                                <div class="message"></div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12">
                                            <div class="form-group local-forms">
                                                <label>Create By <span class="login-danger">*</span></label>
                                                <input disabled="" id="title" name="title" class="form-control" type="text" value="<%=rsNews.getString("LastName")+ " " + rsNews.getString("FirstName")%>">
                                                <div class="message"></div>
                                            </div>
                                        </div>
                                        <input type="hidden" name="editNews" value="editNews">
                                        <input type="hidden" name="newsID" value="<%=rsNews.getString("NewsID") %>">
                                        <div class="col-12">
                                            <div class="student-submit">
                                                <button style="background: #ea7127;border-color:#ea7127" type="submit" class="btn btn-primary">Update</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>


                        <% }
                        %>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>