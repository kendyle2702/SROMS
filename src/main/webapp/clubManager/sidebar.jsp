
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
                    <span>Manage Clubs</span>
                </li>
                <li class="<%=(session.getAttribute("tabId").equals(1)) ? "active" : ""%>">
                    <a href="/clubmanager"><i class="feather-home"></i> <span>Home</span></a>
                </li>
                <li class="<%=(session.getAttribute("tabId").equals(4)) ? "active" : ""%>">
                    <a href="/clubmanager/viewclubs"><i class=""></i> <span>View Club</span></a>
                </li>
                <li  class="<%=(session.getAttribute("tabId").equals(2)) ? "active" : ""%>">
                    <a href="/clubmanager/checkrequestClub"><i class=""></i> <span>Check Request Clubs</span></a>
                </li>
                <li class="submenu <%=(session.getAttribute("tabId").equals(4))||(session.getAttribute("tabId").equals(5)) ? "active" : ""%>">
                    <a href="/clubmanager/viewclubpoint"><i class="feather"></i> <span class="title">View Club Point</span> <span class=""></span></a>

            </ul>
        </div>
    </div>
</div>