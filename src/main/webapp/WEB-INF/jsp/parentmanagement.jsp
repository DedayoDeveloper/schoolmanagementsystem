<%-- 
    Document   : parentmanagement
    Created on : Oct 9, 2019, 8:40:06 AM
    Author     : oreoluwa
--%>



<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<div class="card">
    <div class="card-header" align="center">MANAGE PARENTS</div>
    <div class="card-body">
        <div class="row"> 
            <div class="col-md-4 mr-auto">
                <button class="btn btn-danger" data-target="#ask_before_delete" data-toggle="modal" type="button" >- Delete Parent</button>
                <div id="ask_before_delete" class="modal" tabindex="-1" role="dialog" aria-labelledby="approvePaymentLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Warning!</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p class="mb-0">Do you want to delete this parent user?</p>
                                <div id="deleteMerchantRequest"></div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-dark closeModal_approve" data-dismiss="modal">No</button>
                                <button class="btn btn-primary merchantDeleteRequestButton" type="submit">Yes</button>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        
        <hr>
        
        <div>
            <div class="col-md-12">
                <form action="searchparentforadmin" method="post">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="inputGroupSelect01">Search</label>
                        </div>
                        <input type="text" class="form-control" placeholder="Enter Parent Email" name="email">
                        <div class="input-group-append">
                            <button class="btn btn-outline-primary btn-sm" id = "searchstudentforteacher" type="submit">Search</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <p class="col-md-8" style="margin-top: 10px;">
            ${pagination} 
        </p>    

        <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">
                <thead>
                    <tr class="blue-grey white-text">
                        <th><input type="checkbox" class="masterCheck"></th> 
                        <th>S/N</th>
                        <th>Firstname</th>                                        
                        <th>Lastname</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Phonenumber</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${getAllParentUsers}" var = "getAllParentUsers" varStatus="status">
                        <tr>
                            <td>
                                <input type="checkbox" class="parentstudentcollectionBox" value="${getAllParentUsers.id}">  
                                <input type="hidden" value="${getAllParentUsers.id}">
                            </td>
                            <td>${status.count}</td>
                            <td>${getAllParentUsers.firstname}</td>
                            <td>${getAllParentUsers.lastname}</td>
                            <td>${getAllParentUsers.username}</td>
                            <td>${getAllParentUsers.email}</td>
                            <td>${getAllParentUsers.phonenumber}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>






    </div>
</div>

