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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<spring:url value="/resources/css/bootstrap.min.css"/>"/>
        <link rel="stylesheet" href="<spring:url value="/resources/css/mdb.min.css"/>"/>
                   
        <script src="<spring:url value="/resources/js/jquery.js"/>"></script>
        <script src="<spring:url value="/resources/js/popper.min.js"/>"></script>
        <script src="<spring:url value="/resources/js/bootstrap.min.js"/>"></script>
        <link href="<spring:url value="/resources/css/dropzone.css"/>" rel="stylesheet" />
        <link rel="stylesheet" href="<spring:url value="/resources/css/font-awesome.min.css"/>"/>
        <link rel="stylesheet" href="<spring:url value="/resources/css/font-awesome.css"/>"/>
        <link href="<spring:url value="/resources/css/custom.css"/>" rel="stylesheet" />
        <link rel="icon" href="<spring:url value="/resources/imgs/TamsLogo.png"/>" type="image/png"/>
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
        <title>${title}</title>
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

            $(document).on('click', '#searchBillers', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchBillerInfo';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });

            var BillerInfoArray = [];
            $(document).on('click', '.deleteBillerInfo', function () {
                var url = "deleteBillerInfo";
                console.log('Hello world');
                var data = BillerInfoArray.join(",");
                console.log(data);
                $.post(url, {array: data}, function (result) {
                    if (result === "Successful") {
                        $('#result1').html(spinner);
                        var url = "billers";
                        $.get(url, function (result) {
                            $('#result1').html(result);
                        });
                        console.log(result);
                    }
                });
            });
            $(document).on('change', '.billerinfoBox', function () {
                var chk = $(this);
                var id = chk.next().val();
                if (chk.prop("checked")) {
                    BillerInfoArray.push(id);
                } else {
                    if (BillerInfoArray.indexOf(id) > -1) {
                        var i = BillerInfoArray.indexOf(id);
                        BillerInfoArray.splice(i, 1);
                    }
                }
            });

            $(document).on('click', '#searchcallHomes', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchcallHomes';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });

            $(document).on('click', '#searchNodes', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchposNodes';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });

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


            
            



               $(document).on('click', '#resettable', function (e) {
                e.preventDefault();
                var id = document.getElementById('resetid').value;
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = "reset/"+id;
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });
            
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
            
            

            $(document).on('click', '#searchTerminalReports', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchterminalreport';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });
            function show(select_item) {
                if (select_item == "MERCHANT") {
                    hiddenDiv.style.visibility = 'visible';
                    hiddenDiv.style.display = 'block';
                    Form.fileURL.focus();
                }
                else {
                    hiddenDiv.style.visibility = 'hidden';
                    hiddenDiv.style.display = 'none';
                }
            }

            $(document).on('click', '#searchTransactions', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchtransactions';
                $.get(url, dataVal, function (result) { 
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });
            
            
               $(document).on('click', '#searchsmstable', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchsmstable';
                $.get(url, dataVal, function (result) { 
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });

            $(document).on('click', '#searchForFiles', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchuploadedfiles';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });

            $(document).on('click', '#searchUsers', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchusers';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });

            $(document).on('click', '#searchMobileMoney', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchmobilemoney';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });
             $(document).on('click', '#searchTerminalwithDifferentGlobalVariable', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form'); 
                var dataVal = form.serialize();
                var url = 'searchterminalwithdifferentglobalvariable';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });
              
            $(document).on('click', '#searchMobileMoneyReversal', function (e) {
                e.preventDefault();
                $('#result1').html(spinner);
                var form = $(this).closest('form');
                var dataVal = form.serialize();
                var url = 'searchmobilemoneyreversal';
                $.get(url, dataVal, function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
            });

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

       
       
       
       
       
       
      
        </script>
        
      
    </head>
    <body>
      
            <!--<div class="container welcome">-->
            <div class="" style="width: 100%">
                <div class="bg-primary">
                    <nav class="navbar navbar-expand-lg navbar-light" style="padding:0px 20px !important; margin :0 !important; background-color: #6666ff" id="navbody">
                        <a class="navbar-brand" style=" color: white;">School Management System</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

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

                               
                        
                                
                                
                                
            <div class="row d-flex justify-content-end w-100">
                <div class="">
                    <ul class="list-group">
                        <c:forEach items="${role}" var = "role" varStatus="status">
                            <li class="list-group-item"><a class="link" href="${role.urlmapping}" data-toggle="tooltip" title="${role.labeltitle}">${role.labelicon} ${role.label}</a></li>
                            </c:forEach>
                        <li class="list-group-item"><a href="<c:url value="/logout" />" data-toggle="tooltip" title="done with using the channel, you can log out"><i class="fa fa-lock" aria-hidden="true"></i> logout</a></li>
                    </ul>
                </div>
                <div class="col-md-10">
                 
                    <div id="result1">
                        <h3></h3>
                    </div>
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
            
            
            
            
            
        </script>
    </body>
</html>