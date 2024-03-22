<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Models.UserLogin"%>
<%@page import="DAOs.UserLoginDAO"%>
<%@page import="java.sql.ResultSet"%>
<div class="page-wrapper">
    <div class="content container-fluid">
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">Detail Student</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item"><a href="/student/clubs/view">View Club</a></li>
                            <li class="breadcrumb-item"><a href="/student/clubs/viewClubMember/${sessionScope.clubId}">View Member Club</a></li>
                            <li class="breadcrumb-item active">Detail Student</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <%
            ResultSet rsStudent = (ResultSet) session.getAttribute("rsStudent");
            while (rsStudent.next()) {%>
        <div class="row">
            <div class="col-sm-12">
                <div class="card comman-shadow">
                    <div class="card-body">
                        <form action="/student" method="post">
                            <div class="row">
                                <div class="col-12">
                                    <h5 class="form-title student-info">Student Information<span><a href="javascript:;"><i class="feather-more-vertical"></i></a></span></h5>
                                </div>
                                <div  style="margin-bottom: 20px;" class="col-12 col-sm-12">
                                    <div class="form-group students-up-files">
                                        <label>Upload Avatar</label>
                                        <div style="margin-bottom: 20px" class="profile-image">
                                            <img id="avatarImg" width="100" alt="User Image" src="${pageContext.request.contextPath}/assets/img/avatar/<%=rsStudent.getString("Avatar")%>">
                                        </div>

                                    </div>
                                </div>
                                <div style="margin-bottom: 20px" class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>First Name<span class="login-danger">*</span></label>
                                        <input id="firstname" name="firstname" class="form-control" type="text" value="<%=rsStudent.getString("FirstName")%>" readonly="">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Last Name <span class="login-danger">*</span></label>
                                        <input id="lastname" name="lastname" class="form-control" type="text" value="<%=rsStudent.getString("LastName")%>" readonly="">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Gender <span class="login-danger">*</span></label>
                                        <select name="gender" class="form-select form-control" disabled>
                                            <option <%= rsStudent.getString("Gender").equals("Female") ? "selected" : ""%> value="Female">Female</option>
                                            <option <%= rsStudent.getString("Gender").equals("Male") ? "selected" : ""%> value="Male">Male</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Date Of Birth <span class="login-danger">*</span></label>
                                        <input id="birthdate" name="birthdate" class="form-control" type="date" value="<%=rsStudent.getDate("DateOfBirth")%>"  readonly="">
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Enroll Date<span class="login-danger">*</span></label>
                                        <input id="enrolldate" name="enrolldate" class="form-control" type="date" value="<%=rsStudent.getDate("EnrollmentDate")%>" readonly>
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Email <span class="login-danger">*</span></label>
                                        <input id="email" name="email" class="form-control" type="text" value="<%=rsStudent.getString("Email")%>" readonly>
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Phone <span class="login-danger">*</span></label>
                                        <input id="phone" name="phone" class="form-control" type="text" value="<%=rsStudent.getString("Phone")%>" readonly>
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Roll Number <span class="login-danger">*</span></label>
                                        <input id="rollnumber" name="rollnumber" class="form-control" type="text" value="<%=rsStudent.getString("RollNumber")%>" readonly>
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Member Code <span class="login-danger">*</span></label>
                                        <input id="membercode" name="membercode" class="form-control" type="text" value="<%=rsStudent.getString("MemberCode")%>" readonly>
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Major <span class="login-danger">*</span></label>
                                        <input id="major" name="major" class="form-control" type="text" value="<%=rsStudent.getString("Major")%>" readonly>
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Mode <span class="login-danger">*</span></label>
                                        <input id="mode" name="mode" class="form-control" type="text" value="<%=rsStudent.getString("Mode")%>" readonly>
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group local-forms">
                                        <label>Address</label>
                                        <input id="address" name="address" class="form-control" id="exampleFormControlTextarea1" value="<%=rsStudent.getString("Address")%>" readonly>
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4"></div>
                               
                                <c:choose>
                                    <c:when test="${sessionScope.getClubRole eq 'Leader Club'}">
                                         <div class="col-12 col-sm-4"> <!-- Add text-center class here -->
                                    <div class="form-group local-forms">
                                        Update Role:
                                        <select class="form-select" name="clubrole" id="clubrole">
                                            <option <%= session.getAttribute("clubRoleOfMember").equals("Leader Club") ? "selected" : ""%> value="Leader Club">Leader Club</option>
                                            <option <%= session.getAttribute("clubRoleOfMember").equals("Board Of Directing") ? "selected" : ""%> value="Board Of Directing">Board Of Directing</option>
                                            <option <%= session.getAttribute("clubRoleOfMember").equals("Member") ? "selected" : ""%> value="Member">Member</option>
                                        </select>
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4"></div>
                                <div class="col-12 col-sm-4"></div>
                                        <div class="col-12 col-sm-2">
                                            <input type="hidden" value="<%=rsStudent.getInt("StudentProfileID")%>" name="studentId"><!-- comment -->
                                            <input type="hidden" value="${sessionScope.clubId}" name="clubId">
                                            <input type="submit" name="updateRoleMember" style="min-width: 160px;border-radius: 10px;" class="btn btn-success" value="Update">
                                        </div>
                                        <div style="margin-left: 70px;" class="col-12 col-sm-2"> 
                                            <a  id="deleteMemberClub" href="/student/clubmember/deletemember/<%=rsStudent.getInt("StudentProfileID")%>/${sessionScope.clubId}" style="min-width: 160px;border-radius: 10px;" class="btn btn-danger" >Delete</a>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="col-12 col-sm-4"> <!-- Add text-center class here -->
                                    <div class="form-group local-forms">
                                        Update Role:
                                        <select class="form-select" name="clubrole" id="clubrole" disabled>
                                            <option <%= session.getAttribute("clubRoleOfMember").equals("Leader Club") ? "selected" : ""%> value="Leader Club">Leader Club</option>
                                            <option <%= session.getAttribute("clubRoleOfMember").equals("Board Of Directing") ? "selected" : ""%> value="Board Of Directing">Board Of Directing</option>
                                            <option <%= session.getAttribute("clubRoleOfMember").equals("Member") ? "selected" : ""%> value="Member">Member</option>
                                        </select>
                                        <div class="message"></div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4"></div>
                                <div class="col-12 col-sm-4"></div>
                                    </c:otherwise>
                                </c:choose>

                                <div class="col-12 col-sm-4"></div>
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
