<%@page import="Models.Event"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.EventDAO"%>
<%@page import="DAOs.EventDAO"%>
<div class="page-wrapper">
    <div class="content container-fluid">
        <div class="row justify-content-center">
            <div class="col-xl-10">
                <form action="/student" method="post">
                    <div class="card invoice-info-card">
                        <div class="card-body">
                            <div class="invoice-item invoice-item-one">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="invoice-logo">
                                            <!-- add logo -->
                                        </div>
                                        <div class="invoice-head">
                                            <h2>Club Detail</h2>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="invoice-info">
                                            <p class="invoice-details">
                                                Establish Date:<br>
                                                ${club.getEstablishDate()}<br>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="invoice-table table table-center mb-0">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <table class="invoice-table table table-center">
                                                <thead>
                                                    <tr>
                                                        <th>Club Name</th>
                                                        <th>Description</th>
                                                        <th></th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>${club.getClubName()}</td>
                                                        <td style="white-space: break-spaces;">${club.getDescription()}</td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="student-submit text-end">
                                <input type="hidden" name="ClubID" value="${club.getClubID()}">
                                <input type="hidden" name="studentProfileID" value="${studentProfileID}">
                                <input style="background: #ea7127;border-color:#ea7127" type="submit" name="action" class="btn btn-primary" value="Register">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>