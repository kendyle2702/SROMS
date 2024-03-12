
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
                <li class="<%=(session.getAttribute("tabId").equals(1)) ? "active" : ""%>">
                    <a href="/eventmanager"><i class=""></i> <span>Home</span></a>
                </li>
                <li  class="<%=(session.getAttribute("tabId").equals(2)) ? "active" : ""%>">
                    <a href="/eventmanager/events/create"><i class=""></i> <span>Create Event</span></a>
                </li>
                <li class=" <%=(session.getAttribute("tabId").equals(3)) || (session.getAttribute("tabId").equals(4)) ? "active" : ""%>">
                    <a href="/eventmanager/events/viewevent"><i class=""></i><span>View Event</span></a>
                </li>
                <li class="menu-title">Participants Management</li>
                <li  class=" <%=(session.getAttribute("tabId").equals(7)) || (session.getAttribute("tabId").equals(8)) ? "active" : ""%>">
                    <a href="/eventmanager/events/checkAttandant"><i class=""></i><span>Check Attendant</span></a>
                </li>
                <li class=" <%=(session.getAttribute("tabId").equals(9)) || (session.getAttribute("tabId").equals(10)) ? "active" : ""%>">
                    <a  href="/eventmanager/events/evaluate"><i class=""></i><span> Evaluate Student</span></a>
                </li>
            </ul>
        </div>
    </div>
</div>