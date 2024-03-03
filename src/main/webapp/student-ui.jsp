<%-- 
    Document   : student-ui
    Created on : Mar 1, 2024, 6:09:25 PM
    Author     : khuy
--%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DB.DBConnection"%>
<%@ page import="DAOs.NewsDAO" %>
<%@ page import="Models.News" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>SROMS</title>

        <link rel="shortcut icon" href="assets/img/favicon.png">

        <style type="text/css">@font-face {
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/400/normal.woff2);
                unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek-ext/400/normal.woff2);
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/500/normal.woff2);
                unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek/500/normal.woff2);
                unicode-range:U+0370-03FF;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/700/normal.woff2);
                unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/700/normal.woff2);
                unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
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
                font-weight:900;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek-ext/900/normal.woff2);
                unicode-range:U+1F00-1FFF;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin/900/normal.woff2);
                unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/900/normal.woff2);
                unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/900/normal.woff2);
                unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/400/italic.woff2);
                unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/greek/400/italic.woff2);
                unicode-range:U+0370-03FF;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/latin-ext/500/italic.woff2);
                unicode-range:U+0100-02AF,U+0304,U+0308,U+0329,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20CF,U+2113,U+2C60-2C7F,U+A720-A7FF;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic/500/italic.woff2);
                unicode-range:U+0301,U+0400-045F,U+0490-0491,U+04B0-04B1,U+2116;
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
                font-weight:700;
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/vietnamese/700/italic.woff2);
                unicode-range:U+0102-0103,U+0110-0111,U+0128-0129,U+0168-0169,U+01A0-01A1,U+01AF-01B0,U+0300-0301,U+0303-0304,U+0308-0309,U+0323,U+0329,U+1EA0-1EF9,U+20AB;
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
                src:url(https://preschool.dreamstechnologies.com/cf-fonts/s/roboto/5.0.11/cyrillic-ext/700/italic.woff2);
                unicode-range:U+0460-052F,U+1C80-1C88,U+20B4,U+2DE0-2DFF,U+A640-A69F,U+FE2E-FE2F;
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

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/feather/feather.css">

        <link rel="stylesheet" href="assets/plugins/icons/flags/flags.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
        <div class="main-wrapper">

            <div class="header">

                <div class="header-left">
                    <a href="/student" class="logo">
                        <img src="assets/img/logo.png" alt="Logo">
                    </a>
                    <a href="/student" class="logo logo-small">
                        <img src="assets/img/logo-small.png" alt="Logo" width="30" height="30">
                    </a>
                </div>

                <div class="menu-toggle">
                    <a href="javascript:void(0);" id="toggle_btn">
                        <i class="fas fa-bars"></i>
                    </a>
                </div>

                <div class="top-nav-search">
                    <form>
                        <input type="text" class="form-control" placeholder="Search here">
                        <button class="btn" type="submit"><i class="fas fa-search"></i></button>
                    </form>
                </div>


                <a class="mobile_btn" id="mobile_btn">
                    <i class="fas fa-bars"></i>
                </a>


                <ul class="nav user-menu">
                    <li class="nav-item dropdown language-drop me-2">
                        <a href="#" class="dropdown-toggle nav-link header-nav-list" data-bs-toggle="dropdown">
                            <img src="assets/img/icons/header-icon-01.svg" alt>
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="javascript:;"><i class="flag flag-lr me-2"></i>English</a>
                            <a class="dropdown-item" href="javascript:;"><i class="flag flag-bl me-2"></i>Francais</a>
                            <a class="dropdown-item" href="javascript:;"><i class="flag flag-cn me-2"></i>Turkce</a>
                        </div>
                    </li>

                    <li class="nav-item dropdown noti-dropdown me-2">
                        <a href="#" class="dropdown-toggle nav-link header-nav-list" data-bs-toggle="dropdown">
                            <img src="assets/img/icons/header-icon-05.svg" alt>
                        </a>
                        <div class="dropdown-menu notifications">
                            <div class="topnav-dropdown-header">
                                <span class="notification-title">Notifications</span>
                                <a href="javascript:void(0)" class="clear-noti"> Clear All </a>
                            </div>
                            <div class="noti-content">
                                <ul class="notification-list">
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media d-flex">
                                                <span class="avatar avatar-sm flex-shrink-0">
                                                    <img class="avatar-img rounded-circle" alt="User Image"
                                                         src="assets/img/profiles/avatar-02.jpg">
                                                </span>
                                                <div class="media-body flex-grow-1">
                                                    <p class="noti-details"><span class="noti-title">Carlson Tech</span> has
                                                        approved <span class="noti-title">your estimate</span></p>
                                                    <p class="noti-time"><span class="notification-time">4 mins ago</span>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media d-flex">
                                                <span class="avatar avatar-sm flex-shrink-0">
                                                    <img class="avatar-img rounded-circle" alt="User Image"
                                                         src="assets/img/profiles/avatar-11.jpg">
                                                </span>
                                                <div class="media-body flex-grow-1">
                                                    <p class="noti-details"><span class="noti-title">International Software
                                                            Inc</span> has sent you a invoice in the amount of <span
                                                            class="noti-title">$218</span></p>
                                                    <p class="noti-time"><span class="notification-time">6 mins ago</span>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media d-flex">
                                                <span class="avatar avatar-sm flex-shrink-0">
                                                    <img class="avatar-img rounded-circle" alt="User Image"
                                                         src="assets/img/profiles/avatar-17.jpg">
                                                </span>
                                                <div class="media-body flex-grow-1">
                                                    <p class="noti-details"><span class="noti-title">John Hendry</span> sent
                                                        a cancellation request <span class="noti-title">Apple iPhone
                                                            XR</span></p>
                                                    <p class="noti-time"><span class="notification-time">8 mins ago</span>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media d-flex">
                                                <span class="avatar avatar-sm flex-shrink-0">
                                                    <img class="avatar-img rounded-circle" alt="User Image"
                                                         src="assets/img/profiles/avatar-13.jpg">
                                                </span>
                                                <div class="media-body flex-grow-1">
                                                    <p class="noti-details"><span class="noti-title">Mercury Software
                                                            Inc</span> added a new product <span class="noti-title">Apple
                                                            MacBook Pro</span></p>
                                                    <p class="noti-time"><span class="notification-time">12 mins ago</span>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="topnav-dropdown-footer">
                                <a href="#">View all Notifications</a>
                            </div>
                        </div>
                    </li>

                    <li class="nav-item zoom-screen me-2">
                        <a href="#" class="nav-link header-nav-list">
                            <img src="assets/img/icons/header-icon-04.svg" alt>
                        </a>
                    </li>

                    <li class="nav-item dropdown has-arrow new-user-menus">
                        <a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                            <div class="user-img">
                                <img class="rounded-circle" src="assets/img/profiles/avatar-01.jpg" width="31"
                                     alt="Ryan Taylor">
                                <div class="user-text">
                                    <h6>Khuy</h6>
                                    <p class="text-muted mb-0">Student</p>
                                </div>
                            </div>
                        </a>
                        <div class="dropdown-menu">
                            <div class="user-header">
                                <div class="avatar avatar-sm">
                                    <img src="assets/img/profiles/avatar-01.jpg" alt="User Image"
                                         class="avatar-img rounded-circle">
                                </div>
                                <div class="user-text">
                                    <h6>Khuy</h6>
                                    <p class="text-muted mb-0">student</p>
                                </div>
                            </div>
                            <a class="dropdown-item" href="/student/profile">My Profile</a>
                            <a class="dropdown-item" href="/logout">Logout</a>
                        </div>
                    </li>

                </ul>

            </div>


            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li class="menu-title">
                                <span>Main Menu</span>
                            </li>
                            <li class="active">
                                <a href="/student"><i class=""></i> <span> Home</span></a>
                            </li>
                            <li>
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

            <div class="page-wrapper" style="min-height: 691px;">
                <div class="content container-fluid">

                    <div class="page-header">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="page-sub-header">
                                    <h3 class="page-title">Welcome Student!</h3>
                                    <ul class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="/student">Home</a></li>
                                        <li class="breadcrumb-item active"><a href="/student/profile/view">Management Profile</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12 col-lg-12 col-xl-8">
                            <div class="card flex-fill comman-shadow">
                                <div class="card-header">
                                    <div class="row align-items-center">
                                        <div class="col-4">
                                            <h5 class="card-title"> New</h5>
                                        </div>
                                        <div class="col-8">
                                            <ul class="chart-list-out">
                                                <li class="lesson-view-all"><a href="/student/news/view">View All</a></li>
                                            </ul>
                                        </div>

                                        <!-- box show 1 new on today -->
                                        <div class="card flex-fill comman-shadow">
                                            <div class="card-header">
                                                <div class="row align-items-center">
                                                    <div class="col-4">
                                                        <h5 class="card-title">Today’s New</h5>
                                                    </div>
                                                </div>
                                                <%
                                                    // Create an instance of NewsDAO
                                                    NewsDAO newsDAO = new NewsDAO();

                                                    // Call the getLatestNews method to fetch the latest news article
                                                    News latestNews = newsDAO.getLatestNews();
                                                %>
                                                <div class="card-header">
                                                    <div class="row align-items-center">
                                                        <div class="col-10">
                                                            <h3 class="blog-title"><a href="/student/news/detail"><%= latestNews.getTitle()%></a></h3>
                                                            <p><%= latestNews.getContent()%></p>
                                                        </div>
                                                        <div class="col-2">
                                                            <div class="skip-group">
                                                                <button type="submit" class="btn btn-info continue-btn">Next</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

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

                                <div class="card-body">
                                    <h4 class="header-title mb-4">Tabs Justified</h4>
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
                                                    <table class="table table-center">
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <div class="date">
                                                                        <b> FCoder</b>
                                                                        <p> 255/1000 </p>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="lesson-confirm">
                                                                        <a href="student/clubs/detail"> Club Details</a>
                                                                    </div>
                                                                    <button type="submit" class="btn btn-info">
                                                                        Register</button>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="date">
                                                                        <b> FChess</b>
                                                                        <p> 25/100</p>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="lesson-confirm">
                                                                        <a href="student/clubs/detail"> Club Details</a>
                                                                    </div>
                                                                    <button type="submit" class="btn btn-info">
                                                                        Register</button>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
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

                        <div class="col-12 col-lg-12 col-xl-4 d-flex">
                            <div class="card flex-fill comman-shadow">
                                <div class="card-body">
                                    <div class="calendar-info calendar-info1">
                                        <div class="up-come-header">
                                            <h2>Upcoming Events</h2>
                                            <span><a href="javascript:;"><i class="feather-plus"></i></a></span>
                                        </div>
                                        <div class="upcome-event-date">
                                            <h3>10 Jan</h3>
                                            <span><i class="fas fa-ellipsis-h"></i></span>
                                        </div>
                                        <div class="calendar-details">
                                            <p>08:00 am</p>
                                            <div class="calendar-box normal-bg">
                                                <div class="calandar-event-name">
                                                    <h4>Botony</h4>
                                                    <h5>Lorem ipsum sit amet</h5>
                                                </div>
                                                <span>08:00 - 09:00 am</span>
                                            </div>
                                        </div>
                                        <div class="calendar-details">
                                            <p>09:00 am</p>
                                            <div class="calendar-box normal-bg">
                                                <div class="calandar-event-name">
                                                    <h4>Botony</h4>
                                                    <h5>Lorem ipsum sit amet</h5>
                                                </div>
                                                <span>09:00 - 10:00 am</span>
                                            </div>
                                        </div>
                                        <div class="calendar-details">
                                            <p>10:00 am</p>
                                            <div class="calendar-box normal-bg">
                                                <div class="calandar-event-name">
                                                    <h4>Botony</h4>
                                                    <h5>Lorem ipsum sit amet</h5>
                                                </div>
                                                <span>10:00 - 11:00 am</span>
                                            </div>
                                        </div>
                                        <div class="upcome-event-date">
                                            <h3>10 Jan</h3>
                                            <span><i class="fas fa-ellipsis-h"></i></span>
                                        </div>
                                        <div class="calendar-details">
                                            <p>08:00 am</p>
                                            <div class="calendar-box normal-bg">
                                                <div class="calandar-event-name">
                                                    <h4>English</h4>
                                                    <h5>Lorem ipsum sit amet</h5>
                                                </div>
                                                <span>08:00 - 09:00 am</span>
                                            </div>
                                        </div>
                                        <div class="calendar-details">
                                            <p>09:00 am</p>
                                            <div class="calendar-box normal-bg">
                                                <div class="calandar-event-name">
                                                    <h4>Mathematics </h4>
                                                    <h5>Lorem ipsum sit amet</h5>
                                                </div>
                                                <span>09:00 - 10:00 am</span>
                                            </div>
                                        </div>
                                        <div class="calendar-details">
                                            <p>10:00 am</p>
                                            <div class="calendar-box normal-bg">
                                                <div class="calandar-event-name">
                                                    <h4>History</h4>
                                                    <h5>Lorem ipsum sit amet</h5>
                                                </div>
                                                <span>10:00 - 11:00 am</span>
                                            </div>
                                        </div>
                                        <div class="calendar-details">
                                            <p>11:00 am</p>
                                            <div class="calendar-box break-bg">
                                                <div class="calandar-event-name">
                                                    <h4>Break</h4>
                                                    <h5>Lorem ipsum sit amet</h5>
                                                </div>
                                                <span>11:00 - 12:00 am</span>
                                            </div>
                                        </div>
                                        <div class="calendar-details">
                                            <p>11:30 am</p>
                                            <div class="calendar-box normal-bg">
                                                <div class="calandar-event-name">
                                                    <h4>History</h4>
                                                    <h5>Lorem ipsum sit amet</h5>
                                                </div>
                                                <span>11:30 - 12:00 am</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


                </div>

                <footer>
                    <p>Group 2.</p>
                </footer>

            </div>
        </div>


        <script src="assets/js/jquery-3.7.1.min.js" type="e562c8e39a619d2a6300bdb8-text/javascript"></script>

        <script src="assets/js/bootstrap.bundle.min.js" type="e562c8e39a619d2a6300bdb8-text/javascript"></script>

        <script src="assets/js/feather.min.js" type="e562c8e39a619d2a6300bdb8-text/javascript"></script>

        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"
        type="e562c8e39a619d2a6300bdb8-text/javascript"></script>

        <script src="assets/plugins/apexchart/apexcharts.min.js" type="e562c8e39a619d2a6300bdb8-text/javascript"></script>
        <script src="assets/plugins/apexchart/chart-data.js" type="e562c8e39a619d2a6300bdb8-text/javascript"></script>

        <script src="assets/plugins/simple-calendar/jquery.simple-calendar.js"
        type="e562c8e39a619d2a6300bdb8-text/javascript"></script>
        <script src="assets/js/calander.js" type="e562c8e39a619d2a6300bdb8-text/javascript"></script>

        <script src="assets/js/circle-progress.min.js" type="e562c8e39a619d2a6300bdb8-text/javascript"></script>

        <script src="assets/js/script.js" type="e562c8e39a619d2a6300bdb8-text/javascript"></script>
        <script src="assets/cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js"
        data-cf-settings="e562c8e39a619d2a6300bdb8-|49" defer></script>
    </body>
</html>
