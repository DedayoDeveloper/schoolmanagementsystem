<%-- 
    Document   : index
    Created on : Nov 25, 2017, 4:19:41 PM
    Author     : ajibade
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head> 
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<spring:url value="/resources/css/bootstrap.min.css"/>"/>
        <link rel="stylesheet" href="<spring:url value="/resources/css/mdb.min.css"/>"/>
         <link rel="stylesheet" href="<spring:url value="/resources/css/mdb.css"/>"/>
          <link rel="stylesheet" href="<spring:url value="/resources/css/bootstrap.css"/>"/>
          <link rel="stylesheet" href="<spring:url value="/resources/css/mdb.lite.css"/>"/>
                   <title>${title}</title>
        <script src="<spring:url value="/resources/js/jquery.js"/>"></script>
        <script src="<spring:url value="/resources/js/popper.min.js"/>"></script>
        <script src="<spring:url value="/resources/js/bootstrap.min.js"/>"></script>
        <link href="<spring:url value="/resources/css/dropzone.css"/>" rel="stylesheet" />
        <link rel="stylesheet" href="<spring:url value="/resources/css/font-awesome.min.css"/>"/>
        <link rel="stylesheet" href="<spring:url value="/resources/css/font-awesome.css"/>"/>
        <link href="<spring:url value="/resources/css/custom.css"/>" rel="stylesheet" />
<!--        <link rel="icon" href="<spring:url value="/resources/imgs/TamsLogo.png"/>" type="image/png"/>-->
        <script src="<spring:url value="/resources/js/validator.js"/>"></script>
        <script src="<spring:url value="/resources/js/vkeypad.js"/>"></script>
        <script src="<spring:url value="/resources/js/viewPayments.js"/>"></script>
        <script src="<spring:url value="/resources/js/billsPayment.js"/>"></script>
        <script src="<spring:url value="/resources/js/bulkpay.js"/>"></script>
        <script src="<spring:url value="/resources/js/vend.js"/>"></script>
        <script src="<spring:url value="/resources/js/users.js"/>"></script>
        <script src="<spring:url value="/resources/js/changePassword.js"/>"></script>
        <script src="<spring:url value="/resources/js/changeToken.js"/>"></script>
        <!--<script src="<spring:url value="/resources/js/wallet.js"/>"></script>-->
        <script src="<spring:url value="/resources/js/institutions.js"/>"></script>
        <script src="<spring:url value="/resources/js/incidence.js"/>"></script>
        <script src="<spring:url value="/resources/js/resetPassword.js"/>"></script>
        <script src="<spring:url value="/resources/js/fundTransfer.js"/>"></script>
        <script src="<spring:url value="/resources/js/userTypes.js"/>"></script>
        <script src="<spring:url value="/resources/js/pages.js"/>"></script>
        <script src="<spring:url value="/resources/js/addApprover.js"/>"></script>
        <script src="<spring:url value="/resources/js/biller.js"/>"></script>
        <script src="<spring:url value="/resources/js/terminalreports.js"/>"></script>
        <script src="<spring:url value="/resources/js/jquery-ui.js"/>"></script>
        
        
        
        <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/styles/bootstrap4/bootstrap.min.css"/>">
<link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<spring:url value="/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css"/>">
<link rel="stylesheet" type="text/css" href="<spring:url value="/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css"/>">
<link rel="stylesheet" type="text/css" href="<spring:url value="/resources/plugins/OwlCarousel2-2.2.1/animate.css"/>">
<link rel="stylesheet" type="text/css" href="<spring:url value="/resources/styles/main_styles.css"/>">
<link rel="stylesheet" type="text/css" href="<spring:url value="/resources/styles/responsive.css" />" >
        <title>${title}</title>
        <style>
            /* The side navigation menu */



.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s
}

.sidenav a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

#main {
    transition: margin-left .5s;
    padding: 16px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}




#container{
	padding: 2px 16px;
}

@keyframes slider{
      0%{left:0%;}
	33.33%{left:-100%;}
	66.66%{left:-200%;}
	99.99%{left:-300%;}

}


.landcard{
    
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
    border-radius: 5px;
}

.landcard:hover{
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

#headertag{
    
    text-align: center;
    font-size:  xx-large;
    font-family:   cursive;
    color: #000066;
}

        </style>
        <script>
