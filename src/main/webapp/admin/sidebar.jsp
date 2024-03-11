
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
            </ul>
        </div>
    </div>
</div>