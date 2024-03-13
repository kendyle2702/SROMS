<%@page import="Models.UserProfile"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="DAOs.NewsDAO" %>
<%@ page import="Models.News" %>
<%@ page import="DAOs.ClubDAO" %>
<%@ page import="Models.Club" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="./general/head_html.jsp" %>
    </head>
    <body>
        <div class="main-wrapper">
            <%@include file="./general/header.jsp" %>
            <%@include file="./student/sidebar.jsp" %>
            <c:choose>
                <c:when test="${sessionScope.tabId == 1}">
                    <%@include file="./student/home.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 2}">
                    <%@include file="./student/viewNews.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 3}">
                    <%@include file="./student/viewEvents.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 4}">
                    <%@include file="./student/viewClubs.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 5}">
                    <%@include file="./general/profile.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 6}">
                    <%@include file="./general/editProfile.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 7}">
                    <%@include file="./student/eventDetail.jsp" %>
                </c:when>
                 <c:when test="${sessionScope.tabId == 8}">
                     <%@include file="./student/viewClubMembers.jsp" %>
                </c:when>
            </c:choose>
        </div>
     <%@include file="./general/js.jsp" %>
    </body>
</html>
