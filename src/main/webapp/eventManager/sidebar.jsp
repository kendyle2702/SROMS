
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
                <li class="<%=(session.getAttribute("taburl").equals(1)) ? "active" : ""%>">
                    <a href="/eventmanager"><i class=""></i> <span>Home</span></a>
                </li>
                <li  class="<%=(session.getAttribute("taburl").equals(2)) ? "active" : ""%>">
                    <a href="/eventmanager/events/create"><i class=""></i> <span>Create Event</span></a>
                </li>
                <li class=" <%=(session.getAttribute("taburl").equals(3)) ? "active" : ""%>">
                    <a href="/eventmanager/events/viewevent"><i class=""></i><span>View Event</span></a>
                </li>
                <li class="menu-title">Participants Management</li>
                <li>
                    <a href="#"><i class=""></i><span> Check Attendant</span></a>
                </li>
                <li>
                    <a  href="#"><i class=""></i><span> Evaluate Participant</span></a>
                </li>
            </ul>
        </div>
    </div>
</div>