//            var spinner = ` < div class = "text-center p-5" > < i class = "fa fa-spinner fa-spin" aria - hidden = "true" style = "font-size:100px;" > < /i></div > `;
//            var spinner = ` < div class = "text-center p-5" > < i class = "fa fa-spinner fa-spin" aria - hidden = "true" style = "font-size:100px;" > < /i></div > `;
            var spinner = `<div class="text-center p-5"><i class="fa fa-spinner fa-spin" aria-hidden="true" style="font-size:100px;"></i></div>`;
           var interval;
            var rate;
            var rateFigure = 10;
            var firstTime = true;
           

            $(document).on('change', '#refreshDropDown', function () {
                rate = $(this).children("option:selected").val();
                rateFigure = parseInt(rate, 10);
                setTimeout(function () {
                    clearInterval(interval);
                    startAutoReload("dashboard");
                }, 2000);
                $("#refreshDropDown").val(rate);
                //$("#refreshDropDown option[value='"+rate+"']").prop('selected' , true);  
            });

            function loadBalanceAtFirstTime() {
                var url = "dashboard";
                $.get(url, function (result) {
                    $('#result1').html(result);
                });
            }
            function startAutoReload(url) {
                console.log('call start');
                interval = setInterval(function () {
                    $('#result1').html(spinner);
                    $.get(url, function (result) {
                        $('#result1').html(result);
                    });
                }, rateFigure * 1000);
            }
            function goTo(link) {
                var url = '${pageContext.request.contextPath}/' + link;
                if (link !== 'bulkterminalupload') {
                    $('#toggleDiv').hide();
                }
                $('#result1').html(spinner);
                $.get(url, function (result) {
                    $('#result1').html(result);
                });
            }
            function reloadValidators() {
                validate.reload();
                CreateTeacherFormValidate.reload();
                editBillerInfoValidate.reload();
                addBillerInfoValidate.reload();
                editTerminalValidate.reload();
                addTerminalInfoValidate.reload();
                editPosClusterInfo.reload();
                addPosClusterInfo.reload();
                editProduct.reload();
                addProduct.reload();
                addVasProvider.reload();
                editProvider.reload();
                updateTerminalTransactionTimeout.reload();
                editGlobalVariable.reload();
                addMerchantInfo.reload();
                addUser.reload();
                editUser.reload();
                disableaterminal.reload(); 
                enableaterminal.reload();  
                editMerchantUser.reload();
                changePasswordforFirstTimeLogin.reload();
                addTerminalInformationValidate.reload();
                addMerchantInformation.reload();
                addTerminalInformationValidate.reload();
                addUserbyMerchant.reload();
                MarkAttendancePage.reload();
                setDatePicker();

            }
  

            $(document).ready(function () {
                if (firstTime) {
                    console.log(firstTime);
                    loadBalanceAtFirstTime();
                    firstTime = false;
                }
                $(document).on('click', '.link', function (e) {
                    e.preventDefault();
                    url = $(this).attr('href');
                    var location = url.split('/');
                    location = location[location.length - 1];
                    $('#result1').html(spinner);
                    $.get(url, function (result) {
                        $('#result1').html(result);
                        reloadValidators();
                        if (location !== 'dashboard' && location !== 'settlement') {
                            clearInterval(interval);
                            if (location === 'bulkterminalupload') {
                                $('#toggleDiv').show();
                            } else {
                                $('#toggleDiv').hide();
                            }

                        } else {
                            clearInterval(interval);
                            startAutoReload(url);
                        }
                    });
                });

                $(document).on('change', '#selectAllHeadings', function () {
                    if ($(this).prop('checked')) {
                        console.log('checked');
                    } else {
                        console.log('not checked');
                    }
                    $(this.form.elements).filter(':checkbox').prop('checked', this.checked);
                });

            });
            $(document).on('change', '.masterCheck', function () {
                if ($(this).prop('checked') === true) {
                    $('.userProfiles').find('input:not(.masterCheck)').prop('checked', true);
                } else {
                    $('.userProfiles').find('input:not(.masterCheck)').prop('checked', false);
                }
            });
            var walletArray = [];
            $(document).on('change', '.masterCheckwl', function () {
                if ($(this).prop('checked') === true) {
                    $('.wallet_records').find('input:not(.masterCheckwl)').prop('checked', true);
                } else {
                    $('.wallet_records').find('input:not(.masterCheckwl)').prop('checked', false);
                }
            });
            $(document).on('change', '.masterCheckwl', function () {
                if ($(this).prop('checked') === true) {
                    walletArray.length = 0;
                    $('.wallet_records').find('input:not(.masterCheckwl)').prop('checked', true);
                    var checkedValues = $('input:checkbox:checked').map(function () {
                        return this.value;
                    }).get();
                    var itemtoRemove = "on";
                    checkedValues.splice($.inArray(itemtoRemove, checkedValues), 1);
                    walletArray = checkedValues;
                    console.log(walletArray);
                } else {
                    $('.wallet_records').find('input:not(.masterCheckwl)').prop('checked', false);
                }
            });

            $(document).on('show.bs.modal', '#downloadreport', function (event) {
                var button = $(event.relatedTarget);
                console.log(walletArray);
                var wnumbers = walletArray.join(",");
                console.log(wnumbers);
                var modal = $(this);
//                    console.log('fileId:'+ file_id);
                modal.find('[name=walletnumber]').val(wnumbers);
//                modal.find('[name=fileid]').val(fileid);
            });
            $(document).on('change', '.masterCheck', function () {
                if ($(this).prop('checked') === true) {
                    $('.vppaybox').find('input:not(.masterCheck)').prop('checked', true);
                } else {
                    $('.vppaybox').find('input:not(.masterCheck)').prop('checked', false);
                }
            });


            $(document).on('show.bs.modal', '#activateModal', function (event) {
                var button = $(event.relatedTarget);
                var id = button.data('id');
                var fileid = button.data('fileid');
                deleteRow = button.closest('tr');
                var modal = $(this);
//                    console.log('fileId:'+ file_id);
                modal.find('[name=id]').val(id);
                modal.find('[name=fileid]').val(fileid);
            });
            $(document).on('change', '.masterCheck', function () {
                if ($(this).prop('checked') === true) {
                    bkarray.length = 0;
                    $('.bulk_files').find('input:not(.masterCheck)').prop('checked', true);
                    var checkedValues = $('input:checkbox:checked').map(function () {
                        return this.value;
                    }).get();
                    var itemtoRemove = "on";
                    checkedValues.splice($.inArray(itemtoRemove, checkedValues), 1);
                    bkarray = checkedValues;
                    console.log(bkarray);
                } else {
                    $('.bulk_files').find('input:not(.masterCheck)').prop('checked', false);
                }
            });

            var reportsArray = [];
            $(document).on('click', '.downloadReports', function (e) {
                e.preventDefault();
                var url = "downloadZipped";
                console.log('Hello world');
                var data = reportsArray.join(",");
                console.log(data);
                $.get(url, {filename: data}, function () {
                    console.log(data);
                });
            });
            $(document).on('change', '.reportBox', function () {
                var chk = $(this);
                var id = chk.next().val();
//                return;
                $('.clicked_file').val(id);
                if (chk.prop("checked")) {
                    reportsArray.push(id);
                } else {
                    if (reportsArray.indexOf(id) > -1) {
                        var i = reportsArray.indexOf(id);
                        reportsArray.splice(i, 1);
                    }
                }
            });

            function setDatePicker() {
                reportFromDate = $("#fromDate")
                        .datepicker({
                            dateFormat: "yy-mm-dd",
                            changeMonth: true,
                            changeYear: true
                        }).on("change", function () {
                    reportToDate.datepicker("option", "minDate", getDate(this));
                }),
                        reportToDate = $("#toDate").datepicker({
                    dateFormat: "yy-mm-dd",
                    changeMonth: true,
                    changeYear: true
                }).on("change", function () {
                    reportFromDate.datepicker("option", "maxDate", getDate(this));
                    console.log(reportFromDate.val());
                    console.log(reportToDate.val());
                });

                function getDate(element) {
                    var date;
                    var dateFormat = "yy-mm-dd";
                    try {
                        date = $.datepicker.parseDate(dateFormat, element.value);
                    } catch (error) {
                        date = null;
                    }

                    return date;
                }
            }

    

        

       
            $(document).on('click', '#searchProducts', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchproduct';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });

            $(document).on('click', '#searchTerminals', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchterminalInfo';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });
 
$(document).on('click', '#searchTerminal', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchterminal';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            }); 

            var PosClusterArray = [];
            $(document).on('click', '.deletePosCluster', function () {
                var url = "deleteposcluster";
                console.log('Hello world');
                var data = PosClusterArray.join(",");
                console.log("data: " + data);
                $.post(url, {array: data}, function (result) {
                    if (result === "Successful") {
                        $('#result').html(spinner);
                        var url = "poscluster";
                        $.get(url, function (result) {
                            $('#result1').html(result);
                        });
                        console.log(result);
                    }
                });
            });

            $(document).on('change', '.posClusterClass', function () {
                var check = $(this);
                var id = check.next().val();
                if (check.prop("checked")) {
                    PosClusterArray.push(id);
                } else {
                    if (PosClusterArray.indexOf(id) > -1) {
                        var i = PosClusterArray.indexOf(id);
                        PosClusterArray.splice(i, 1);
                    }
                }
                console.log("PosClusterArray " + PosClusterArray);

            });

            $(document).on('click', '#searchPosCluster', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchposcluster';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log('url:' + url);
                });

            });


            var productArray = [];
            $(document).on('click', '.deleteProduct', function () {
                var url = "deleteproduct";
                console.log('Hello world');
                var data = productArray.join(",");
                console.log("data: " + data);
                $.post(url, {array: data}, function (result) {
                    if (result === "Successful") {
                        $('#result').html(spinner);
                        var url = "product";
                        $.get(url, function (result) {
                            $('#result1').html(result);
                        });
                        console.log(result);
                    }
                });
            });
            
            

            $(document).on('change', '.productClass', function () {
                var check = $(this);
                var id = check.next().val();
                if (check.prop("checked")) {
                    productArray.push(id);
                } else {
                    if (productArray.indexOf(id) > -1) {
                        var i = productArray.indexOf(id);
                        productArray.splice(i, 1);
                    }
                }
                console.log("PosClusterArray " + productArray);

            });

            $(document).on('click', '#searchProducts', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchproduct';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log('url:' + url);
                });

            });


            var providerArray = [];
            $(document).on('click', '.deleteprovider', function () {
                var url = "deleteprovider";
                console.log('Hello world');
                var data = providerArray.join(",");
                console.log("data: " + data);
                $.post(url, {array: data}, function (result) {
                    if (result === "Successful") {
                        $('#result').html(spinner);
                        var url = "provider";
                        $.get(url, function (result) {
                            $('#result1').html(result);
                        });
                        console.log(result);
                    }
                });
            });

            $(document).on('change', '.providerClass', function () {
                var check = $(this);
                var id = check.next().val();
                if (check.prop("checked")) {
                    providerArray.push(id);
                } else {
                    if (providerArray.indexOf(id) > -1) {
                        var i = providerArray.indexOf(id);
                        providerArray.splice(i, 1);
                    }
                }
                console.log("providerArray " + providerArray);

            });

            $(document).on('click', '#searchProvider', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchprovider';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log('url:' + url);
                });

            });

            $(document).on('click', '#searchMerchant', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchmerchant';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log('url:' + url);
                });

            });
            
          
           
            
            
            
                  $(document).on('click', '#searchTeacherForParent', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchteacherforparent';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log('url:' + url);
                });

            });
            
            
            
            
               $(document).on('click', '#searchstudentforteacherattendance', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchstudentforteacherattendance';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log('url:' + url);
                });

            });
            
            
            
            
                $(document).on('click', '#searchstudentforteacher', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchstudentforteacher';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log('url:' + url);
                });

            });
            
            
                 $(document).on('click', '#searchStudent', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = ' searchParentStudent';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log('url:' + url);
                });

            });
            
            
            
