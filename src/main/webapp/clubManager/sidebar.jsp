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
                <li class="<%=(session.getAttribute("tabId").equals(1)||session.getAttribute("tabId").equals(2)||session.getAttribute("tabId").equals(3))? "active" : ""%>">
                    <a href="/clubmanager"><i class="feather-home"></i> <span>Home</span></a>
                </li>
                <li class="menu-title">
                    <span>Club Management</span>
                </li>
                <li class="<%=(session.getAttribute("tabId").equals(4))|| (session.getAttribute("tabId").equals(5))? "active" : ""%>">
                    <a href="/clubmanager/viewclubs"><i class="feather-eye"></i> <span>View Club</span></a>
                </li>
                <li  class="<%=(session.getAttribute("tabId").equals(6)) ? "active" : ""%>">
                    <a href="/clubmanager/checkrequestClub"><i class="feather-check-square"></i> <span>Check Request Clubs</span></a>
                </li>
                <li class="menu-title">
                    <span>Club Score Statistics</span>
                </li>
                <li class="<%=(session.getAttribute("tabId").equals(7)||session.getAttribute("tabId").equals(8)) ? "active" : ""%>">
                    <a href="/clubmanager/viewclubpoint"><i class="feather-award"></i> <span class="title">View Club Point</span> </a>
                </li>
            </ul>
        </div>
    </div>
</div>