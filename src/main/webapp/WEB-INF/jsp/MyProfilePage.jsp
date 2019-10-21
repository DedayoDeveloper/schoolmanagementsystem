<%-- 
    Document   : MyProfilePage
    Created on : Oct 19, 2019, 9:47:43 AM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<div class="card">
    <div class="card-header" align="center">My Profile</div>
    <div class="card-body">
        <div>
            <form action="updateprofile" name="updateprofileform" method="post">
<c:forEach items="${getParentProfile}" var = "getParentProfile">
        <div class="form-group">
            <label>Firstname</label>
            <input type="text" name="firstname" class="form-control" value="${getParentProfile.firstname}">
        </div>

        <div class="form-group">
            <label>Lastname</label>
            <input type="text" name="lastname" class="form-control" value="${getParentProfile.lastname}">
        </div>


        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" class="form-control" value="${getParentProfile.email}">
        </div>


        <div class="form-group">
            <label>Phonenumber</label>
            <input type="text" name="phonenumber" class="form-control" value="${getParentProfile.phonenumber}">
        </div>
       
            </c:forEach>
                <div align="right">
                <button class="btn btn-primary" type="submit"> Save </button>
                </div>
                 </form>
         </div>
        <hr>
        <h4>My Children Registered</h4>
 <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">
                <thead>
                     <tr class="blue-grey white-text">
                        <th>S/N</th> 
                        <th>Firstname</th>                                        
                        <th>Lastname</th>
                        <th>Age</th>
                        <th>Sex</th>
                        
                   
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${getMyChild}" var = "getMyChild" varStatus="status">
                        <tr>
                            <td>
                            ${status.count}
                            </td>
                            <td>${getMyChild.firstname}</td>
                            <td>${getMyChild.lastname}</td>
                            <td>${getMyChild.age}</td>
                            <td>${getMyChild.sex}</td>
                           
                        </tr>
                    </c:forEach>
              
                </tbody>
            </table>
       
        </div>

    </div>
</div>


<script>
    
    
    var createteacherLogin = new Validator('[name="updateprofileform"]', [
        {
            name: 'firstname',
            rules: 'required'
        },
        {
            name: 'lastname',
            rules: 'required'
        },
        {
            name: 'email',
            rules: 'required'
        },
         {
            name: 'phonenumber',
            rules: 'required'
        }], function (errors, event) {
        event.preventDefault();
        console.log(errors);
        var form = $('[name="updateprofileform"]');
        form.find('.is-invalid').removeClass('is-invalid');
        form.find('.errors').remove();
        if (errors.length > 0) {
            errors.forEach(function (elem, index) {
                $(errors[index].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[index].message + '</small>');
                if (index === 0)
                    $(errors[0].element).focus();
            });
        } else {
            form.hide('fast');
            var data = form.serialize();
            $.post(form.attr('action'), data, function (result) {
                if (result === 'success') {
                    form.after('<div class="alert alert-success text-center m-3">Profile updated successfully</div>');
                    setTimeout(function () {
                        form[0].reset();
                        form.next().remove();
                        form.show('fast');
                        $('#result1').html(spinner);
                    var url = 'myprofile';
                    $.get(url,function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
                    }, 3000);
                } else {
                    form.after('<div class="alert alert-danger text-center m-3">' + 'Failed update! Try again' + '</div>');
                    setTimeout(function () {
                        form.next().remove();
                        form.show('fast');
                    }, 3000);
                }
            });
        }
    });
    
    
    
    </script>