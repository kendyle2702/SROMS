<%@page import="Models.Event"%>
<%@page import="java.util.List"%>
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
                            <table id="viewEvents" class="table table-hover table-striped table-bordered">
                                <thead class="thead-light">
                                    <tr>
                                        <th class="text-center">No</th>
                                        <th class="text-center">Event ID</th>
                                        <th class="text-center">Name</th>
                                        <th class="text-center">Location</th>
                                        <th class="text-center">Date</th>
                                        <th class="text-center">Category</th>
                                        <th class="text-center">Register</th> 
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${sessionScope.listEvent}" var="event" varStatus="count">
                                    <tr>
                                        <td>${count.index + 1}</td>
                                        <td>${event.eventID}</td>
                                        <td>${event.eventName}</td>
                                        <td>${event.location}</td>
                                        <td>${event.holdTime}</td>
                                    <td>${sessionScope.eventCategoryNames[event.eventID]}</td>
                                    <td class="text-center">
                                        <form action="student" method="post">
                                            <input type="hidden" name="action" value="registerEvent">
                                            <input type="hidden" name="EventID" value="${event.eventID}">
                                            <button type="submit" class="btn btn-primary">Register</button>
                                        </form>
                                    </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty sessionScope.listEvent}">
                                    <tr>
                                        <td colspan="7" class="text-center">No events found.</td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>                                          
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>