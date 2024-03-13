<div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="menu-title">
                    <span>Main Menu</span>
                </li>
                <li class="<%=(session.getAttribute("tabId").equals(1))? "active" : ""%>">
                    <a href="/student"><i class=""></i> <span> Home</span></a>
                </li>
                <li class="<%=(session.getAttribute("tabId").equals(2)) ? "active" : ""%>">
                    <a href="/student/news/view"><i class=""></i><span> View News</span></a>
                </li>
                <li class="<%=(session.getAttribute("tabId").equals(3)) ? "active" : ""%>">
                    <a href="/student/events/view"><i class=""></i><span> View Events</span></a>
                    <!--/student/events/view-->
                </li>
                <li class="<%=(session.getAttribute("tabId").equals(4)) || (session.getAttribute("tabId").equals(8)) ? "active" : ""%>">
                    <a href="/student/clubs/view"><i class=""></i><span> View Clubs</span></a>
                </li>

            </ul>
        </div>
    </div>
</div>