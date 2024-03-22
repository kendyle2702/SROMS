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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css"/>
        <%@include file="./general/head_html.jsp" %>
    </head>
    <body>
        <div class="main-wrapper">
            <%@include file="./general/header.jsp" %>
            <%@include file="./eventManager/sidebar.jsp"%>
            <c:choose>
                <c:when test="${sessionScope.tabId == 1}">
                    <%@include file="./eventManager/home.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 2}">
                    <%@include file="./eventManager/createEvent.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 3}">
                    <%@include file="./eventManager/viewEvents.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 4}">
                    <%@include file="./eventManager/eventDetail.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 5}">
                    <%@include file="./general/profile.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 6}">
                    <%@include file="./general/editProfile.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 7}">
                    <%@include file="./eventManager/eventTaking.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 8}">
                    <%@include file="./eventManager/participationEvent.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 9}">
                    <%@include file="./eventManager/eventTakingEvaluate.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 10}">
                    <%@include file="./eventManager/evaluateEvent.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 11}">
                    <%@include file="./eventManager/viewRequestCreateEvent.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 12}">
                    <%@include file="./eventManager/viewEventWaitingAminAccept.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 13}">
                    <%@include file="./eventManager/viewNews.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 14}">
                    <%@include file="./eventManager/newsDetail.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 15}">
                    <%@include file="./eventManager/evaluateCompotition.jsp" %>
                </c:when>
                <c:when test="${sessionScope.tabId == 16}">
                    <%@include file="./eventManager/checkCompositionStudent.jsp" %>
                </c:when>
            </c:choose>
        </div>
        <%@include file="./general/js.jsp" %>
    </body>
</html>