<div class="page-wrapper">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">Add News</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">News</a></li>
                            <li class="breadcrumb-item active">Add News</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="card comman-shadow">
                    <div class="card-body">
                        <form id="formCreateNews" action="${pageContext.request.contextPath}/upload/profile/create" method="post">
                            <div class="row">
                                <div class="col-12">
                                    <h5 class="form-title student-info">News Information</h5>
                                </div>
                                <div class="col-12 col-sm-12">
                                    <div class="form-group local-forms">
                                        <label>Title <span class="login-danger">*</span></label>
                                        <input id="firstname" name="firstname" class="form-control" type="text" placeholder="Enter Title">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12">
                                    <div class="form-group local-forms">
                                        <label>Content <span class="login-danger">*</span></label>
                                        <textarea id="address" name="address" class="form-control" rows="3" placeholder="Enter Content"></textarea>
                                        <div class="message"></div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>