//              $(document).on('click', '#attendanceentry', function (e) {
//                e.preventDefault();
//                var firstname = document.getElementById('firstattend').value;
//                var lastname = document.getElementById('lastattend').value;
//                var sex = document.getElementById('sexattend').value;
//                $('#result1').html(spinner);
//                
//                $.get(url, function (result) {
//                    $('#result1').html(result);
//                    console.log(url);
//                    console.log(result);
//                });
//            });
        
            
            
//            
//            $(document).on('click', '#resettable', function (e) {
//                
//                e.preventDefault();
//                $('#result1').html(spinner);
//                var url = "reset"+id;
//                $.get(url, dataVal, function (result) {
//                    $('#result1').html(result);
//                    console.log(url);
//                    console.log(result);
//                });
//            }); 
            
            
//            function myReloadFunction(){
//                 e.preventDefault();
//                $('#result1').html(spinner);
//                window.location.href = "processtable";
//            }
//            



//
//       $(document).on('click', '#presentattendance', function (e) {
//                e.preventDefault();
//                var id = document.getElementById('studentattendanceid').value;
//                $('#result1').html(spinner);
//                var form = $(this).closest('form');
//                var dataVal = form.serialize();
//                var url = "attend/"+id;
//                $.get(url, dataVal, function (result) {
//                    $('#result1').html(result);
//                    console.log(url);
//                    console.log(result);
//                });
//            });




                       $(document).on('click', '#searchstudentforteacherrecord', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = "searchstudentforteacherrecord";
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });







                      $(document).on('click', '#searchteacherforadminuser', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = "searchteacherforadmin";
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });
                

                

                
                
                
                
                $(document).on('click', '#searchmyteacherforattendance', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = "searchteacherforattendance";
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });
                
                
                
                
                
                $(document).on('click', '#searchparentforadmin', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = "searchparentforadmin";
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });
                
                
                


            

                $(document).on('click', '#submitattendance', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = "submitattendance";
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });
                
