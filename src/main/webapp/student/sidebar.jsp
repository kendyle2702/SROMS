

<%@page import="DAOs.UserLoginDAO"%>
<%@page import="Models.UserProfile"%>
<%@page import="com.nimbusds.jose.crypto.impl.AAD"%>
<%@page import="DAOs.ClubDAO"%>
<div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="menu-title">
                    <span>Main Menu</span>
                </li>
                <li class="<%=(session.getAttribute("tabId").equals(1)) ? "active" : ""%>">
                    <a href="/student"><i class="feather-home"></i> <span> Home</span></a>
                </li>
                <li class="menu-title">
                    <span>News</span>
                </li>
                <li class="<%=(session.getAttribute("tabId").equals(2)) ? "active" : ""%>">
                    <a href="/student/news/view"><i class="feather-mail"></i><span> View News</span></a>
                </li>
                <li class="menu-title">
                    <span>Event</span>
                </li>
                <li class="submenu <%=(session.getAttribute("tabId").equals(3)) || (session.getAttribute("tabId").equals(14)) ? "active" : ""%>">
                    <a href="#"><i class="feather-clipboard"></i> <span class="title">Event</span> <span class="menu-arrow"></span></a>
                    <ul>
                        <li><a href="/student/events/view"  class="<%=(session.getAttribute("tabId").equals(3) ? "active subdrop" : "")%>"> View Event</a></li>
                    </ul>
                </li>

                <li class="menu-title">
                    <span>Club</span>
                </li>
                <li class="submenu <%=(session.getAttribute("tabId").equals(4)) ? "active" : ""%>">
                    <a href="#"><i class="feather-user-plus"></i> <span class="title">Club</span><span class="menu-arrow"></span></a>
                    <ul>
                        <li><a href="/student/clubs/view" class="<%= session.getAttribute("tabId").equals(4) ? "active subdrop" : ""%>"> View Clubs</a></li>                           
                    </ul>
                </li>

                <li class="menu-title">
                    <span>Activities Point</span>
                </li>
                <li class="<%=(session.getAttribute("tabId").equals(12)) ? "active" : ""%>">
                    <a href="/student/point/view"><i class="feather-bookmark"></i><span> View Activities Point</span></a>
                </li>


            </ul>
        </div>
    </div>
</div>