<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="Models.UserProfile"%>
<div class="header">
    <div class="header-left">
        <a href="/" class="logo" style="text-decoration: none;font-size: 34px;color: #ea7127;">
            <img src="${pageContext.request.contextPath}/assets/img/login_favicon.jpg" alt="Logo" width="100" height="100"> SROMS
        </a>
        <a href="/" class="logo logo-small">
            <img src="${pageContext.request.contextPath}/assets/img/login_favicon.jpg" alt="Logo" width="100" height="100">
        </a>
    </div>
    <div class="menu-toggle">
        <a style="background:#ea7127; " href="javascript:void(0);" id="toggle_btn">
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
                <img src="${pageContext.request.contextPath}/assets/img/icons/header-icon-01.svg" alt>
            </a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="javascript:;"><i class="flag flag-lr me-2"></i>English</a>
                <a class="dropdown-item" href="javascript:;"><i class="flag flag-bl me-2"></i>Francais</a>
                <a class="dropdown-item" href="javascript:;"><i class="flag flag-cn me-2"></i>Turkce</a>
            </div>
        </li>
        
        <li class="nav-item zoom-screen me-2">
            <a href="#" class="nav-link header-nav-list">
                <img src="${pageContext.request.contextPath}/assets/img/icons/header-icon-04.svg" alt>
            </a>
        </li>
        <%
            UserProfile userProfile = (UserProfile) session.getAttribute("user");
        %>
        <li class="nav-item dropdown has-arrow new-user-menus">
            <a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                <div class="user-img">
                    <img class="rounded-circle" src="${pageContext.request.contextPath}/assets/img/avatar/<%=userProfile.getAvatar() %>" width="30" height="50" alt="Ryan Taylor">
                    <div class="user-text">
                        <h6><%= userProfile.getLastName() + " " + userProfile.getFirstName()%></h6>
                        <p style="color: #ea7127" class="text-muted mb-0"><%=(String) session.getAttribute("role")%></p>
                    </div>
                </div>
            </a>
            <div class="dropdown-menu">
                <!-- User header section -->
                <div class="user-header">
                    <!-- User avatar -->
                    <div class="avatar avatar-sm">
                        <img src="${pageContext.request.contextPath}/assets/img/avatar/<%=userProfile.getAvatar() %>" alt="User Image" class="avatar-img rounded-circle">
                    </div>
                    <!-- User information -->
                    <div class="user-text">
                        <h6><%= userProfile.getLastName() + " " + userProfile.getFirstName()%></h6> <!-- User's name -->
                        <p class="text-muted mb-0"><%=(String) session.getAttribute("role")%></p> <!-- User's role/job title -->
                    </div>
                </div>

                <!-- Dropdown menu items -->
                <%
                    String roleURL = (String)session.getAttribute("roleURL"); 
                %>
                <a class="dropdown-item" href="/<%=roleURL%>/profile">My Profile</a>
               
                <a class="dropdown-item" href="/logout">Logout</a> <!-- Link to logout functionality -->
            </div>

        </li>
    </ul>
</div>