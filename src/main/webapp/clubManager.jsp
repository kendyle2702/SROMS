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
            <%@include file="./clubManager/sidebar.jsp" %>
            <c:choose>
                <c:when test="${sessionScope.tabId == 1}">
                    <%@include file="./clubManager/home.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 2}">
                    <%@include file="./general/profile.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 3}">
                    <%@include file="./general/editProfile.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 4}">
                    <%@include file="./clubManager/viewClubs.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 5}">
                    <%@include file="./clubManager/clubDetail.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 6}">
                    <%@include file="./clubManager/checkRequestClub.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 7}">
                    <%@include file="./clubManager/viewClubPoint.jsp" %>
                </c:when>
                 <c:when test="${sessionScope.tabId == 8}">
                    <%@include file="./clubManager/viewDetailPointClub.jsp" %>
                </c:when>
            </c:choose>

        </div>
        <%@include file="./general/js.jsp" %>
    </body>   
</html>