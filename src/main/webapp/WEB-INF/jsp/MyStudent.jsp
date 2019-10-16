<%-- 
    Document   : MyStudent
    Created on : Oct 16, 2019, 10:36:22 AM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="card">
    <div class="card-header" align="center">TEACHER MANAGEMENT</div>
    <div class="card-body">



<button data-target="#addChildStudent" data-toggle="modal" type="button" class="btn btn-primary link">Register My Child</button>
    <div id="addChildStudent" class="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Register Child</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="addmychild" method="post" name="addnewchildtoparent" id="addnewchildtoparent">
                            <div class="modal-body">
                                <div class="form-group" style=" color: white;">
                                    <!--<label id="addstudentstyle">Firstname</label>-->
                                    <input type="text" name="firstname" placeholder="Firstname" class="form-control">
                                </div>
                                <div class="form-group" style=" color: white;">
                                    <!--<label id="addstudentstyle">Lastname</label>-->
                                    <input type="text" name="lastname" placeholder="Lastname" class="form-control">
                                </div>
                                    <div class="form-group" style=" color: white;">
                                    <!--<label id="addstudentstyle">Student Number</label>-->
                                    <input type="text" name="age" placeholder="Age" class="form-control">
                                </div>
                              
                                <div class="form-group" style=" color: white;">
                                    <select class="custom-select" name="sex">
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                    </select>
                                </div>
                             
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger closeModal_approve"  data-dismiss="modal">Cancel</button>
                                <button class="btn btn-primary" type="submit">Register</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>








<div class="dataTable">
            <table id="myDataTable" class="table table-striped" cellspacing="0" width="100%" align="center">
                <thead>
                    <tr>
                    
                        <th>Firstname</th>                                        
                        <th>Lastname</th>
                        <th>Age</th>
                        <th>Sex</th>
                        <th></th>
                        <th></th>
                   
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${getMyChild}" var = "getMyChild">
                        <tr>
                        
                            <td>${getMyChild.firstname}</td>
                            <td>${getMyChild.lastname}</td>
                            <td>${getMyChild.age}</td>
                            <td>${getMyChild.sex}</td>
                            <td><a href="seerecords/${getMyChild.firstname}/${getMyChild.lastname}/${getMyChild.sex}" class="btn btn-primary link"> View Results</a></td>
                            <td><a href="getStudentDetails/${getMyChild.firstname}/${getMyChild.lastname}/${getMyChild.sex}" class="btn btn-primary link"> View Attendance</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>





    </div>
</div>






<!--

 <div id="viewresult" class="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Supply Username and Password To View Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="addmychild" method="post" name="addnewchildtoparent" id="addnewchildtoparent">
                            <div class="modal-body">
                                <div class="form-group" style=" color: white;">
                                    <label id="addstudentstyle">Firstname</label>
                                    <input type="text" name="username" placeholder="Username" class="form-control">
                                </div>
                                <div class="form-group" style=" color: white;">
                                    <label id="addstudentstyle">Lastname</label>
                                    <input type="password" name="password" placeholder="Password" class="form-control">
                                </div>
                                   
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger closeModal_approve"  data-dismiss="modal">Cancel</button>
                                <button class="btn btn-primary" type="submit">Enter</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>






<div id="viewattendance" class="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Supply Username and Password To View Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="addmychild" method="post" name="addnewchildtoparent" id="addnewchildtoparent">
                            <div class="modal-body">
                                <div class="form-group" style=" color: white;">
                                    <label id="addstudentstyle">Firstname</label>
                                    <input type="text" name="username" placeholder="Username" class="form-control">
                                </div>
                                <div class="form-group" style=" color: white;">
                                    <label id="addstudentstyle">Lastname</label>
                                    <input type="password" name="password" placeholder="Password" class="form-control">
                                </div>
                                   
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger closeModal_approve"  data-dismiss="modal">Cancel</button>
                                <button class="btn btn-primary" type="submit">Enter</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>-->