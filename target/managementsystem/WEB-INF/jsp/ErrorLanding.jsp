<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
    <head>
           <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<spring:url value="/resources/css/bootstrap.min.css"/>"/>
        <link rel="stylesheet" href="<spring:url value="/resources/css/mdb.min.css"/>"/>
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
        <title>${title}</title>
    </head>
    <body id="welcomedivpage">
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
                                <br/><br/><hr>
                                
                                
                                <div style=" color: white;">
                                    <h1>SORRY NO DATA FOUND TO DOWNLOAD</h1>
                                    <br/>
                                    <p style=" text-align: center;">
                                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/welcome">Back</a>
                                    </p>
                                </div>
                              
    </body>
</html>