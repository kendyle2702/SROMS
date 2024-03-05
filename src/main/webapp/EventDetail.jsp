<%-- 
    Document   : EventManagerHome
    Created on : Mar 1, 2024, 6:58:33 PM
    Author     : vietn
--%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="Models.Event"%>
<%@page import="DAOs.EventManagerDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from preschool.dreamstechnologies.com/template/edit-fees.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 22 Feb 2024 02:46:21 GMT -->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Event Detail</title>

        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">

        <style type="text/css">@font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:400;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek-ext/400/normal.woff2);
                unicode-range:U+1F00-1FFF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:400;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/400/normal.woff2);
                unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:400;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/400/normal.woff2);
                unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:400;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/400/normal.woff2);
                unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:400;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/400/normal.woff2);
                unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:400;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek/400/normal.woff2);
                unicode-range:U+0370-03FF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:400;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic-ext/400/normal.woff2);
                unicode-range:U+0460-052F,U+1C80-1C88,U+20B4,U+2DE0-2DFF,U+A640-A69F,U+FE2E-FE2F;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:500;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic-ext/500/normal.woff2);
                unicode-range:U+0460-052F,U+1C80-1C88,U+20B4,U+2DE0-2DFF,U+A640-A69F,U+FE2E-FE2F;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:500;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/500/normal.woff2);
                unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:500;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek-ext/500/normal.woff2);
                unicode-range:U+1F00-1FFF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:500;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/500/normal.woff2);
                unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:500;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/500/normal.woff2);
                unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:500;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/500/normal.woff2);
                unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:500;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek/500/normal.woff2);
                unicode-range:U+0370-03FF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:700;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/700/normal.woff2);
                unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:700;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/700/normal.woff2);
                unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:700;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek/700/normal.woff2);
                unicode-range:U+0370-03FF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:700;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek-ext/700/normal.woff2);
                unicode-range:U+1F00-1FFF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:700;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic-ext/700/normal.woff2);
                unicode-range:U+0460-052F,U+1C80-1C88,U+20B4,U+2DE0-2DFF,U+A640-A69F,U+FE2E-FE2F;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:700;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/700/normal.woff2);
                unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:700;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/700/normal.woff2);
                unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:900;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/900/normal.woff2);
                unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:900;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic-ext/900/normal.woff2);
                unicode-range:U+0460-052F,U+1C80-1C88,U+20B4,U+2DE0-2DFF,U+A640-A69F,U+FE2E-FE2F;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:900;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/900/normal.woff2);
                unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:900;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek-ext/900/normal.woff2);
                unicode-range:U+1F00-1FFF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:900;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/900/normal.woff2);
                unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:900;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/900/normal.woff2);
                unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:normal;
                font-weight:900;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek/900/normal.woff2);
                unicode-range:U+0370-03FF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:400;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek-ext/400/italic.woff2);
                unicode-range:U+1F00-1FFF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:400;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/400/italic.woff2);
                unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:400;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic-ext/400/italic.woff2);
                unicode-range:U+0460-052F,U+1C80-1C88,U+20B4,U+2DE0-2DFF,U+A640-A69F,U+FE2E-FE2F;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:400;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek/400/italic.woff2);
                unicode-range:U+0370-03FF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:400;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/400/italic.woff2);
                unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:400;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/400/italic.woff2);
                unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:400;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/400/italic.woff2);
                unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:500;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek-ext/500/italic.woff2);
                unicode-range:U+1F00-1FFF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:500;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/500/italic.woff2);
                unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:500;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/500/italic.woff2);
                unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:500;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic-ext/500/italic.woff2);
                unicode-range:U+0460-052F,U+1C80-1C88,U+20B4,U+2DE0-2DFF,U+A640-A69F,U+FE2E-FE2F;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:500;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/500/italic.woff2);
                unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:500;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/500/italic.woff2);
                unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:500;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek/500/italic.woff2);
                unicode-range:U+0370-03FF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:700;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek-ext/700/italic.woff2);
                unicode-range:U+1F00-1FFF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:700;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/700/italic.woff2);
                unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:700;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/700/italic.woff2);
                unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:700;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/700/italic.woff2);
                unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:700;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek/700/italic.woff2);
                unicode-range:U+0370-03FF;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:700;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/700/italic.woff2);
                unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:700;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic-ext/700/italic.woff2);
                unicode-range:U+0460-052F,U+1C80-1C88,U+20B4,U+2DE0-2DFF,U+A640-A69F,U+FE2E-FE2F;
                font-display:swap;
            }</style>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/feather/feather.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/icons/flags/flags.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <div class="main-wrapper">
            <jsp:include page="./eventManager/header.jsp"></jsp:include>
            <jsp:include page="./eventManager/menu.jsp"></jsp:include>
                <div class="page-wrapper">
                    <div class="content container-fluid">

                        <div class="page-header">
                            <div class="row align-items-center">
                                <div class="col">
                                    <h3 class="page-title">Event Detail</h3>
                                    <ul class="breadcrumb">
                                       
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-body">
                                        <form>
                                            <div class="row">
                                                <div class="col-12">
                                                    <h5 class="form-title"><span>Event Information</span></h5>
                                                </div>
                                            <c:if test="${not empty sessionScope.event}"> 
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Id</label>
                                                        <input type="text" class="form-control" value="${sessionScope.event.getEventID()}" readonly="">
                                                    </div>
                                                </div>

                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Name</label>
                                                        <input type="text" class="form-control" value="${sessionScope.event.getEventName()}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Preparation Time</label>
                                                        <input class="form-control" type="datetime-local" value="${sessionScope.event.getPreparationTime()}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Hold Time</label>
                                                        <input class="form-control" type="datetime-local" value="${sessionScope.event.getHoldTime()}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Location</label>
                                                        <input type="text" class="form-control" value="${sessionScope.event.getLocation()}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Cost</label>
                                                        <input type="number" class="form-control" value="${sessionScope.event.getCost()}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Expected Number</label>
                                                        <input type="number" class="form-control" value="${sessionScope.event.getExpectedNumber()}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Organization</label>
                                                        <input type="text" class="form-control" value="${sessionScope.event.getOrganization()}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Feedback</label>
                                                        <input type="text" class="form-control" value="${sessionScope.event.getFeedback()}" readonly="" >
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Description</label>
                                                        <input type="text" class="form-control" value="${sessionScope.event.getDescription()}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Status</label>
                                                        <c:choose>
                                                            <c:when test="${sessionScope.event.getApprove() eq 'none'}">
                                                                <input class="form-control" value="Waiting" readonly="" >
                                                            </c:when>
                                                            <c:when test="${sessionScope.event.getApprove() eq ' '}">
                                                                <input class="form-control" value="Accepted" readonly="" >
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" value="Rejected" readonly="" >
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Create By</label>
                                                        <input type="text" class="form-control" value="${sessionScope.event.getCreatedBy()}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>End Time</label>
                                                        <input class="form-control" type="datetime-local" value="${sessionScope.event.getEndTime()}">
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <div class="student-submit">
                                                        <button type="submit" class="btn btn-primary">Submit</button>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${empty sessionScope.event}">
                                                <tr>
                                                    <td colspan="7" class="text-center">No events found.</td>
                                                </tr>
                                            </c:if>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js" type="dae545961dfd6d84c293a8f6-text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js" type="dae545961dfd6d84c293a8f6-text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/feather.min.js" type="dae545961dfd6d84c293a8f6-text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/plugins/slimscroll/jquery.slimscroll.min.js" type="dae545961dfd6d84c293a8f6-text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js" type="dae545961dfd6d84c293a8f6-text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/script.js" type="dae545961dfd6d84c293a8f6-text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js" data-cf-settings="dae545961dfd6d84c293a8f6-|49" defer></script></body>

    <!-- Mirrored from preschool.dreamstechnologies.com/template/edit-fees.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 22 Feb 2024 02:46:21 GMT -->
</html>