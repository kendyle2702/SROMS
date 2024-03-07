<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DB.DBConnection"%>
<%@ page import="DAOs.NewsDAO" %>
<%@ page import="Models.News" %>
<!DOCTYPE html>
<html>
    <head>
         <%@include file="./general/head_html.jsp" %>
    </head>

    <body>

        <div class="main-wrapper">

            <%@include file="./general/header.jsp" %>


            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li class="menu-title">
                                <span>Main Menu</span>
                            </li>
                            <li >
                                <a href="/student"><i class=""></i> <span> Home</span></a>
                            </li>
                            <li class="active">
                                <a href="/student/news/view"><i class=""></i><span> View News</span></a>
                            </li>
                            <li>
                                <a href="/student/events/view"><i class=""></i><span> View Events</span></a>
                            </li>
                            <li>
                                <a href="/student/clubs/view"><i class=""></i><span> View Clubs</span></a>
                            </li>
                            <li>
                                <a href="/student/profile/view"><i class=""></i><span> Management Profile</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>



            <div class="page-wrapper" style="min-height: 264px;">
                <div class="content container-fluid">

                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title">List News</h3>
                                <ul class="breadcrumb">
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <%
                            // Create an instance of NewsDAO
                            NewsDAO newsDAO = new NewsDAO();

                            // Call the getAllNews method to fetch all news articles
                            List<News> newsList = newsDAO.getAllNews();

                            // Check if there are any news articles
                            if (newsList != null && !newsList.isEmpty()) {
                                // Iterate through the list of news articles
                                for (News news : newsList) {
                        %>
                        <!-- Use the data from the 'news' object to display news information -->
                        <div class="col-md-6 col-xl-4 col-sm-12 d-flex">
                            <div class="blog grid-blog flex-fill">
                                <div class="blog-content">
                                    <h3 class="blog-title"><a href="/student/news/detail"><%= news.getTitle()%></a></h3>
                                    <p><%= news.getContent()%></p>
                                    <p>Create at: <%= news.getCreateAt()%></p>
                                    <p>Create by: <%= news.getAdminProfileID() %></p>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        } else {
                        %>
                        <p>No news articles found.</p>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>

        </div>


        <%@include file="./general/js.jsp" %>
    </body>

</html>