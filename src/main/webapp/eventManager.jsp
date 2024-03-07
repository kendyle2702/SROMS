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
        <style>
            /* Apply hover effect directly to the anchor tag */
            li a:hover {
                background-color: orange;
            }
        </style>
    </head>
    <body>
        <div class="main-wrapper">
            <%@include file="./general/header.jsp" %>
            <%@include file="./eventManager/sidebar.jsp"%>
            <%@include file="./eventManager/home.jsp" %>
        </div>
    </body>

    <%@include file="./general/js.jsp" %>
</html>