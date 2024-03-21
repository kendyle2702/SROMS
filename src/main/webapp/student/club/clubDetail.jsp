<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="row justify-content-center">
            <div class="col-xl-10">
                <form action="/student" method="post">
                    <div class="card invoice-info-card">
                        <div class="card-body">
                            <div class="col-md-12">
                                <div class="profile-header">
                                    <div class="row align-items-center">
                                        <div class="col-auto profile-image">
                                            <a href="#">
                                                <img class="rounded-circle" alt="User Image"
                                                     src="${pageContext.request.contextPath}/assets/img/logo_club/${sessionScope.club.getLogo()}">
                                            </a>
                                        </div>
                                        <div class="col ms-md-n2 profile-user-info">
                                            <h4 class="user-name mb-0">${sessionScope.club.getClubName()}</h4>

                                            <h6 style="color: green;" class="text-muted">Establish Date:
                                                ${sessionScope.club.getEstablishDate()}</h6>
                                            <div class="user-Location">${sessionScope.club.getDescription()}</div>
                                            <c:choose>
                                                <c:when test="${checkIsMember == true}">
                                                    <div class="student-submit text-end">
                                                        <input type="hidden" name="ClubID" value="${club.getClubID()}">
                                                        <input type="hidden" name="studentProfileID" value="${studentProfileID}">
                                                        <input style="background: #ea7127;border-color:#ea7127" type="submit" name="action" class="btn btn-primary" value="Register">
                                                    </div>
                                                </c:when>
                                                <c:when test="${checkIsMember == false}">
                                                    <div class="text-end">
                                                        <a style="background: #ea7127;border-color:#ea7127" href="/student/clubs/viewClubMember/${club.clubID}" class="btn btn-primary">View Member</a>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>