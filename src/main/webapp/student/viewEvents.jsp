<%@page import="Models.Event"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.EventsDAO"%>
<div class="page-wrapper" style="min-height: 691px;">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">Welcome Student!</h3>
                        <ul class="breadcrumb">

                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xl-12 d-flex">
                <div class="card flex-fill student-space comman-shadow">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table star-student table-hover table-center table-borderless table-striped">
                                <thead class="thead-light">
                                    <tr>
                                        <th class="text-center">#</th>
                                        <th class="text-center">Name</th>
                                        <th class="text-center">Start Time</th>
                                        <th class="text-center">Description</th>
                                        <th class="text-center">Location</th>
                                        <th class="text-center">Category</th>
                                        <td class="text-cemter"></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        EventsDAO eventsDAO = new EventsDAO();
                                        List<Event> events = eventsDAO.getAllEventsForStudent();
                                        int count = 1;
                                        if (events != null && !events.isEmpty()) {
                                            for (Event event : events) {
                                                String categoryName = eventsDAO.getEventCategoryName(event.getEventCategoryID());
                                    %>
                                    <tr>
                                        <td class="text-center"><%= count++%></td>
                                        <td class="text-center"><%= event.getEventName()%></td>
                                        <td class="text-center"><%= event.getHoldTime()%></td>
                                        <td class="text-center"><%= event.getDescription()%></td>
                                        <td class="text-center"><%= event.getLocation()%></td>
                                        <td class="text-center"><%= categoryName%></td>
                                        <td>
                                        <td>
                                            <form action="register" method="post">
                                                <input type="hidden" name="EventID" value="<%=event.getEventID()%>">
                                                <button type="submit" class="btn btn-info">Register</button>
                                            </form>
                                        </td> 
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    } else {
                                    %>
                                    <tr>
                                        <td colspan="4" class="text-center">No events.</td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>



    </div>


</div>