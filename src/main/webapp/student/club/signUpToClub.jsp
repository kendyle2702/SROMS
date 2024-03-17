<div class="page-wrapper" style="min-height: 691px;">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">Sign Up Club</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item active">Sign-Up Club</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="content container-fluid">
            <div class="row justify-content-center">
                <div class="col-xl-10">

                    <div class="card invoice-info-card"> 
                        <div class="card-body">
                            <form id="formSignUpClub" action="${pageContext.request.contextPath}/upload/signup/club" method="post" enctype="multipart/form-data">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <h5 class="form-title student-info">Club Information <span><a href="javascript:;"><i class="feather-more-vertical"></i></a></span></h5>
                                        </div>
                                        <div class="col-12 col-sm-12">
                                            <div class="form-group local-forms">
                                                <label>Club Name <span class="login-danger">*</span></label>
                                                <input id="clubname" name="clubname" class="form-control" type="text" placeholder="Enter Club Name">
                                                <div class="message"></div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12">
                                            <div class="form-group local-forms">
                                                <label>Description</label>
                                                <textarea id="description" name="description" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter description"></textarea>
                                                <div class="message"></div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12">
                                            <div class="form-group students-up-files">
                                                <label>Upload logo</label>
                                                <div style="margin-bottom: 20px" class="profile-image">
                                                    <img style="display: none" id="logoImg" width="100" alt="Logo Image" src="">
                                                </div>
                                                <div class="upload">
                                                    <input id="uploadLogo" name="logo" type="file" class="form-control form-control-sm">
                                                    <div class="message"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="hidden" name="signUpClub" value="signUpClub">
                                        <input type="hidden" name="studentProfileID" value="${studentProfileID}">
                                        <div class="col-12">
                                            <div class="student-submit text-end">
                                                <button style="background: #ea7127;border-color:#ea7127" type="submit" class="btn btn-primary">Submit</button>
                                            </div>
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
</div>