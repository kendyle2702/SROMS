<%@page import="Models.Event"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.EventDAO"%>
<%@page import="DAOs.EventDAO"%>
<div class="page-wrapper">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="page-title text-center">Event Detail</h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-12 col-lg-12 ">
                <form action="/student" method="post">
                    <div class="card flex-fill bg-white">
                        <div class="card-header text-center">
                            <h5 class="card-title mb-0">${event.getEventName()}</h5>
                        </div>
                        <div>
                            <div class="blog-info">
                                <div class="post-list">
                                    <ul>
                                        <%
                                            ResultSet rsManager = (ResultSet) session.getAttribute("rsManager");
                                            ResultSet rsStudent = (ResultSet) session.getAttribute("rsStudent");
                                            if (rsStudent != null) {
                                                while (rsStudent.next()) {
                                        %>
                                        <li><i class="feather-user"></i>Author: <%=rsStudent.getString("FirstName")%></li>          
                                            <%
                                                }
                                            } else if (rsManager != null) {
                                                while (rsManager.next()) {
                                            %>
                                        <li><i class="feather-user"></i>Author: <%=rsManager.getString("FirstName")%></li>          
                                            <%
                                                    }
                                                }
                                            %>
                                        <li><i class="feather-user"></i>Author: ${event.getCreatedBy()}</li>
                                        <li><i class="feather-clock"></i>Start Time: ${event.getPreparationTime()}</li>
                                        <li><i class="feather-clock"></i>End Time: ${event.getEndTime()}</li>
                                        <li><i class="feather-star"></i>Location: ${event.getLocation()}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <p class="card-text">${event.getDescription()}</p>
                            <div class="student-submit text-center">
                                <input type="hidden" name="EventID" value="${event.getEventID()}">
                                <input type="hidden" name="studentProfileID" value="${studentProfileID}">
                                <input type="submit" name="action" class="btn btn-primary" value="Join">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>