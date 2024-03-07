<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="./general/head_html.jsp" %>
    </head>
    <body>
        <!--        <div class="main-wrapper">-->
        <%@include file="./general/header.jsp" %>
        <div class="sidebar" id="sidebar">
            <div class="sidebar-inner slimscroll">
                <div id="sidebar-menu" class="sidebar-menu">
                    <ul>
                        <li class="menu-title">
                            <span>Main Menu</span>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-graduation-cap"></i> <span>Manage Club</span> <span class="menu-arrow"></span></a>
                            <ul>
                                <li><a href="students.html">Update Club</a></li>
                                <li><a href="student-details.html">Delete Club</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-chalkboard-teacher"></i> <span>Manage Participants</span> <span class="menu-arrow"></span></a>
                            <ul>
                                <li><a href="teachers.html">Check Atttentdent</a></li>
                                <li><a href="teacher-details.html">Evalute Participant</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="page-wrapper">
            <div class="content container-fluid">

                <div class="row">

                    <div class="row">
                        <div class="col-xl-12 d-flex">
                            <div class="card flex-fill student-space comman-shadow">
                                <div class="card-header d-flex align-items-center">
                                    <h5 class="card-title">Club List</h5>
                                    <ul class="chart-list-out student-ellips">
                                        <li class="star-menus"><a href="javascript:;"><i class="fas fa-ellipsis-v"></i></a></li>
                                    </ul>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table star-student table-hover table-center table-borderless table-striped">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th class="text-center">No.</th>
                                                    <th class="text-center">Name</th>
                                                    <th class="text-center">Establish Date</th>
                                                    <th class="text-center">Active</th>
                                                    <th class="text-center">Detail</th>
                                                    <!--                                                    <th></th>-->
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:if test="${not empty sessionScope.Club}">
                                                    <c:forEach items="${sessionScope.Club}" var="c" varStatus="varC">
                                                        <tr>
                                                            <td class="text-center">${varC.index +1}</td>
                                                            <td class="text-center">${c.getClubName()}</td>
                                                            <td class="text-center">${c.getEstablishDate()}</td>
                                                            <c:choose>
                                                                <c:when test="${c.getIsActive() == true}">
                                                                    <td class="text-center">Accepted</td>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td class="text-center">Reject</td>
                                                                </c:otherwise>
                                                            </c:choose>

                                                            <td class="text-center row">                                                                

                                                                <a href="#" class="btn btn-primary m-auto col-5">View Detail</a>

                                                                <button type="button" class="btn btn-danger m-auto col-5" name="action=delete?id=">Delete</button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${empty sessionScope.Club}">
                                                    <tr>
                                                        <td>Not found club</td>
                                                    </tr>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--        </div>-->

        <%@include file="./general/js.jsp" %>
</html>