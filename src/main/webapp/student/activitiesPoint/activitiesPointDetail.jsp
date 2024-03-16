<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.StudentProfileDAO"%>
<%@page import="DAOs.UserLoginDAO"%>
<%@page import="Models.UserProfile"%>
<div class="page-wrapper" style="min-height: 471px;">
    <div class="content container-fluid">

        <div class="row justify-content-center">
            <div class="col-xl-10">
                <div class="card invoice-info-card">
                    <div class="card-body">
                        <div class="invoice-item invoice-item-one">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="invoice-head text-center">
                                        <h2>Activities Point</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            UserProfile userPro = (UserProfile) session.getAttribute("user");
                            UserLoginDAO userLoginDAO = new UserLoginDAO();
                            int studentProfileID = userLoginDAO.getStudentProfileIDByUserProfileID(userPro.getUserProfileID());

                            StudentProfileDAO stDAO = new StudentProfileDAO();
                            ResultSet rs = stDAO.getStudentProfileMoreByID(studentProfileID);
                            while (rs.next()) {
                        %>
                        <div class="invoice-item invoice-item-two">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="invoice-info">
                                        <p>Full Name: <b><%=rs.getString("LastName") + " " + rs.getString("FirstName")%></b></p> 
                                        <p>Student Roll number: <b><%=rs.getString("RollNumber")%></b></p> 
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group local-forms">
                                        <%String semesterIDString = (String) session.getAttribute("semesterIDStudentScore");%>
                                        <label>Select Semester</label>
                                        <select id="selectSemester" class="form-select form-control select" name="semesterID">
                                            <option value="10" <%=semesterIDString.equals("10") ? "selected" : ""%> >Spring 2024</option>
                                            <option value="9" <%=semesterIDString.equals("9") ? "selected" : ""%>>Fall 2023</option>
                                            <option value="8" <%=semesterIDString.equals("8") ? "selected" : ""%>>Summer 2023</option>
                                            <option value="7" <%=semesterIDString.equals("7") ? "selected" : ""%>>Spring 2023</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <%}
                        %>


                        <div class="invoice-issues-box">
                            <div class="row">
                                <div class="col-lg-4 col-md-4">
                                    <div class="invoice-issues-date">
                                        <p>Issue Date : 27 Jul 2022</p>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="invoice-issues-date">
                                        <p>Due Date : 27 Aug 2022</p>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="invoice-issues-date">
                                        <p>Due Amount : ? 1,54,22 </p>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="invoice-item invoice-table-wrap">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="table-responsive">
                                        <table class="invoice-table table table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Description</th>
                                                    <th>Category</th>
                                                    <th>Rate/Item</th>
                                                    <th>Quantity</th>
                                                    <th>Discount (%)</th>
                                                    <th class="text-end">Amount</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Dell Laptop</td>
                                                    <td>Laptop</td>
                                                    <td>$1,110</td>
                                                    <th>2</th>
                                                    <th>2%</th>
                                                    <td class="text-end">$400</td>
                                                </tr>
                                                <tr>
                                                    <td>HP Laptop</td>
                                                    <td>Laptop</td>
                                                    <td>$1,500</td>
                                                    <th>3</th>
                                                    <th>6%</th>
                                                    <td class="text-end">$3,000</td>
                                                </tr>
                                                <tr>
                                                    <td>Apple Ipad</td>
                                                    <td>Ipad</td>
                                                    <td>$11,500</td>
                                                    <th>1</th>
                                                    <th>10%</th>
                                                    <td class="text-end">$11,000</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row align-items-center justify-content-center">
                            <div class="col-lg-6 col-md-6">
                                <div class="invoice-terms">
                                    <h6>Notes:</h6>
                                    <p class="mb-0">Enter customer notes or any other details</p>
                                </div>
                                <div class="invoice-terms">
                                    <h6>Terms and Conditions:</h6>
                                    <p class="mb-0">Enter customer notes or any other details</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="invoice-total-card">
                                    <div class="invoice-total-box">
                                        <div class="invoice-total-inner">
                                            <p>Taxable <span>$6,660.00</span></p>
                                            <p>Additional Charges <span>$6,660.00</span></p>
                                            <p>Discount <span>$3,300.00</span></p>
                                            <p class="mb-0">Sub total <span>$3,300.00</span></p>
                                        </div>
                                        <div class="invoice-total-footer">
                                            <h4>Total Amount <span>$143,300.00</span></h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="invoice-sign text-end">
                            <img class="img-fluid d-inline-block" src="assets/img/signature.png" alt="sign">
                            <span class="d-block">Harristemp</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>