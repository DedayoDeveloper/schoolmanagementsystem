<%-- 
    Document   : login
    Created on : Feb 6, 2018, 2:18:08 PM
    Author     : Supersoft Technology
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*, javax.naming.*, javax.sql.DataSource,java.util.*"  session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Expires" content="0" />
       <title>${title}</title>
        <script src="<spring:url value="/resources/js/jquery.js"/>"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Roboto|Montserrat:900" rel="stylesheet"/>
        <link rel="stylesheet" href="<spring:url value="/resources/css/bootstrap.min.css"/>"/>
        <link rel="stylesheet" href="<spring:url value="/resources/css/mdb.min.css"/>"/>
        <link rel="stylesheet" href="<spring:url value="/resources/css/style.css"/>"/>
        <link rel="stylesheet" href="<spring:url value="/resources/css/font-awesome.min.css"/>"/>
        <link rel="stylesheet" href="<spring:url value="/resources/css/animate.min.css"/>"/>
        <link href="<spring:url value="/resources/css/custom.css"/>" rel="stylesheet" />
        <script src="<spring:url value="/resources/js/popper.min.js"/>"></script>
        <script src="<spring:url value="/resources/js/bootstrap.min.js"/>"></script>
        <link href="<spring:url value="/resources/css/dropzone.css"/>" rel="stylesheet" />
        <link rel="stylesheet" href="<spring:url value="/resources/css/font-awesome.css"/>"/>
        <script src="<spring:url value="/resources/js/validator.js"/>"></script>
        <script src="<spring:url value="/resources/js/users.js"/>"></script>
        <script src="<spring:url value="/resources/js/jquery-ui.js"/>"></script>
        <script src="<spring:url value="/resources/js/validate.min.js"/>"></script>
        <link href="<spring:url value="/resources/font11/roboto/roboto-regular.woff2"/>" />

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
<!--        <link href="<spring:url value="/resources/css/custom2.css"/>" rel="stylesheet" />-->
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
        
     

        <style>
            #modelhead {
                color:  #3333ff;
                background-color: #fff;
                border-color: #007bff;
            }
              #modelhead2 {
                color:  #3333ff;
                background-color: #fff;
                border-color: #007bff;
            }
        </style>

    </head>
    <body> 
        <div id="fb-root"></div>
        <script>(function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));



            var spinner = `<div class="text-center p-5"><i class="fa fa-spinner fa-spin" aria-hidden="true" style="font-size:100px;"></i></div>`;
        </script>


        <section>
            <div  id="intro_index">
                <div class="" style="width: 100%">
                    <div class="bg-primary">
                        <nav class="navbar navbar-expand-lg navbar-light" style="padding:0px 20px !important; margin :0 !important;">
                    <!--<a class="navbar-brand" href="index"><img  src="<spring:url value="/resources/imgs/"/>" ></a>-->
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarSupportedContent" style="padding:0px 20px !important; margin :0 !important;">



                            </div>
                        </nav>

                    </div>
                </div>
                            
                            

                    

                <div class="row d-flex justify-content-center text-center">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-4">
                                <!--                               <h3 class="white-text">Terminal management becomes easier</h3>
                                                               <p class="white-text mb-2">TAMS</p>-->
                            </div>
                            <!-- home content -->
                            <div class="home-content">
                                <div class="col-md-6">


                                    <h1 class="white-text center-align" >School Management System</h1>
                                    
                                    
                                    
                                    
                                    <div>
                                        <p style=" color: white;">
                                    ${error}
                                        </p>
                                    
                                        </div>
                                        
                                        
                                        
                                        
                                    <div>
                                        <a type="button" class="btn btn-primary" data-target="#Login_form_signin" data-toggle="modal">Login <i class="fa fa-sign-in m-1"></i></a>

                                            <br/>

                                        <a type="button" class="btn btn-primary" data-target="#register_form_signin" data-toggle="modal">Register Guardian/Parent<i class="fa fa-sign-in m-1"></i></a>
                                    </div>
                                </div>


                            </div>
                            <!-- /home content -->

                        </div>
                    </div>
                </div>

            </div>

            <div id="display_resultRep"> </div>
            <div id="resultspinner"> </div>


            <!--</div>-->
        </section>


        <div class="modal fade" id="Login_form_signin"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog centered" role="document">
                <div class="modal-content" id="modalhomepage">

                    <div class="modal-header" id="modelhead">
                        <h5 class="modal-title" id="exampleModalLabel">Sign in</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="signin" method="post" name="signInForm">
                        <div class="modal-body col-12" align="center">

