

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="DAOs.ClubsDAO" %>
<%@ page import="Models.Club" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html>
    <head>
        <%@include file="./general/head_html.jsp" %>
    </head>
    <div class="main-wrapper">

       <%@include file="./general/header.jsp" %>


        <div class="sidebar" id="sidebar">
            <div class="sidebar-inner slimscroll">
                <div id="sidebar-menu" class="sidebar-menu">
                    <ul>
                        <li class="menu-title">
                            <span>Main Menu</span>
                        </li>
                        <li>
                            <a href="/student"><i class=""></i> <span> Home</span></a>
                        </li>
                        <li>
                            <a href="/student/news/view"><i class=""></i><span> View News</span></a>
                        </li>
                        <li>
                            <a href="/student/events/view"><i class=""></i><span> View Events</span></a>
                        </li>
                        <li class="active">
                            <a href="/student/clubs/view"><i class=""></i><span> View Clubs</span></a>
                        </li>
                        <li>
                            <a href="/student/profile/view"><i class=""></i><span> Management Profile</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

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

                <div class="row">
                    <div class="card flex-fill comman-shadow">
                        <div class="card-header">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <h5 class="card-title"> Club</h5>
                                </div>
                                <div class="col-6">
                                    <span class="float-end view-link"><a href="/student/clubs/view"> View All</a></span>
                                </div>
                            </div>
                        </div>
                        <%                            // Instantiate the ClubsDAO
                            ClubsDAO clubsDAO = new ClubsDAO();

                            // Call the getAllClubs method to retrieve all clubs
                            List<Club> clubsList = clubsDAO.getAllClubs();
                        %>
                        <div class="card-body">
                            <ul class="nav nav-pills navtab-bg nav-justified" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <a href="#listClub" data-bs-toggle="tab" aria-expanded="false"
                                       class="nav-link active" aria-selected="false" role="tab" tabindex="-1">
                                        List Club
                                    </a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a href="#myClub" data-bs-toggle="tab" aria-expanded="true" class="nav-link"
                                       aria-selected="true" role="tab">
                                        My Club
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active show" id="listClub" role="tabpanel">
                                    <div class="pt-3 pb-3">
                                        <div class="table-responsive lesson">
                                            <%
                                                // Check if there are any clubs in the list
                                                if (clubsList != null && !clubsList.isEmpty()) {
                                            %>
                                            <table class="table table-center">
                                                <tbody>
                                                    <%
                                                        // Iterate through the list of clubs
                                                        for (Club club : clubsList) {
                                                    %>
                                                    <tr>
                                                        <td>
                                                            <div class="date">
                                                                <b><%= club.getClubName()%></b>
                                                                <p><%= club.getDescription()%></p>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="lesson-confirm">
                                                                <a href="student/clubs/detail?clubID=<%= club.getClubID()%>">Club Details</a>
                                                            </div>
                                                            <form action="registerClub" method="post">
                                                                <input type="hidden" name="clubID" value="<%= club.getClubID()%>">
                                                                <button type="submit" class="btn btn-info">Register</button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                            <%
                                            } else {
                                            %>
                                            <p>No clubs found.</p>
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="myClub" role="tabpanel">
                                    <div class="pt-3 pb-3">
                                        <div class="table-responsive lesson">
                                            <table class="table table-center">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="date">
                                                                <b> FCoderrrr</b>
                                                                <p> You is menber </p>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="lesson-confirm">
                                                                <a href="student/clubs/detail"> Club Details</a>
                                                            </div>
                                                        </td>
                                                    </tr>
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


        </div>

        <footer>
            <p></p>
        </footer>

    </div>



    <%@include file="./general/js.jsp" %>
</body>
</html>
