<%-- 
    Document   : ComplainMessagesAdmin
    Created on : Oct 14, 2019, 2:14:48 PM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


 <div class="card">
        <!--<div class="card-header"> ${id} | Date created: ${"March 1, 2018"}</div>-->
        <div class="card-body" >

                 <c:forEach items="${getComplain}" var = "getComplain">
                                <div class="row mb-3">
                                    <div class="col-md-6 ml-auto">
                                        <div class="card bg-primary cardIncidence text-white">
                                            <div class="card-body">
                                                <p class="mb-0">${getComplain.complain}</p>
                                            </div>
                                            <div class="card-footer text-right">${getComplain.username} | ${getComplain.date} | <i class="fa fa-check"></i></div>
                                        </div>
                                    </div>
                                </div>
                                        
                 </c:forEach>
                      
       
        </div>
 </div>