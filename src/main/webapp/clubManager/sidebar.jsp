<div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="menu-title">
                    <span>Manage Clubs</span>
                </li>
                <li class="<%=(session.getAttribute("tabId").equals(1)) ? "active" : ""%>">
                    <a href="/clubmanager"><i class=""></i> <span>Home</span></a>
                </li>
                <li class="<%=(session.getAttribute("tabId").equals(4)) ? "active" : ""%>">
                    <a href="/clubmanager/viewClubs"><i class=""></i> <span>View Club</span></a>
                </li>
                <li  class="<%=(session.getAttribute("tabId").equals(2)) ? "active" : ""%>">
                    <a href="/clubmanager/checkRequestClub"><i class=""></i> <span>Check Request Clubs</span></a>
                </li>

            </ul>
        </div>
    </div>
</div>