//                
//                    $(document).on('click', '#refreshbuttonforattendance', function (e) {
//                e.preventDefault();
//                $('#result1').html(spinner);
//                var form = $(this).closest('form');
//                var dataVal = form.serialize();
//                var url = "refreshattendance";
//                $.get(url, dataVal, function (result) {
//                    form.after('<div class="alert alert-success text-center m-3">Student successfully created</div>');
//                   $('#result1').html(result);
//                    console.log(url);
//                    console.log(result);
//                });
//            });
//                


            
            



//               $(document).on('click', '#resettable', function (e) {
//                e.preventDefault();
//                var id = document.getElementById('resetid').value;
//                $('#result1').html(spinner);
//                var form = $(this).closest('form');
//                var dataVal = form.serialize();
//                var url = "reset/"+id;
//                $.get(url, dataVal, function (result) {
//                    $('#result1').html(result);
//                    console.log(url);
//                    console.log(result);
//                });
//            });
//            
//             function myReloadFunc() {
//             var id = document.getElementById('resetid').value;
//             console.log(id);
//             console.log('I GOT HERE');
//                var url = "reset/"+id;
//                $('#result1').html(spinner);
//               window.location.href="processtable";
//                $('#result1').html(result);
//            }
            
            
            
            
            
//             $(document).on('click', '#resettable', function (e) {
//               e.preventDefault();
//                $('#result1').html(spinner);
//                window.location.href = "processtable";
//                });
//            }); 
            
            
//
//            $(document).on('click', '#searchTerminalReports', function (e) {
//                e.preventDefault();
//                $('#result1').html(spinner);
//                var form = $(this).closest('form');
//                var dataVal = form.serialize();
//                var url = 'searchterminalreport';
//                $.get(url, dataVal, function (result) {
//                    $('#result1').html(result);
//                    console.log(url);
//                    console.log(result);
//                });
//            });
//            function show(select_item) {
//                if (select_item == "MERCHANT") {
//                    hiddenDiv.style.visibility = 'visible';
//                    hiddenDiv.style.display = 'block';
//                    Form.fileURL.focus();
//                }
//                else {
//                    hiddenDiv.style.visibility = 'hidden';
//                    hiddenDiv.style.display = 'none';
//                }
//            }
//
//            $(document).on('click', '#searchTransactions', function (e) {
//                e.preventDefault();
//                $('#result1').html(spinner);
//                var form = $(this).closest('form');
//                var dataVal = form.serialize();
//                var url = 'searchtransactions';
//                $.get(url, dataVal, function (result) { 
//                    $('#result1').html(result);
//                    console.log(url);
//                    console.log(result);
//                });
//            });
            
            
//               $(document).on('click', '#searchsmstable', function (e) {
//                e.preventDefault();
//                $('#result1').html(spinner);
//                var form = $(this).closest('form');
//                var dataVal = form.serialize();
//                var url = 'searchsmstable';
//                $.get(url, dataVal, function (result) { 
//                    $('#result1').html(result);
//                    console.log(url);
//                    console.log(result);
//                });
//            });

