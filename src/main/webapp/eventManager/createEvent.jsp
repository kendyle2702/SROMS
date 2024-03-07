<div class="page-wrapper">
    <div class="content container-fluid">

        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="page-title">Add Event</h3>                             
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <form action="eventManager" method="post">
                            <div class="row">
                                <div class="col-12">
                                    <h5 class="form-title"><span>Event Information</span></h5>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group">
                                        <label>Event Name <span class="login-danger">*</span></label>
                                        <input id="eventname" name="eventname" type="text" class="form-control" required>
                                    </div>

                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group  calendar-icon">
                                        <label>Preparation Time <span class="login-danger">*</span></label>
                                        <input id="preparetime" name="pretime" class="form-control"  type="datetime-local" placeholder="YYYY-MM-DDTHH:MM" required>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group calendar-icon">
                                        <label>Hole Time <span class="login-danger">*</span></label>
                                        <input id="holetime" name="holetime" class="form-control"  type="datetime-local" placeholder="YYYY-MM-DDTHH:MM" required>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group calendar-icon">
                                        <label>Location <span class="login-danger">*</span></label>
                                        <input id="location" name="location" type="text" class="form-control" required>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group calendar-icon">
                                        <label>Cost<span class="login-danger">*</span></label>
                                        <input id="cost" name="cost" type="number" class="form-control" required>
                                        <p id="costerror" style="color: red"></p>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group">
                                        <label>Expected Number <span class="login-danger">*</span></label>
                                        <input id="exnum" name="exnum" type="number" class="form-control" required>
                                        <p id="exnumerror" style="color: red"></p>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group ">
                                        <label>Organization<span class="login-danger">*</span></label>
                                        <input id="organization" name="organization" type="text" class="form-control" required>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group ">
                                        <label>Description<span class="login-danger">*</span></label>
                                        <input id="description" name="description" type="text" class="form-control" required>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div class="form-group calendar-icon">
                                        <label>End Time <span class="login-danger">*</span></label>
                                        <input id="endtime" name="endtime" class="form-control"  type="datetime-local" placeholder="YYYY-MM-DDTHH:MM" required>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="student-submit">
                                        <input class="btn btn-primary" id="submit" type="submit" value="Submit">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
