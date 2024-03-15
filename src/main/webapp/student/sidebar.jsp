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
                <li class="<%=(session.getAttribute("tabId").equals(3)) ? "active" : ""%>">
                    <a href="/student/events/view" ><i class="feather-clipboard"></i> <span> View Event </span></a>
                </li>
                <li class="menu-title">
                    <span>Club</span>
                </li>
                <li class="submenu <%=(session.getAttribute("tabId").equals(4)) || (session.getAttribute("tabId").equals(10)) ? "active" : ""%>">
                    <a href="#"><i class="feather-user"></i> <span class="title">Club</span> <span class="menu-arrow"></span></a>
                    <ul>
                        <li><a href="/student/clubs/view" class="<%=(session.getAttribute("tabId").equals(4) ? "active subdrop" : "")%>">View Clubs</a></li>
                        <li><a href="/student/clubs/create" class="<%=(session.getAttribute("tabId").equals(10) ? "active subdrop" : "")%>">Create Club</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>