//            $(document).on('click', '#searchForFiles', function (e) {
//                e.preventDefault();
//                $('#result1').html(spinner);
//                var form = $(this).closest('form');
//                var dataVal = form.serialize();
//                var url = 'searchuploadedfiles';
//                $.get(url, dataVal, function (result) {
//                    $('#result1').html(result);
//                    console.log(url);
//                    console.log(result);
//                });
//            });

//            $(document).on('click', '#searchUsers', function (e) {
//                e.preventDefault();
//                $('#result1').html(spinner);
//                var form = $(this).closest('form');
//                var dataVal = form.serialize();
//                var url = 'searchusers';
//                $.get(url, dataVal, function (result) {
//                    $('#result1').html(result);
//                    console.log(url);
//                    console.log(result);
//                });
//            });
//
//            $(document).on('click', '#searchMobileMoney', function (e) {
//                e.preventDefault();
//                $('#result1').html(spinner);
//                var form = $(this).closest('form');
//                var dataVal = form.serialize();
//                var url = 'searchmobilemoney';
//                $.get(url, dataVal, function (result) {
//                    $('#result1').html(result);
//                    console.log(url);
//                    console.log(result);
//                });
//            });
//             $(document).on('click', '#searchTerminalwithDifferentGlobalVariable', function (e) {
//                e.preventDefault();
//                $('#result1').html(spinner);
//                var form = $(this).closest('form'); 
//                var dataVal = form.serialize();
//                var url = 'searchterminalwithdifferentglobalvariable';
//                $.get(url, dataVal, function (result) {
//                    $('#result1').html(result);
//                    console.log(url);
//                    console.log(result);
//                });
//            });
              
//            $(document).on('click', '#searchMobileMoneyReversal', function (e) {
//                e.preventDefault();
//                $('#result1').html(spinner);
//                var form = $(this).closest('form');
//                var dataVal = form.serialize();
//                var url = 'searchmobilemoneyreversal';
//                $.get(url, dataVal, function (result) {
//                    $('#result1').html(result);
//                    console.log(url);
//                    console.log(result);
//                });
//            });

            var page_row;
            var page_row_figure = 10;
            $(document).on('change', "#pagesDropDown", function () {
                page_row = $(this).children("option:selected").val();
                page_row_figure = parseInt(page_row, 10);
                var url = "dashboard";
                $.post(url, {page_row_figure: page_row_figure}, function (result) {
                    $('#result1').html(result);
                });  
            }); 
             
   $(document).on('click', '.rolesBtn', function (event) {
                event.preventDefault();
                var role = $(this).attr('id');
                var roleId = parseInt(role, 10);
                var roleName =  $(this).attr('href');
                var url = "viewroles";
                $('#actionDiv').html(spinner);
                $.post(url, {roleId: roleId,roleName:roleName}, function (result) {
                    $('#actionDiv').html(result);
                });
            });

