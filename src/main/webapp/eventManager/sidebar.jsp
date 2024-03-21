
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
                <li class="<%=(session.getAttribute("tabId").equals(1)||session.getAttribute("tabId").equals(5)||session.getAttribute("tabId").equals(6)) ? "active" : ""%>">
                    <a href="/eventmanager"><i class="feather-home"></i> <span>Home</span></a>
                </li>     
                <li class="menu-title">
                    <span>Event Management</span>
                </li>
                <li class="submenu <%=(session.getAttribute("tabId").equals(2)||session.getAttribute("tabId").equals(3)||session.getAttribute("tabId").equals(4)) ? "active" : ""%>">
                    <a href="#"><i class="feather-clipboard"></i> <span class="title">Event</span> <span class="menu-arrow"></span></a>
                    <ul>
                        <li>
                            <a href="/eventmanager/events/create" class="<%=(session.getAttribute("tabId").equals(2) ? "active subdrop" : "")%>"><i class=""></i><span>Create Event</span></a>
                        </li>
                        <li>
                            <a href="/eventmanager/events/viewevent" class="<%=(session.getAttribute("tabId").equals(3)||session.getAttribute("tabId").equals(4)) ? "active subdrop" : ""%>"><i class=""></i><span>View Event</span></a>
                        </li>
                    </ul>
                </li>
                <li class="menu-title">
                    <span>Manage Event Requests</span>
                </li>
                <li class="submenu <%=(session.getAttribute("tabId").equals(11)||session.getAttribute("tabId").equals(12)) ? "active" : ""%>">
                    <a href="#"><i class="feather-clipboard"></i> <span class="title">Check Request</span> <span class="menu-arrow"></span></a>
                    <ul> <li>
                            <a class=" <%=(session.getAttribute("tabId").equals(12)) ? "active subdrop" : ""%>" href="/eventmanager/events/eventswitingapprove"><i class=""></i><span>List Events Awaiting</span></a>
                        </li>
                        <li>
                            <a class=" <%=(session.getAttribute("tabId").equals(11)) ? "active subdrop" : ""%>"  href="/eventmanager/events/checkrequestcreateevent"><i class=""></i><span>Check Request Events</span></a>
                        </li>
                    </ul>
                </li>   <li class="menu-title">
                    <span>Participants Management</span>
                </li>
                <li class="submenu <%=(session.getAttribute("tabId").equals(7)||session.getAttribute("tabId").equals(9)|| session.getAttribute("tabId").equals(8)|| session.getAttribute("tabId").equals(10)) ? "active" : ""%>">
                    <a href="#"><i class="feather-clipboard"></i> <span class="title">Attendant & Evaluate</span> <span class="menu-arrow"></span></a>
                    <ul> 
                        <li>
                            <a class=" <%=(session.getAttribute("tabId").equals(7)) || (session.getAttribute("tabId").equals(8)) ? "active subdrop" : ""%>" href="/eventmanager/events/checkAttandant"><i class=""></i><span>Check Attendant</span></a>
                        </li>
                        <li>
                            <a class=" <%=(session.getAttribute("tabId").equals(9)) || (session.getAttribute("tabId").equals(10)) ? "active subdrop" : ""%>" href="/eventmanager/events/evaluate"><i class=""></i><span>Evaluate Student</span></a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>