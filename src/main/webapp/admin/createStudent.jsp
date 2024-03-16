<div class="page-wrapper">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">Add Student</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Student</a></li>
                            <li class="breadcrumb-item active">Add Student</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="card comman-shadow">
                    <div class="card-body">
                        <form id="formCreateStudent" action="${pageContext.request.contextPath}/upload/profile/create" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-12">
                                    <h5 class="form-title student-info">Student Information</h5>
                                </div>
                                <div style="margin-bottom: 20px" class="col-12 col-sm-4">
                                    <div class="form-group students-up-files">
                                        <label>Upload Avatar</label>
                                        <div style="margin-bottom: 20px" class="profile-image">
                                            <img style="display: none" id="avatarImg" width="100" alt="User Image" src="">
                                        </div>
                                        <div class="upload">
                                            <input id="uploadAvatar" name="avatar" type="file" class="form-control form-control-sm">
                                            <div class="message"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-8"></div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>First Name <span class="login-danger">*</span></label>
                                        <input id="firstname" name="firstname" class="form-control" type="text" placeholder="Enter First Name">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Last Name <span class="login-danger">*</span></label>
                                        <input id="lastname" name="lastname" class="form-control" type="text" placeholder="Enter First Name">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Gender <span class="login-danger">*</span></label>
                                        <select name="gender" class=" form-select form-control select">
                                            <option value="Female">Female</option>
                                            <option value="Male">Male</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Date Of Birth <span class="login-danger">*</span></label>
                                        <input id="birthdate" name="birthdate" class="form-control" type="date" placeholder="DD-MM-YYYY">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Enroll Date<span class="login-danger">*</span></label>
                                        <input id="enrolldate" name="enrolldate" class="form-control" type="date" placeholder="DD-MM-YYYY">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Email <span class="login-danger">*</span></label>
                                        <input id="email" name="email" class="form-control" type="text" placeholder="Enter Email">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Phone <span class="login-danger">*</span></label>
                                        <input id="phone" name="phone" class="form-control" type="text" placeholder="Enter Phone">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Roll Number <span class="login-danger">*</span></label>
                                        <input id="rollnumber" name="rollnumber" class="form-control" type="text" placeholder="Enter Roll Number">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Member Code <span class="login-danger">*</span></label>
                                        <input id="membercode" name="membercode" class="form-control" type="text" placeholder="Enter Member Code">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Major <span class="login-danger">*</span></label>
                                        <input id="major" name="major" class="form-control" type="text" placeholder="Enter Major">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Mode <span class="login-danger">*</span></label>
                                        <input id="mode" name="mode" class="form-control" type="text" placeholder="Enter Mode">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Address</label>
<<<<<<< HEAD
                                        <textarea id="address" name="address" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter Address"></textarea>
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group students-up-files">
                                        <label>Upload Avatar</label>
                                        <div style="margin-bottom: 20px" class="profile-image">
                                            <img style="display: none" id="avatarImg" width="100" alt="User Image" src="">
                                        </div>
                                        <div class="upload">
                                            <input id="uploadAvatar" name="avatar" type="file" class="form-control form-control-sm">
                                            <div class="message"></div>
                                        </div>
                                    </div>
                                </div>
=======
                                        <textarea id="address" name="address" class="form-control"  rows="3" placeholder="Enter Address"></textarea>
                                        <div class="message"></div>
                                    </div>
                                </div>
                                
>>>>>>> origin/main
                                <input type="hidden" name="createStudent" value="createStudent">
                                <div class="col-12">
                                    <div class="student-submit">
                                        <button style="background: #ea7127;border-color:#ea7127" type="submit" class="btn btn-primary">Submit</button>
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