$(document).on('click', '.addBtn', function (event) {
                event.preventDefault();
                var url = "showpages";
                var roleId = $(this).attr('id');
                var roleIdFigure = parseInt(roleId, 10);
                $('#actionDiv').html(spinner);
                $.post(url, {roleId: roleIdFigure}, function (result) {
                    $('#actionDiv').html(result);
                });
            });
     var pagesarray = [];
     
      $(document).on('change', '.pagesBox', function () {
           var chk = $(this);
           var id = chk.next().val();
           if (chk.prop("checked")) {
               pagesarray.push(id);
           } else {
               if (pagesarray.indexOf(id) > -1) {
                   var i = pagesarray.indexOf(id);
                   pagesarray.splice(i, 1);
               }
           }
       });
       
$(document).on('click', '.removeButton', function (event) {
                event.preventDefault();
                var roleId = $(this).attr('href');
                var roleIdFigure = parseInt(roleId, 10);
                var button = $(this);
                var modal = button.closest('.modal');
                var modalFooter = modal.find('.modal-footer');
                modalFooter.hide('fast');
                var url = "removerole";
                var data = pagesarray.join(',');
                 if (pagesarray.length > 0) {
                    
        $.post(url, {array: data,roleId: roleIdFigure}, function (result) {
            if (result === "00") {
                $('#removedFunction').html('<div class="alert alert-success text-center">' + 'Successfully removed' + '</div>');
                setTimeout(function () {
                    $.each(pagesarray, function (i, val) {
                        $('[type="checkbox"][value="' + val+ '"]').parent().parent().remove();
                    });
                    $('#ask_before_remove').modal('hide');
                    modalFooter.show('fast');
                     pagesarray.length = 0;
                    $('#removedFunction').html('');
                }, 3000);
            } else {
                $('#removedFunction').html('<div class="alert alert-danger text-center">' + 'Failed to remove! Try again' + '</div>');
                setTimeout(function () {
                    pagesarray.length = 0;
                    modalFooter.show('fast');
                    $('#removedFunction').html('');
                }, 3000);
            }
               
             });
         }
               });

