<%@page import="Models.AdminProfile"%>
<%@page import="Models.ManagerProfile"%>
<%@page import="Models.StudentProfile"%>
<%@page import="DAOs.AdminProfileDAO"%>
<%@page import="DAOs.ManagerProfileDAO"%>
<%@page import="DAOs.StudentProfileDAO"%>
<%@page import="Models.UserProfile"%>
<%
    UserProfile userPro = (UserProfile) session.getAttribute("user");
    String rolePro = (String) session.getAttribute("role");
    String urlEdit = "";
    
    switch (rolePro) {
            case "Student":
                urlEdit = "/student/profile/edit";
                break;
            case "Club Manager":
                urlEdit = "/clubmanager/profile/edit";
                break;
            case "Event Manager":
                urlEdit = "/eventmanager/profile/edit";
                break;
            case "Admin":
                urlEdit = "/admin/profile/edit";
                break;
        }
%>
<div class="page-wrapper" style="min-height: 229px;">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row">
                <div class="col">
                    <h3 class="page-title">Profile</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active">Profile</li>
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
                                <img class="" alt="User Image" src="${pageContext.request.contextPath}/assets/img/avatar/<%=userPro.getAvatar()%>">
                            </a>
                        </div>
                        <div class="col ms-md-n2 profile-user-info">
                            <h4 class="user-name mb-0"><%=userPro.getLastName() + " " + userPro.getFirstName()%></h4>
                            <%
                                if (rolePro.equals("Student")) {
                                    StudentProfileDAO stDAO = new StudentProfileDAO();
                                    StudentProfile stPro = stDAO.getStudentProfileByEmail(userPro.getEmail());
                            %>
                            <h6 class="text-muted"><%=stPro.getMajor()%></h6>
                            <%
                            } else {
                            %>
                            <h6 class="text-muted"><%=rolePro%></h6>
                            <%
                                }
                            %>
                            <div class="user-Location"><i style="margin-right: 10px" class="fas fa-map-marker-alt"></i><%=userPro.getAddress()%></div>
                            <div class="about-text"><i style="margin-right: 10px" class="fa fa-envelope"></i><%=userPro.getEmail()%></div>
                        </div>
                        <div class="col-auto profile-btn">
                            <a style="background:#ea7127;" href="<%=urlEdit %>" class="btn btn-primary">
                                Edit
                            </a>
                        </div>
                    </div>
                </div>

                <div class="tab-content profile-tab-cont">

                    <div class="tab-pane fade active show" id="per_details_tab" role="tabpanel">

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title d-flex justify-content-between">
                                            <span>General Information</span>
                                            <a class="edit-link" data-bs-toggle="modal" href="<%=urlEdit %>"><i class="far fa-edit me-1"></i>Edit</a>
                                        </h5>
                                        <div class="row">
                                            <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Full Name</p>
                                            <p class="col-sm-9"><%=userPro.getLastName() + " " + userPro.getFirstName()%></p>
                                        </div>
                                        <div class="row">
                                            <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Gender</p>
                                            <p class="col-sm-9"><%=userPro.getGender() %></p>
                                        </div>
                                        <div class="row">
                                            <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Date of Birth</p>
                                            <p class="col-sm-9"><%=userPro.getDateOfBirth() %></p>
                                        </div>
                                        <div class="row">
                                            <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Email</p>
                                            <p class="col-sm-9"><%=userPro.getEmail()%></p>
                                        </div>
                                        <div class="row">
                                            <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Mobile</p>
                                            <p class="col-sm-9"><%=userPro.getPhone() %></p>
                                        </div>
                                        <div class="row">
                                            <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Enroll Date</p>
                                            <p class="col-sm-9"><%=userPro.getEnrollmentDate() %></p>
                                        </div>
                                        <div class="row">
                                            <p class="col-sm-3 text-muted text-sm-end mb-0">Address</p>
                                            <p class="col-sm-9"><%=userPro.getAddress()%></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title d-flex justify-content-between">
                                            <span>Academic Information</span>
                                        </h5>
                                        <%
                                            if(rolePro.equals("Student")){
                                                StudentProfileDAO stDAO = new StudentProfileDAO();
                                                StudentProfile stPro = stDAO.getStudentProfileByEmail(userPro.getEmail());
                                            %>
                                            <div class="row">
                                                <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Roll Number</p>
                                                <p class="col-sm-9"><%=stPro.getRollNumber()%></p>
                                            </div>
                                            <div class="row">
                                                <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Member Code</p>
                                                <p class="col-sm-9"><%=stPro.getMemberCode()%></p>
                                            </div>
                                            <div class="row">
                                                <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Major</p>
                                                <p class="col-sm-9"><%=stPro.getMajor()%></p>
                                            </div>
                                            <div class="row">
                                                <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Mode</p>
                                                <p class="col-sm-9"><%=stPro.getMode()%></p>
                                            </div>
                                            <%
                                            }
                                            else if(rolePro.equals("Admin")){
                                                AdminProfileDAO adDAO = new AdminProfileDAO();
                                                AdminProfile adPro = adDAO.getAdminProfileByEmail(userPro.getEmail());
                                                %>
                                            <div class="row">
                                                <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Staff Number</p>
                                                <p class="col-sm-9"><%=adPro.getStaffNumber() %></p>
                                            </div>
                                            <div class="row">
                                                <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Academic Level</p>
                                                <p class="col-sm-9"><%=adPro.getAcademicLevel()%></p>
                                            </div>
                                            <div class="row">
                                                <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Degree</p>
                                                <p class="col-sm-9"><%=adPro.getDegree()%></p>
                                            </div>
                                            <div class="row">
                                                <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Experience</p>
                                                <p class="col-sm-9"><%=adPro.getExperience()%></p>
                                            </div>
                                                <%
                                            }
                                            else{
                                                ManagerProfileDAO mnDAO = new ManagerProfileDAO();
                                                ManagerProfile mnPro = mnDAO.getManagerProfileByEmail(userPro.getEmail());
                                            %>   
                                            <div class="row">
                                                <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Staff Number</p>
                                                <p class="col-sm-9"><%=mnPro.getStaffNumber() %></p>
                                            </div>
                                            <div class="row">
                                                <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Academic Level</p>
                                                <p class="col-sm-9"><%=mnPro.getAcademicLevel()%></p>
                                            </div>
                                            <div class="row">
                                                <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Degree</p>
                                                <p class="col-sm-9"><%=mnPro.getDegree()%></p>
                                            </div>
                                            <div class="row">
                                                <p class="col-sm-3 text-muted text-sm-end mb-0 mb-sm-3">Experience</p>
                                                <p class="col-sm-9"><%=mnPro.getExperience()%></p>
                                            </div>
                                            <%
                                            }
                                        %>
                                        
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