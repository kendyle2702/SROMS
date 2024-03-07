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
            </c:choose>
        </div>
    </body>

    <%@include file="./general/js.jsp" %>
</html>