$(document).on('click','.addRole',function (event){
    event.preventDefault();
    var roleId = $(this).attr("id");
    var roleName = $(this).attr("href");
    var roleIdFigure = parseInt(roleId, 10);
           var url = "addpages";
           var data = pagesarray.join(",");
           if (pagesarray.length > 0) {
               $.post(url, {array: data, roleId: roleId}, function (result) {
                   if (result === "00") {
                       pagesarray.length = 0;
                       $('#addedFunction').html('<div class="alert alert-success text-center">' + 'Successfully added' + '</div>');
                       setTimeout(function () {
                           $('#actionDiv').html(spinner);
                           $.post("viewroles", {roleId: roleIdFigure,roleName: roleName}, function (result) {
                               $('#actionDiv').html(result);
                           });
                       }, 3000);

                   }
                   else {
                       $('#addedFunction').html('<div class="alert alert-success text-center">' + 'Error occured' + '</div>');
                       pagesarray.length = 0;
                   }
               });
           }

       });

       
       
       
       
       
       
            var StudentCollectionItemArray = [];
            $(document).on('click', '.deleteClassStudent', function () {
                var url = "deleteStudent";
                console.log('Hello world');
                var data = StudentCollectionItemArray.join(",");
                console.log(data);
                $.post(url, {array: data}, function (result) {
                    if (result === "success") {
                        $('#ask_before_delete').modal('hide');
                        $('#result1').html(spinner);
                        var url = "myclass";
                        $.get(url, function (result) {
                            $('#result1').html(result);
                        });
                        console.log(result);
                    }
                });
            });

            $(document).on('change', '.studentcollectionBox', function () {
                var chk = $(this);
                var id = chk.next().val();
                if (chk.prop("checked")) {
                    StudentCollectionItemArray.push(id);
                } else {
                    if (StudentCollectionItemArray.indexOf(id) > -1) {
                        var i = StudentCollectionItemArray.indexOf(id);
                        StudentCollectionItemArray.splice(i, 1);
                    }
                }
            });
       
       
       
       
       
       
       
       
       
       
       
              var StudentCollectionItemArray = [];
            $(document).on('click', '.subjectDeleteRequestButton', function () {
                var url = "deleteSubject";
                console.log('Hello world');
                var data = StudentCollectionItemArray.join(",");
                console.log(data);
                $.post(url, {array: data}, function (result) {
                    if (result === "success") {
                        $('#ask_before_delete').modal('hide');
                        $('#result1').html(spinner);
                        var url = "mysubjects";
                        $.get(url, function (result) {
                            $('#result1').html(result);
                        });
                        console.log(result);
                    }
                });
            });

            $(document).on('change', '.subjectcollectionBox', function () {
                var chk = $(this);
                var id = chk.next().val();
                if (chk.prop("checked")) {
                    StudentCollectionItemArray.push(id);
                } else {
                    if (StudentCollectionItemArray.indexOf(id) > -1) {
                        var i = StudentCollectionItemArray.indexOf(id);
                        StudentCollectionItemArray.splice(i, 1);
                    }
                }
            });
       
       
       
       
       
       
       
       
       
       
       
       
       
       
              var ParentStudentCollectionItemArray = [];
            $(document).on('click', '.deleteParentStudent', function () {
                var url = "deleteStudentforparent";
                console.log('Hello world');
                var data = ParentStudentCollectionItemArray.join(",");
                console.log(data);
                $.post(url, {array: data}, function (result) {
                    if (result === "success") {
                        $('#ask_before_delete').modal('hide');
                        $('#result1').html(spinner);
                        var url = "mystudent";
                        $.get(url, function (result) {
                            $('#result1').html(result);
                        });
                        console.log(result);
                    }
                });
            });

            $(document).on('change', '.parentstudentcollectionBox', function () {
                var chk = $(this);
                var id = chk.next().val();
                if (chk.prop("checked")) {
                    ParentStudentCollectionItemArray.push(id);
                } else {
                    if (ParentStudentCollectionItemArray.indexOf(id) > -1) {
                        var i = ParentStudentCollectionItemArray.indexOf(id);
                        ParentStudentCollectionItemArray.splice(i, 1);
                    }
                }
            });
       
       
       
       
       
       
       
       
       
       
       
       
       
       
            
              var TeacherStudentCollectionItemArray = [];
            $(document).on('click', '.teacherdeleteButton', function () {
                var url = "deleteteacher";
                console.log('Hello world');
                var data = TeacherStudentCollectionItemArray.join(",");
                console.log(data);
                $.post(url, {array: data}, function (result) {
                    if (result === "success") {
                        $('#ask_before_delete').modal('hide');
                        $('#result1').html(spinner);
                        var url = "teachermanagement";
                        $.get(url, function (result) {
                            $('#result1').html(result);
                        });
                        console.log(result);
                    }
                });
            });

            $(document).on('change', '.teachercollectionBox', function () {
                var chk = $(this);
                var id = chk.next().val();
                if (chk.prop("checked")) {
                    TeacherStudentCollectionItemArray.push(id);
                } else {
                    if (TeacherStudentCollectionItemArray.indexOf(id) > -1) {
                        var i = TeacherStudentCollectionItemArray.indexOf(id);
                        TeacherStudentCollectionItemArray.splice(i, 1);
                    }
                }
            });
       
       
       
       
       
       
       
       
       
       
       
       
       
            
              var ParentCollectionItemArray = [];
            $(document).on('click', '.DeleteParentButton', function () {
                var url = "deleteparent";
                console.log('Hello world');
                var data = ParentCollectionItemArray.join(",");
                console.log(data);
                $.post(url, {array: data}, function (result) {
                    if (result === "success") {
                        $('#ask_before_delete').modal('hide');
                        $('#result1').html(spinner);
                        var url = "parentmanagement";
                        $.get(url, function (result) {
                            $('#result1').html(result);
                        });
                        console.log(result);
                    }
                });
            });

            $(document).on('change', '.parentstudentcollectionBox', function () {
                var chk = $(this);
                var id = chk.next().val();
                if (chk.prop("checked")) {
                    ParentCollectionItemArray.push(id);
                } else {
                    if (ParentCollectionItemArray.indexOf(id) > -1) {
                        var i = ParentCollectionItemArray.indexOf(id);
                        ParentCollectionItemArray.splice(i, 1);
                    }
                }
            });
       
       
       
       
       
       
       
       
       
       
         
              var StaffCollectionItemArray = [];
            $(document).on('click', '.deleteStaff', function () {
                var url = "deletestaff";
                console.log('Hello world');
                var data = StaffCollectionItemArray.join(",");
                console.log(data);
                $.post(url, {array: data}, function (result) {
                    if (result === "success") {
                        $('#ask_before_deletestaff').modal('hide');
                        $('#result1').html(spinner);
                        var url = "nonteaching";
                        $.get(url, function (result) {
                            $('#result1').html(result);
                        });
                        console.log(result);
                    }
                });
            });

            $(document).on('change', '.staffcollectionBox', function () {
                var chk = $(this);
                var id = chk.next().val();
                if (chk.prop("checked")) {
                    StaffCollectionItemArray.push(id);
                } else {
                    if (StaffCollectionItemArray.indexOf(id) > -1) {
                        var i = StaffCollectionItemArray.indexOf(id);
                        StaffCollectionItemArray.splice(i, 1);
                    }
                }
            });
       
       
       
       
       
       
       
       
       
       
       
       
       
       
              var ClassCollectionItemArray = [];
            $(document).on('click', '.deleteClass', function () {
                var url = "deleteclass";
                console.log('Hello world');
                var data = ClassCollectionItemArray.join(",");
                console.log(data);
                $.post(url, {array: data}, function (result) {
                    if (result === "success") {
                        $('#ask_before_deleteclass').modal('hide');
                        $('#result1').html(spinner);
                        var url = "classmanagement";
                        $.get(url, function (result) {
                            $('#result1').html(result);
                        });
                        console.log(result);
                    }
                });
            });

            $(document).on('change', '.classcollectionBox', function () {
                var chk = $(this);
                var id = chk.next().val();
                if (chk.prop("checked")) {
                    ClassCollectionItemArray.push(id);
                } else {
                    if (ClassCollectionItemArray.indexOf(id) > -1) {
                        var i = ClassCollectionItemArray.indexOf(id);
                        ClassCollectionItemArray.splice(i, 1);
                    }
                }
            });
       
       
       
       
       
       
       
       
       
      
        </script>
        
        
      
    </head>
      <body style="background-image:url(<c:url value='/resources/imgs/wallpaper2.png' />);">

            <!--<div class="container welcome">-->
            <div class="" style="width: 100%">
                <div class="bg-primary">
                    <nav class="navbar navbar-expand-lg navbar-light" style="padding:0px 20px !important; margin :0 !important; background-color: #6666ff" id="navbody">
                        
                       
                        <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarSupportedContent" style="padding:0px 20px !important; margin :0 !important;">
                          
                            <ul class="nav text-white align-content-end">
                                <li class="nav-item">
                                  
                                    You are logged in as ${username}
                                    <!--<a class="nav-link text-white" href="#"><i class="fa fa-facebook"></i></a>-->
                                </li>
                                <li class="nav-item p-2">
                                    <!--<a class="nav-link text-white" href="<c:url value="/logout" />">logout</a>-->
