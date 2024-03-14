<%@page import="Models.UserLogin"%>
<%@page import="DAOs.UserLoginDAO"%>
<%@page import="java.sql.ResultSet"%>
<div class="page-wrapper">
    <div class="content container-fluid">
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">Detail Event Manager</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Event Manager</a></li>
                            <li class="breadcrumb-item"><a href="/admin/account/eventmanager">View Accounts</a></li>
                            <li class="breadcrumb-item active">Detail</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <%
            ResultSet rsEvent = (ResultSet) session.getAttribute("rsEventManager");
            UserLoginDAO userloginDAO = new UserLoginDAO();
            UserLogin userLogin = null;
;            
            while (rsEvent.next()) {%>
        <div class="row">
            <div class="col-sm-12"><%userLogin = userloginDAO.getUserLoginByUserProfileID(rsEvent.getInt("UserProfileID")); %>
                <div class="card comman-shadow">
                    <div class="card-body">
                        <form id="formEditEventManager" action="${pageContext.request.contextPath}/upload/profile/update" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-12">
                                    <h5 class="form-title student-info">Event Information<span><a href="javascript:;"><i class="feather-more-vertical"></i></a></span></h5>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group students-up-files">
                                        <label>Upload Avatar</label>
                                        <div style="margin-bottom: 20px" class="profile-image">
                                            <img id="avatarImg" width="100" alt="User Image" src="${pageContext.request.contextPath}/assets/img/avatar/<%=rsEvent.getString("Avatar")%>">
                                        </div>
                                        <div class="upload">
                                            <input id="uploadAvatar" name="avatar" type="file" class="form-control form-control-sm">
                                            <div class="message"></div>
                                        </div>
                                    </div>
                                </div>
                                <div style="margin-bottom: 10px; text-align: left" class="col-12 col-sm-8">
                                    <a id="banAccount" href="${pageContext.request.contextPath}/admin/account/eventmanager/block/<%=rsEvent.getString("UserProfileID")%>" style='display: none'><button class="mb-2 mr-2 btn-icon btn btn-danger"><i class="pe-7s-trash btn-icon-wrapper"></i>Lock Account</button></a> 
                                    <a id="unbanAccount" href="${pageContext.request.contextPath}/admin/account/eventmanager/unblock/<%=rsEvent.getString("UserProfileID")%>" style='display: none'><button class="mb-2 mr-2 btn-icon btn btn-primary"><i class="pe-7s-tools btn-icon-wrapper"> </i>Unlock Account</button></a> 
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>First Name<span class="login-danger">*</span></label>
                                        <input id="firstname" name="firstname" class="form-control" type="text" value="<%=rsEvent.getString("FirstName")%>">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Last Name <span class="login-danger">*</span></label>
                                        <input id="lastname" name="lastname" class="form-control" type="text" value="<%=rsEvent.getString("LastName")%>">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Gender <span class="login-danger">*</span></label>
                                        <select name="gender" class=" form-select form-control select">
                                            <option <%= rsEvent.getString("Gender").equals("Female") ? "selected" : ""%> value="Female">Female</option>
                                            <option <%= rsEvent.getString("Gender").equals("Male") ? "selected" : ""%> value="Male">Male</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Date Of Birth <span class="login-danger">*</span></label>
                                        <input id="birthdate" name="birthdate" class="form-control" type="date" value="<%=rsEvent.getDate("DateOfBirth")%>">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Enroll Date<span class="login-danger">*</span></label>
                                        <input id="enrollmentdate" name="enrollmentdate" class="form-control" type="date" value="<%=rsEvent.getDate("EnrollmentDate")%>">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Email <span class="login-danger">*</span></label>
                                        <input id="email" name="email" class="form-control" type="text" value="<%=rsEvent.getString("Email")%>">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Phone <span class="login-danger">*</span></label>
                                        <input id="phone" name="phone" class="form-control" type="text" value="<%=rsEvent.getString("Phone")%>">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Staff Number <span class="login-danger">*</span></label>
                                        <input id="staffnumber" name="staffnumber" class="form-control" type="text" value="<%=rsEvent.getString("StaffNumber")%>">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Academic Level <span class="login-danger">*</span></label>
                                        <input id="academiclevel" name="academiclevel" class="form-control" type="text" value="<%=rsEvent.getString("AcademicLevel")%>">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Degree <span class="login-danger">*</span></label>
                                        <input id="degree" name="degree" class="form-control" type="text" value="<%=rsEvent.getString("Degree")%>">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Experience <span class="login-danger">*</span></label>
                                        <input id="experience" name="experience" class="form-control" type="text" value="<%=rsEvent.getString("Experience")%>">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Address</label>
                                        <textarea id="address" name="address" class="form-control" id="exampleFormControlTextarea1" rows="3"><%=rsEvent.getString("Address")%></textarea>
                                        <div class="message"></div>
                                    </div>
                                </div>
                                
                                <input type="hidden" name="editEventManager" value="editEventManager">
                                <input type="hidden" name="rsEventManagerID" value="<%=session.getAttribute("rsEventManagerID")%>">
                                <input type="hidden" name="avatar_old" value="<%=rsEvent.getString("Avatar")%>">
                                <div class="col-12">
                                    <div class="student-submit">
                                        <button style="background: #ea7127;border-color:#ea7127" type="submit" class="btn btn-primary">Update</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <% }
        %>
        
    </div>
</div>
        <script>
            <%
        if (userLogin.getIsActive()) {%>
            document.querySelector("#banAccount").style.display = 'block';
            <%} else {%>
            document.querySelector("#unbanAccount").style.display = 'block';
            <%}
        %>
        </script>
