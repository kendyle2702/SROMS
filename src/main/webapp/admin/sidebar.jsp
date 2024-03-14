
<style>
    /* Apply hover effect directly to the anchor tag */
    li a:hover {
        text-decoration: none;
    }
</style>

<div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="menu-title">
                    <span>Main Menu</span>
                </li>
                <li class="<%=(session.getAttribute("tabId").equals(3))||(session.getAttribute("tabId").equals(2))||(session.getAttribute("tabId").equals(1)) ? "active" : ""%>">
                    <a href="/admin"><i class="feather-home"></i> <span>Home</span></a>
                </li>
                <li class="menu-title">
                    <span>Account Management</span>
                </li>
                <li class="submenu <%=(session.getAttribute("tabId").equals(4))||(session.getAttribute("tabId").equals(5)) ? "active" : ""%>">
                    <a href="#"><i class="feather-user"></i> <span class="title">Event Manager</span> <span class="menu-arrow"></span></a>
                    <ul>
                        <li><a href="/admin/account/eventmanager" class="<%=(session.getAttribute("tabId").equals(4)?"active subdrop":"")%>">View Accounts</a></li>
                        <li><a href="/admin/account/eventmanager/create" class="<%=(session.getAttribute("tabId").equals(5)?"active subdrop":"")%>">Add Account</a></li>
                    </ul>
                </li>
                <li class="submenu <%=(session.getAttribute("tabId").equals(6))||(session.getAttribute("tabId").equals(7)) ? "active" : ""%>">
                    <a href="#"><i class="feather-user"></i> <span class="title">Club Manager</span> <span class="menu-arrow"></span></a>
                    <ul>
                        <li><a href="/admin/account/clubmanager" class="<%=(session.getAttribute("tabId").equals(6)?"active subdrop":"")%>">View Accounts</a></li>
                        <li><a href="/admin/account/clubmanager/create" class="<%=(session.getAttribute("tabId").equals(7)?"active subdrop":"")%>">Add Account</a></li>
                    </ul>
                </li>
                <li class="submenu <%=(session.getAttribute("tabId").equals(8))||(session.getAttribute("tabId").equals(9))||session.getAttribute("tabId").equals(10) ? "active" : ""%>">
                    <a href="#"><i class="feather-user"></i> <span class="title">Student</span> <span class="menu-arrow"></span></a>
                    <ul>
                        <li><a href="/admin/account/student" class="<%=(session.getAttribute("tabId").equals(8)||session.getAttribute("tabId").equals(10)?"active subdrop":"")%>">View Accounts</a></li>
                        <li><a href="/admin/account/student/create" class="<%=(session.getAttribute("tabId").equals(9)?"active subdrop":"")%>">Add Account</a></li>
                    </ul>
                </li>
                <li class="menu-title">
                    <span>News Management</span>
                </li>
                <li class="submenu <%=(session.getAttribute("tabId").equals(13))||(session.getAttribute("tabId").equals(14))||(session.getAttribute("tabId").equals(15)) ? "active" : ""%>">
                    <a href="#"><i class="feather-mail"></i> <span class="title">News</span> <span class="menu-arrow"></span></a>
                    <ul>
                        <li><a href="/admin/news" class="<%=(session.getAttribute("tabId").equals(13)||session.getAttribute("tabId").equals(15)?"active subdrop":"")%>">View News</a></li>
                        <li><a href="/admin/news/create" class="<%=(session.getAttribute("tabId").equals(14)?"active subdrop":"")%>">Add News</a></li>
                    </ul>
                </li>
                <li class="menu-title">
                    <span>Events Management</span>
                </li>
                <li class="<%=(session.getAttribute("tabId").equals(16))||(session.getAttribute("tabId").equals(17)) ? "active" : ""%>">
                    <a href="/admin/events"><i class="fas fa-calendar-day"></i><span>Check Request Events</span></a>
                </li>
                <li class="menu-title">
                    <span>Score Management</span>
                </li>
                <li class="submenu ">
                    <a href="#"><i class="feather-clipboard"></i> <span class="title">Score Statistics</span> <span class="menu-arrow"></span></a>
                    <ul>
                        <li><a href="/admin/score/student" class="">Student</a></li>
                        <li><a href="/admin/score/club" class="">Club</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>