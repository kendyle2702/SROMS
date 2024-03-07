<div class="page-wrapper">
                    <div class="content container-fluid">

                        <div class="page-header">
                            <div class="row align-items-center">
                                <div class="col">
                                    <h3 class="page-title">Event Detail</h3>
                                    <ul class="breadcrumb">

                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-body">
                                        <form>
                                            <div class="row">
                                                <div class="col-12">
                                                    <h5 class="form-title"><span>Event Information</span></h5>
                                                </div>
                                            <c:if test="${not empty sessionScope.event}"> 
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Id</label>
                                                        <input type="text" class="form-control" value="${sessionScope.event.getEventID()}" readonly="">
                                                    </div>
                                                </div>

                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Name</label>
                                                        <input type="text" class="form-control" value="${sessionScope.event.getEventName()}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Preparation Time</label>
                                                        <input class="form-control" type="datetime-local" value="${sessionScope.event.getPreparationTime()}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Hold Time</label>
                                                        <input class="form-control" type="datetime-local" value="${sessionScope.event.getHoldTime()}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Location</label>
                                                        <input type="text" class="form-control" value="${sessionScope.event.getLocation()}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Cost</label>
                                                        <input type="number" class="form-control" value="${sessionScope.event.getCost()}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Expected Number</label>
                                                        <input type="number" class="form-control" value="${sessionScope.event.getExpectedNumber()}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Organization</label>
                                                        <input type="text" class="form-control" value="${sessionScope.event.getOrganization()}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Feedback</label>
                                                        <input type="text" class="form-control" value="${sessionScope.event.getFeedback()}" readonly="" >
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Description</label>
                                                        <input type="text" class="form-control" value="${sessionScope.event.getDescription()}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Status</label>
                                                        <c:choose>
                                                            <c:when test="${sessionScope.event.getApprove() eq 'none'}">
                                                                <input class="form-control" value="Waiting" readonly="" >
                                                            </c:when>
                                                            <c:when test="${sessionScope.event.getApprove() eq ' '}">
                                                                <input class="form-control" value="Accepted" readonly="" >
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" value="Rejected" readonly="" >
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>Create By</label>
                                                        <input type="text" class="form-control" value="${sessionScope.event.getCreatedBy()}">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group local-forms">
                                                        <label>End Time</label>
                                                        <input class="form-control" type="datetime-local" value="${sessionScope.event.getEndTime()}">
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <div class="student-submit">
                                                        <button id="update" type="submit" class="btn btn-primary">Update</button>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${empty sessionScope.event}">
                                                <tr>
                                                    <td colspan="7" class="text-center">No events found.</td>
                                                </tr>
                                            </c:if>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>