<!--                                     <li class="list-group-item"><a href="<c:url value="/logout" />" data-toggle="tooltip" title="done with using the channel, you can log out">logout</a></li>-->
                                </li><!--
                                <li class="nav-item">
                                    <a class="nav-link text-white" href="#"><i class="fa fa-instagram"></i></a>
                                </li>-->
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
                                
                                
                         
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                <div class="justify-content-center" id="headertag">
                                    School Management System
                                </div>
                                
                                <div style="height: 25px;">
                                    <span style="font-size:20px;cursor:pointer; font-family: Swis721 BlkCn BT; color: white;" onclick="openNav()">&#9776; MENU</span>
                                </div>
                                
                                <hr>
                                <div class="col-md-6 offset-3">
                                    <form action="searchteacherforparent" method="post">
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control" placeholder="Search Keyword" name="subject">
                                            <div class="input-group-append">
                                                <button class="btn btn-outline-white btn-sm" id = "searchTeacherForParent" type="submit"><i class="fa fa-search" style=" color: white;"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div id="mySidenav" class="sidenav">
                                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                                    <div class="alert-primary">                 
                                
         
                    <ul class="">
                        <c:forEach items="${role}" var = "role" varStatus="status">
                            <li class="" ><a class="link" href="${role.urlmapping}" data-toggle="tooltip" title="${role.labeltitle}" style="  font-size: 15px; color: black;"><hr>${role.labelicon} ${role.label}</a></li>
                            </c:forEach>
                           
                            <li class=""><a href="<c:url value="/logout" />" data-toggle="tooltip" title="done with using the channel, you can log out" style="  color: black;"><hr><i class="fa fa-lock" aria-hidden="true"></i> logout</a></li>
                    </ul>
               
                    
       </div>
                    </div>
                    
                    
                    
                    <div class="col-md-9 offset-3">
                 <div id="result1">
                        <h3></h3>
                    </div>
                </div>
                    
                    
                      
                        
                              
                
                    
           
   
        <footer class="container-fluid text-center">
            
        </footer>
    
        <script src="<spring:url value="/resources/js/dropzone.js"/>"></script>
        
        <script>
            Dropzone.options.dropzoneForm = {
                // Prevents Dropzone from uploading dropped files immediately
                autoProcessQueue: false,
                init: function () {
                    var submitButton = document.querySelector("#submit_file");
                    dropzoneForm = this; // closure

                    submitButton.addEventListener("click", function () {
                        dropzoneForm.processQueue(); // Tell Dropzone to process all queued files.
                    });

                    // You might want to show the submit button only when 
                    // files are dropped here:
                    this.on("success", function (file) {
                        this.removeFile(file);

                    });

                },
                success: function () {
                    $('#drop_display').html('<div class="alert alert-success text-center">' + 'Successful' + '</div>');

                    setTimeout(function () {
                        $('#drop_display').html("");
                        $('#bulkpay').trigger('click');
                    }, 3000);
                }
            };
            
            
            
             
            function MyClass() {
                var url = "myclass";
                $.get(url, function (result) {
                    $('#result1').html(result);
                });
            }
            
            
            
            function SearchStudent() {
                var url = "searchstudent";
                $.get(url, function (result) {
                    $('#result1').html(result);
                });
            }
            
            
            
            function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
    document.body.style.backgroundColor = "white";
}
 
        </script>
        
    </body>
</html>