<!--                            <div class="form-group">
                                <select class="form-control" style=" text-justify:  auto; color:  #001311;">
                                    <option selected>Select User...</option> 
                                    <option value="teacher">Teacher</option>
                                    <option value="parent">Parent</option>

                                </select>
                            </div>-->
                            <div class="form-group" style=" color: white;">
                                <label>Username</label>
                                <input type="text" name="username" placeholder="Username" class="form-control">
                            </div>
                            <div class="form-group" style=" color: white;">
                                <label>Password</label>
                                <input type="password" name="password" placeholder="Password" class="form-control">
                                <br/>
                                <a href="forgotpassword" style=" color: white;">Forgot Password</a>
                            </div>



                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger closeModal_approve"  data-dismiss="modal">Cancel</button>
                            <button id="resettable" class="btn btn-primary" type="submit" >Login</button>
                                 

                        </div>
                    </form>
                </div>
            </div>
        </div>




        <div class="modal fade" id="register_form_signin"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog centered" role="document">
                <div class="modal-content" id="modalhomepage">

                    <div>
<!--                        <h5 class="modal-title" id="modeltitlehead">Register Parent/Guardian User</h5>-->
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="registerparentuser" method='post' name="form_reg_user" id="form_reg_user">
                        <div class="modal-body col-12" align="center">


                            <div class="form-group" style=" color: white;">
                                <label>Firstname</label>
                                <input type="text" name="firstname" placeholder="Firstname" class="form-control">
                            </div>
                            <div class="form-group" style=" color: white;">
                                <label>Lastname</label>
                                <input type="text" name="lastname" placeholder="Lastname" class="form-control">
                            </div>
                            <div class="form-group" style=" color: white;">
                                <label>Username</label>
                                <input type="text" name="username" placeholder="Username" class="form-control">
                            </div>
                            <div class="form-group" style=" color: white;">
                                <label>Email</label>
                                <input type="email" name="email" placeholder="Email" class="form-control">
                            </div>
                            <div class="form-group" style=" color: white;">
                                <label>Phonenumber</label>
                                <input type="number" name="phonenumber" placeholder="Phonenumber" class="form-control">
                            </div>
                            <div class="form-group" style=" color: white;">
                                <label>Password</label>
                                <input type="password" name="password" placeholder="Password" class="form-control">
                            </div>
                            <div class="form-group" style=" color: white;">
                                <label>Confirm Password</label>
                                <input type="password" name="confirmpassword"  class="form-control">
                            </div>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger closeModal_approve"  data-dismiss="modal">Cancel</button>
                            <button class="btn btn-primary" type="submit" id="loginPass">Register</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>

        <footer>
        </footer>
        <script>
            // FORM VALIDATOR ENGINE
            var validate = new FormValidator('form_reg_user', [
                {
                    name: 'firstname',
                    rules: 'required'
                },
                {
                    name: 'lastname',
                    rules: 'required'
                },
                {
                    name: 'username',
                    rules: 'required'
                },
                {
                    name: 'email',
                    rules: 'required'
                },
                {
                    name: 'phonenumber',
                    rules: 'required'
                },
                {
                    name: 'password',
                    rules: 'required'
                },
                {
                    name: 'confirmpassword',
                    rules: 'required|matches(password)'
                }], function (errors, event) {
                event.preventDefault();
                console.log(errors);
                if (errors.length > 0) {
                    //Form validation Failled
                    // Do nothing
                    var form = $('[name=form_reg_user]');
                    form.find('.is-invalid').removeClass('is-invalid');
                    form.find('.errors').remove();
                    $(errors[0].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[0].message + '</small>');
                    $(errors[0].element)[0].focus();
                    console.log('error');
                } else {
                    //Form validation Passed
                    var form = $('[name=form_reg_user]');
                    form.find('.is-invalid').removeClass('is-invalid');
                    form.find('.errors').remove();
                    console.log('worked');
                    var data = form.serialize();
                    console.log(data);
                    form.hide('fast');
                    $.post(form.attr('action'), data, function (result) {
                        if (result === 'GUARDIAN SUCCESSFULLY CREATED') {

                            
                             $('#modelhead').modal('hide');
                            form.after('<div class="alert alert-success text-center m-3">GUARDIAN SUCCESSFULLY CREATED</div>');
                            setTimeout(function () {
                                form[0].reset();
                                form.next().remove();
                                form.show('fast');
                                $('#register_form_signin').modal('hide');
                                setTimeout(function () {
                                    goTo('landingpage');
                                }, 1000);
                            }, 3000);
                        } else {
                            form.after('<div class="alert alert-danger text-center m-3">' + 'Failed! Try again' + '</div>');
                            form.show('fast');
                        }
                    });
                }
            });



        </script>
        <script>
            $(document).on('click', '#loginPass', function () {
                 hiddenDiv.style.display = 'none';
            });

        </script>
    </body>
</html>
