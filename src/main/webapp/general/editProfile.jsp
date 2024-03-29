<%@page import="Models.UserProfile"%>
<%  
    UserProfile userEdit = (UserProfile) session.getAttribute("user");
    String roleE = (String) session.getAttribute("role");
    String roleEdit = (String)session.getAttribute("roleURL");
%>
<div class="page-wrapper">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">Edit Profile</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item"><a href="/<%=roleEdit%>/profile">Profile</a></li>
                            <li class="breadcrumb-item active">Edit</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="card comman-shadow">
                    <div class="card-body">

                        
                        <form id="formEditProfile" action="${pageContext.request.contextPath}/upload/profile/edit" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-12">
                                    <h5 class="form-title student-info">Student Information <span><a href="javascript:;"><i class="feather-more-vertical"></i></a></span></h5>
                                </div>
                                <div style="margin-bottom: 20px" class="col-12 col-sm-4">
                                    <div class="form-group students-up-files">
                                        <label>Upload Avatar</label>
                                        <div style="margin-bottom: 20px" class="profile-image">
                                            <img id="avatarImg" width="100" alt="User Image" src="${pageContext.request.contextPath}/assets/img/avatar/<%=userEdit.getAvatar()%>">
                                        </div>
                                        <div class="upload">
                                            <input name="avatar" type="file" id="uploadAvatar" class="form-control form-control-sm">
                                            <div class="message"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-8"></div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>First Name <span class="login-danger">*</span></label>
                                        <input id="firstname" name="firstname" class="form-control" type="text" value="<%=userEdit.getFirstName()%>">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Last Name <span class="login-danger">*</span></label>
                                        <input id="lastname" name ="lastname" class="form-control" type="text" value="<%=userEdit.getLastName()%>">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class=" form-group local-forms">
                                        <label>Gender <span class="login-danger">*</span></label>
                                        <select name="gender" class=" form-select form-control select">
                                            <option value="Female" <%=userEdit.getGender().equals("Female") ? "selected" : ""%>>Female</option>
                                            <option value="Male" <%=userEdit.getGender().equals("Male") ? "selected" : ""%>>Male</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label for="birthdate">Date Of Birth <span class="login-danger">*</span></label>
                                        <input id="birthdate" name="birthdate" id="birthdate" class="form-control" type="date" value="<%=userEdit.getDateOfBirth()%>">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Phone<span class="login-danger">*</span> </label>
                                        <input id="phone" name="phone" class="form-control" type="text" value="<%=userEdit.getPhone()%>">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Address </label>
                                        <input id="address" name="address" class="form-control" type="text" value="<%=userEdit.getAddress()%>">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                
                                <input type="hidden" name="editProfile" value="editProfile">
                                <div class="col-12">
                                    <div class="student-submit">
                                        <button name="submit" style="background: #ea7127;border-color:#ea7127" type="submit" class="btn btn-primary" value="editProfile">Submit</button>
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