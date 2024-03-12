<div class="page-wrapper">
    <div class="content container-fluid">
        <div class="row">
            <div class="page-header">
                <div class="row align-items-center">
                    <div class="col">
                        <h3 class="page-title">Add Event</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="content container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="profile-menu">
                        <ul class="nav nav-tabs nav-tabs-solid" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" data-bs-toggle="tab" href="#password_tab"
                                   aria-selected="true" role="tab">Create Compatition</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" data-bs-toggle="tab" href="#per_details_tab" aria-selected="false"
                                   role="tab" tabindex="-1">Create TalkShow And SoftSkill</a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content profile-tab-cont">

                        <div class="tab-pane fade" id="per_details_tab" role="tabpanel">

                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title d-flex justify-content-between">
                                                <span>Event Information</span>

                                            </h5>
                                            <form action="eventmanager" method="post">
                                                <div class="row">

                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Event Name<span class="login-danger">*</span></label>
                                                            <input id="eventname" name="eventname" type="text"
                                                                   class="form-control" required>
                                                        </div>

                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Preparation Time <span
                                                                    class="login-danger">*</span></label>
                                                            <input id="preparetime" name="pretime" class="form-control"
                                                                   type="datetime-local" placeholder="YYYY-MM-DDTHH:MM"
                                                                   required>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Hole Time <span class="login-danger">*</span></label>
                                                            <input id="holetime" name="holetime" class="form-control"
                                                                   type="datetime-local" placeholder="YYYY-MM-DDTHH:MM"
                                                                   required>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Location <span class="login-danger">*</span></label>
                                                            <input id="location" name="location" type="text"
                                                                   class="form-control" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Cost<span class="login-danger">*</span></label>
                                                            <input id="cost" name="cost" type="number"
                                                                   class="form-control" required>
                                                            <p id="costerror" style="color: red"></p>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Expected Number <span
                                                                    class="login-danger">*</span></label>
                                                            <input id="exnum" name="exnum" type="number"
                                                                   class="form-control" required>
                                                            <p id="exnumerror" style="color: red"></p>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group ">
                                                            <label>Organization<span
                                                                    class="login-danger">*</span></label>
                                                            <input id="organization" name="organization" type="text"
                                                                   class="form-control" required>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group ">
                                                            <label>Feedback<span class="login-danger">*</span></label>
                                                            <input id="feedback" name="feedback" type="text"
                                                                   class="form-control" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>End Time <span class="login-danger">*</span></label>
                                                            <input id="endtime" name="endtime" class="form-control"
                                                                   type="datetime-local" placeholder="YYYY-MM-DDTHH:MM"
                                                                   required>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group ">
                                                            <label>Organization<span
                                                                    class="login-danger">*</span></label>
                                                            <br>
                                                            <select name="catelogyEvent" class="form-control">
                                                                <option value="Soft Skills">Soft Skills</option>
                                                                <option value="TalkShow">TalkShow</option>                                                            
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group ">
                                                            <label>Description<span
                                                                    class="login-danger">*</span></label>
                                                            <textarea id="description" name="description" type="text"
                                                                      class="form-control" required></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="student-submit">
                                                            <input name="createEvent" class="btn btn-primary" id="submit"
                                                                   type="submit" value="Submit">
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>


                        <div id="password_tab" class="tab-pane fade active show" role="tabpanel">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Creat Compatition</h5>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <form action="eventmanager" method="post">
                                                <div class="row">

                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Event Name<span class="login-danger">*</span></label>
                                                            <input id="eventname" name="eventname" type="text"
                                                                   class="form-control" required>
                                                        </div>

                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Preparation Time <span
                                                                    class="login-danger">*</span></label>
                                                            <input id="preparetime" name="pretime" class="form-control"
                                                                   type="datetime-local" placeholder="YYYY-MM-DDTHH:MM"
                                                                   required>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Hole Time <span class="login-danger">*</span></label>
                                                            <input id="holetime" name="holetime" class="form-control"
                                                                   type="datetime-local" placeholder="YYYY-MM-DDTHH:MM"
                                                                   required>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Location <span class="login-danger">*</span></label>
                                                            <input id="location" name="location" type="text"
                                                                   class="form-control" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Cost<span class="login-danger">*</span></label>
                                                            <input id="cost" name="cost" type="number"
                                                                   class="form-control" required>
                                                            <p id="costerror" style="color: red"></p>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Expected Number <span
                                                                    class="login-danger">*</span></label>
                                                            <input id="exnum" name="exnum" type="number"
                                                                   class="form-control" required>
                                                            <p id="exnumerror" style="color: red"></p>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group ">
                                                            <label>Organization<span
                                                                    class="login-danger">*</span></label>
                                                            <input id="organization" name="organization" type="text"
                                                                   class="form-control" required>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group ">
                                                            <label>Feedback<span class="login-danger">*</span></label>
                                                            <input id="feedback" name="feedback" type="text"
                                                                   class="form-control" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>End Time <span class="login-danger">*</span></label>
                                                            <input id="endtime" name="endtime" class="form-control"
                                                                   type="datetime-local" placeholder="YYYY-MM-DDTHH:MM"
                                                                   required>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group ">
                                                            <label>Description<span
                                                                    class="login-danger">*</span></label>
                                                            <textarea id="description" name="description" class="form-control" required rows="10"></textarea>
                                                        </div>
                                                    </div>
                                                    <div style="border: solid 1px grey; border-radius: 5px;margin-top: 32px;" class="col-12 col-sm-4">
                                                        <label>PrizeStructure<span
                                                                class="login-danger">*</span></label>
                                                        <div class="form-group ">

                                                            <label>Firt<span
                                                                    class="login-danger">*</span></label>
                                                            <input id="" name="firtPrize" type="number"
                                                                   class="form-control" required>
                                                            <label>Second<span
                                                                    class="login-danger">*</span></label>
                                                            <input id="" name="secondPrize" type="number"
                                                                   class="form-control" required><!-- comment -->
                                                            <label>Third<span
                                                                    class="login-danger">*</span></label>
                                                            <input id="" name="thirdPrize" type="number"
                                                                   class="form-control" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="student-submit">
                                                            <input name="createCompatition" class="btn btn-primary" id="submit"
                                                                   type="submit" value="Submit">
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
                </div>
            </div>
        </div>
    </div>
</div>