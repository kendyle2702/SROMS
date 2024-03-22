
<div class="page-wrapper">
    <div class="content container-fluid">
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm-12">
                    <div class="page-sub-header">
                        <h3 class="page-title">Create Event</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Student</a></li>
                            <li class="breadcrumb-item"><a href="/student/clubs/view">View Club</a></li>
                            <li class="breadcrumb-item"><a href="/student/clubs/viewClubMember/${sessionScope.clubId}">View Member Club</a></li>
                            <li class="breadcrumb-item active"><a href="#">Create Event</a></li>
                        </ul>
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
                                   aria-selected="true" role="tab">Create Competition</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" data-bs-toggle="tab" href="#per_details_tab" aria-selected="false"
                                   role="tab" tabindex="-1">Create Talkshow And Soft Skills</a>
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
                                                <span>Create Talkshow And Soft Skills</span>
                                            </h5>
                                            <form action="/student" method="post" id="createEvent">
                                                <div class="row">
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Event Name<span class="login-danger">*</span></label>
                                                            <input id="eventname" name="eventname" type="text"
                                                                   class="form-control" placeholder="Enter event name">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Preparation Time <span
                                                                    class="login-danger">*</span></label>
                                                            <input id="preparetime" name="pretime" class="form-control"
                                                                   type="datetime-local" placeholder="YYYY-MM-DDTHH:MM"
                                                                   >
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Start Time <span class="login-danger">*</span></label>
                                                            <input id="holdtime" name="holetime" class="form-control"
                                                                   type="datetime-local" placeholder="YYYY-MM-DDTHH:MM"
                                                                   >
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>End Time <span class="login-danger">*</span></label>
                                                            <input id="endtime" name="endtime" class="form-control"
                                                                   type="datetime-local" placeholder="YYYY-MM-DDTHH:MM"
                                                                   >
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Location <span class="login-danger">*</span></label>
                                                            <input id="location" name="location" type="text"
                                                                   class="form-control" placeholder="Enter location">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Cost<span class="login-danger">*</span></label>
                                                            <input id="cost" name="cost" type="number"
                                                                   class="form-control" placeholder="Enter cost">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group">
                                                            <label>Expected Number <span
                                                                    class="login-danger">*</span></label>
                                                            <input id="exnum" name="exnum" type="number"
                                                                   class="form-control" placeholder="Enter expected number">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group ">
                                                            <label>Organization<span
                                                                    class="login-danger">*</span></label>
                                                            <input id="organization" name="organization" type="text"
                                                                   class="form-control" placeholder="Enter organization">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group ">
                                                            <label>Feedback<span class="login-danger">*</span></label>
                                                            <input id="feedback" name="feedback" type="text"
                                                                   class="form-control" placeholder="Enter feedback">
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>                                                   
                                                    <div class="col-12 col-sm-4">
                                                        <div class="form-group ">
                                                            <label>Event Category<span
                                                                    class="login-danger">*</span></label>
                                                            <br>
                                                            <select id="typeOfEvent" name="catelogyEvent" class="form-control">
                                                                <option value="Soft Skills">Soft Skills</option>
                                                                <option value="TalkShow">TalkShow</option>                                                            
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-sm-8">
                                                        <div class="form-group ">
                                                            <label>Description<span
                                                                    class="login-danger">*</span></label>
                                                            <textarea id="description" name="description" type="text"
                                                                      class="form-control" placeholder="Enter description"></textarea>
                                                            <div class="message"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="student-submit">
                                                        <input style="background: #ea7127;border-color:#ea7127;" name="createEventClub" class="btn btn-primary" id="submit"
                                                               type="submit" value="Submit">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
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
                                        <form action="/student" method="post"  id="createCompatition">
                                            <div class="row">
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group">
                                                        <label>Event Name<span class="login-danger">*</span></label>
                                                        <input  id="eventname" name="eventname" type="text"
                                                                class="form-control" placeholder="Enter event name">
                                                        <div class="message"></div>
                                                    </div>

                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group">
                                                        <label>Preparation Time <span
                                                                class="login-danger">*</span></label>
                                                        <input id="preparetime" name="pretime" class="form-control"
                                                               type="datetime-local" placeholder="YYYY-MM-DDTHH:MM"
                                                               >
                                                        <div class="message"></div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group">
                                                        <label>Start Time <span class="login-danger">*</span></label>
                                                        <input id="holdtime" name="holetime" class="form-control"
                                                               type="datetime-local" placeholder="YYYY-MM-DDTHH:MM"
                                                               >
                                                        <div class="message"></div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group">
                                                        <label>Location <span class="login-danger">*</span></label>
                                                        <input id="location" name="location" type="text"
                                                               class="form-control" placeholder="Enter location">
                                                        <div class="message"></div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group">
                                                        <label>Cost<span class="login-danger">*</span></label>
                                                        <input id="cost" name="cost" type="number"
                                                               class="form-control" placeholder="Enter cost">
                                                        <div class="message"></div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group">
                                                        <label>Expected Number <span
                                                                class="login-danger">*</span></label>
                                                        <input id="exnum" name="exnum" type="number"
                                                               class="form-control" placeholder="Enter expected number join">
                                                        <div class="message"></div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group ">
                                                        <label>Organization<span
                                                                class="login-danger">*</span></label>
                                                        <input id="organization" name="organization" type="text"
                                                               class="form-control" placeholder="Enter organization">
                                                        <div class="message"></div>
                                                    </div>
                                                </div>

                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group ">
                                                        <label>Feedback<span class="login-danger">*</span></label>
                                                        <input id="feedback" name="feedback" type="text"
                                                               class="form-control" placeholder="Enter link feedback">
                                                        <div class="message"></div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group">
                                                        <label>End Time <span class="login-danger">*</span></label>
                                                        <input id="endtime" name="endtime" class="form-control"
                                                               type="datetime-local" placeholder="YYYY-MM-DDTHH:MM"
                                                               >
                                                        <div class="message"></div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-4">
                                                    <div class="form-group ">
                                                        <label>Description<span
                                                                class="login-danger">*</span></label>
                                                        <textarea id="description" name="description" class="form-control" placeholder="Enter description"  rows="10"></textarea>
                                                        <div class="message"></div>
                                                    </div>
                                                </div>
                                                <div style="border: solid 1px grey; border-radius: 5px;margin-top: 32px;" class="col-lg-8 col-sm-8">
                                                    <label>Prize Structure<span
                                                            class="login-danger">*</span></label>
                                                    <div class="row">
                                                        <div class="col-lg-6 col-sm-6">
                                                            <div class="form-group ">
                                                                <div>
                                                                    <label>First<span
                                                                            class="login-danger">*</span></label>
                                                                    <input id="firtPrize" name="firtPrize" type="number"
                                                                           class="form-control" placeholder="Enter number first prize">
                                                                    <div class="message"></div>
                                                                </div>
                                                                <div>
                                                                    <label>Second<span
                                                                            class="login-danger">*</span></label>
                                                                    <input id="secondPrize" name="secondPrize" type="number"
                                                                           class="form-control" placeholder="Enter number second prize" ><!-- comment -->
                                                                    <div class="message"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-sm-6">
                                                            <div class="form-group ">
                                                                <div>
                                                                    <label>Third<span
                                                                            class="login-danger">*</span></label>
                                                                    <input id="thirdPrize" name="thirdPrize" type="number"
                                                                           class="form-control" placeholder="Enter number third prize">
                                                                    <div class="message"></div>
                                                                </div>
                                                                <div>
                                                                    <label>Encouragement<span
                                                                            class="login-danger">*</span></label>
                                                                    <input id="encouragementPrize" name="encouragementPrize" type="number"
                                                                           class="form-control" placeholder="Enter number encouragement">
                                                                    <div class="message"></div> 
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="student-submit">
                                                    <input style="background: #ea7127;border-color:#ea7127;" name="createCompatitionClub" class="btn btn-primary" id="submit"
                                                           type="submit" value="Submit">
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
