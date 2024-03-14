<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="Models.Event"%>
<%@page import="DAOs.EventDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="./general/head_html.jsp" %>
    </head>
    <body>
        <div class="main-wrapper">

            <%@include file="./general/header.jsp" %>
            <%@include file="./admin/sidebar.jsp"%>
            <c:choose>
                <c:when test="${sessionScope.tabId == 1}">
                   <%@include file="./general/profile.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 2}">
                   <%@include file="./general/editProfile.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 3}">
                   <%@include file="./admin/home.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 4}">
                   <%@include file="./admin/viewEventManagers.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 5}">
                   <%@include file="./admin/createEventManager.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 6}">
                   <%@include file="./admin/viewClubManagers.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 7}">
                   <%@include file="./admin/createClubManager.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 8}">
                   <%@include file="./admin/viewStudents.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 9}">
                   <%@include file="./admin/createStudent.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 10}">
                   <%@include file="./admin/detailStudent.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 11}">
                   <%@include file="./admin/detailEventManager.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 12}">
                   <%@include file="./admin/detailClubManager.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 13}">
                   <%@include file="./admin/viewNews.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 14}">
                   <%@include file="./admin/createNews.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 15}">
                   <%@include file="./admin/detailNews.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 16}">
                   <%@include file="./admin/viewEvents.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 17}">
                    <%@include file="./admin/detailEvent.jsp" %>
                </c:when>
            </c:choose>
        </div>
    <%@include file="./general/js.jsp" %>
    </body>
</html>