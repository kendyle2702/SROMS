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


                <li >
                    <a href="/student/events/view" ><i class="feather-clipboard" class="<%=(session.getAttribute("tabId").equals(3)) ? "active subdrop" : ""%>"></i> <span> View Event </span></a>
                </li>
                <li >
                    <a href="/student/viewEventMyClub" ><i class="feather-clipboard" class="<%=(session.getAttribute("tabId").equals(12)) ? "active subdrop" : ""%>"></i> <span>View Event My Club</span></a>
                </li>
                <c:choose>
                    <c:when test="${sessionScope.getClubRole eq 'Leader Club'}">
                        <li>
                            <a href="/student/createEventMyClub" ><i class="feather-clipboard"  class="<%=(session.getAttribute("tabId").equals(14)) ? "active subdrop" : ""%>"></i> <span>Create Event For Club</span></a>
                        </li>
                    </c:when>
                    <c:otherwise>

                    </c:otherwise>
                </c:choose>
                <li class="menu-title">
                    <span>Event</span>
                </li>
                <li><a href="/student/clubs/view" class="<%= session.getAttribute("tabId").equals(4) ? "active subdrop" : ""%>">View Clubs</a></li>
                <li><a href="/student/clubs/create" class="<%= session.getAttribute("tabId").equals(10) ? "active subdrop" : ""%>">Create Club</a></li>

                </li>
            </ul>
        </div>
    </div>
</div>