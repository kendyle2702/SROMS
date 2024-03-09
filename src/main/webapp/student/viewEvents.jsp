<%@page import="DAOs.UserLoginDAO"%>
<%@page import="Models.UserProfile"%>
<%@page import="Models.Event"%>
<%@page import="java.util.List"%>
<div class="page-wrapper" style="min-height: 691px;">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">Welcome Student!</h3>
                        <ul class="breadcrumb">

                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <%
                        UserProfile profile = (UserProfile)session.getAttribute("user");
         %>

        <div class="row">
            <div class="col-xl-12 d-flex">
                <div class="card flex-fill student-space comman-shadow">
                    <div class="card-body">
                        <form action="/student" method="post">
                            <div class="table-responsive">
                                <table id="viewEvents" class="table table-hover table-striped table-bordered">
                                    <thead class="thead-light">
                                        <tr>
                                            <th class="text-center">No</th>
                                            <th class="text-center">Name</th>
                                            <th class="text-center">Location</th>
                                            <th class="text-center">Date</th>
                                            <th class="text-center">Category</th>
                                            <th class="text-center">Register</th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${sessionScope.listEvent}" var="event" varStatus="count">
                                        <tr>
                                            <td>${count.index + 1}</td>
                                            <td>${event.eventName}</td>
                                            <td>${event.location}</td>
                                            <td>${event.holdTime}</td>
                                            <td>${sessionScope.eventCategoryNames[event.eventID]}</td>
                                            <td class="text-center">
                                                <div class="student-submit">
                                                    <input type="text" name="EventID" value="${event.eventID}">
                                                    <%
                                                        UserLoginDAO userLoginDAO = new UserLoginDAO();
                                                        int studentProfileID = userLoginDAO.getStudentProfileIDByUserProfileID(userProfile.getUserProfileID());
                                                    %>  
                                                    <input type="text" name="studentProfileID" value="<%=studentProfileID%>">
                                                    <input type="submit" name="action" class="btn btn-primary" value="Register">
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty sessionScope.listEvent}">
                                        <tr>
                                            <td colspan="7" class="text-center">No events found.</td>
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>                                          
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>