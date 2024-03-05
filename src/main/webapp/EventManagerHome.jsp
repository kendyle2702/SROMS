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

    <!-- Mirrored from preschool.dreamstechnologies.com/template/teacher-dashboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 22 Feb 2024 02:41:45 GMT -->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Event Manager Home</title>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
        <style type="text/css">@font-face {
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
                font-weight:400;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/400/normal.woff2);
                unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/400/normal.woff2);
                unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
                font-display:swap;
            }
            @font-face {
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
                font-weight:500;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/500/normal.woff2);
                unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/500/normal.woff2);
                unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic-ext/700/normal.woff2);
                unicode-range:U+0460-052F,U+1C80-1C88,U+20B4,U+2DE0-2DFF,U+A640-A69F,U+FE2E-FE2F;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/700/normal.woff2);
                unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/700/normal.woff2);
                unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/900/normal.woff2);
                unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek/900/normal.woff2);
                unicode-range:U+0370-03FF;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/900/normal.woff2);
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
                font-style:italic;
                font-weight:400;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/400/italic.woff2);
                unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/400/italic.woff2);
                unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/400/italic.woff2);
                unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek-ext/400/italic.woff2);
                unicode-range:U+1F00-1FFF;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/500/italic.woff2);
                unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
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
                font-weight:500;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/500/italic.woff2);
                unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
                font-display:swap;
            }
            @font-face {
                font-family:Roboto;
                font-style:italic;
                font-weight:700;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic-ext/700/italic.woff2);
                unicode-range:U+0460-052F,U+1C80-1C88,U+20B4,U+2DE0-2DFF,U+A640-A69F,U+FE2E-FE2F;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/700/italic.woff2);
                unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/700/italic.woff2);
                unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/700/italic.woff2);
                unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
                font-display:swap;
            }</style>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/feather/feather.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/icons/flags/flags.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/simple-calendar/simple-calendar.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            /* Apply hover effect directly to the anchor tag */
            li a:hover {
                background-color: orange;
            }
        </style>
    </head>
    <body>
        <div class="main-wrapper">

            <%@ include file="./eventManager/header.jsp" %>
            <%@include file="./eventManager/menu.jsp" %>
            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="page-header">                               
                        <div>
                            <div class="page-sub-header">                          
                                <div>
                                    <h3>News</h3>
                                    <p>Contents</p>
                                    <a href="#">View more</a>
                                </div>
                            </div>
                        </div>                     
                    </div>
                    <div class="row">
                        <div class="col-xl-4 col-sm-6 col-12 d-flex">
                            <div class="card bg-comman w-100">
                                <div class="card-body">
                                    <div class="db-widgets d-flex justify-content-between align-items-center">
                                        <div class="db-info">
                                            <h6>Total Event Is Taking Place</h6>
                                            <h3>${sessionScope.totalevent}</h3>
                                        </div>
                                        <div class="db-icon">
                                            <img src="${pageContext.request.contextPath}/assets/img/icons/teacher-icon-01.svg" alt="Dashboard Icon">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-sm-6 col-12 d-flex">
                            <div class="card bg-comman w-100">
                                <div class="card-body">
                                    <div class="db-widgets d-flex justify-content-between align-items-center">
                                        <div class="db-info">                                       
                                            <h6>Total Event Took Place</h6>
                                            <h3>${sessionScope.totalEventTook}</h3>
                                        </div>
                                        <div class="db-icon">
                                            <img src="${pageContext.request.contextPath}/assets/img/icons/dash-icon-01.svg" alt="Dashboard Icon">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-sm-12 col-12 d-flex">
                            <div class="card bg-comman w-100">
                                <div class="card-body">
                                    <div class="db-widgets d-flex justify-content-between align-items-center">
                                        <div class="db-info">
                                            <h6>Total Cost Of Events</h6>
                                            <h3>${sessionScope.totalcost} VND</h3>
                                        </div>
                                        <div class="db-icon">
                                            <img src="${pageContext.request.contextPath}/assets/img/icons/teacher-icon-02.svg" alt="Dashboard Icon">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-12 d-flex">
                                <div class="card flex-fill student-space comman-shadow">
                                    <div class="card-header d-flex align-items-center">
                                        <h5 class="card-title">Event List</h5>
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
                                                        <th class="text-center">ID</th>
                                                        <th class="text-center">Name</th>
                                                        <th class="text-center">Location</th>
                                                        <th class="text-center">Date</th>
                                                        <th class="text-center">Is Approve</th>
                                                        <th class="text-center">Status</th>       
                                                        <th class="text-center"></th> 
                                                        <th class="text-center"></th> 
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${not empty sessionScope.listEvent}">
                                                        <c:forEach items="${sessionScope.listEvent}" var="liste" varStatus="count">
                                                            <tr>
                                                                <td class="text-center">${count.index+1}</td>
                                                                <td class="text-center">${liste.getEventID()}</td>
                                                                <td class="text-start">${liste.getEventName()}</td>
                                                                <td class="text-center">${liste.getLocation()}</td>
                                                                <td class="text-center">${liste.getHoldTime()}</td>

                                                                <c:choose>
                                                                    <c:when test="${liste.getApprove() eq 'none'}">
                                                                        <td class="text-center">Waiting</td>
                                                                    </c:when>
                                                                    <c:when test="${liste.getApprove() eq 'true'}">
                                                                        <td class="text-center">Accepted</td>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <td class="text-center">Rejected</td>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                                <%-- Scriptlets should be avoided, but for demonstration, I'm maintaining them --%>
                                                                <%
                                                                    EventManagerDAO dao = new EventManagerDAO();
                                                                    List<Event> events = dao.eventList();

                                                                    Calendar calen = Calendar.getInstance();
                                                                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
                                                                    Timestamp d = new Timestamp(calen.getTimeInMillis());
                                                                    String currentDateTimeString = format.format(d);
                                                                    String eventEndDateTimeString = null;
                                                                    for (Event event : events) {
                                                                        eventEndDateTimeString = format.format(event.getEndTime());
                                                                    }

                                                                    if (currentDateTimeString.compareTo(eventEndDateTimeString) < 0) {
                                                                %>
                                                                <td class="text-center">Happening</td>
                                                                <% } else { %>
                                                                <td class="text-center">Finished</td>
                                                                <% }%>
                                                                <td class="text-center">
                                                                    <a href="/eventmanager/events/detail/${liste.getEventID()}" type="button" class="btn btn-primary">Detail</a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>                                              
                                                    <c:if test="${empty sessionScope.listEvent}">
                                                        <tr>
                                                            <td colspan="7" class="text-center">No events found.</td>
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

                    <footer>
                        <p>COPYRIGHT © 2023 DREAMSTECHNOLOGIES.</p>
                    </footer>

                </div>

            </div>
        </div>
    </body>

    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/feather.min.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/slimscroll/jquery.slimscroll.min.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/apexchart/chart-data.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/simple-calendar/jquery.simple-calendar.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/calander.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/circle-progress.min.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/script.js" type="18ee449b9b2154c0cc5581ea-text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js" data-cf-settings="18ee449b9b2154c0cc5581ea-|49" defer></script></body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



<!-- Mirrored from preschool.dreamstechnologies.com/template/teacher-dashboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 22 Feb 2024 02:41:51 GMT -->
</html>