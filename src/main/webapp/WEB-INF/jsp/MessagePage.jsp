<%-- 
    Document   : MessagePage
    Created on : Oct 13, 2019, 9:23:25 AM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="card">
    <div class="card-header" align="center">Messages</div>
    <div class="card-body">
        
        
           <c:forEach items="${getMessages}" var = "getMessages">
                                <div class="row mb-3">
                                    <div class="col-md-6 ml-auto">
                                        <div class="card bg-primary cardIncidence text-white">
                                            <div class="card-body">
                                                <p class="mb-0">${getMessages.message}</p>
                                            </div>
                                            <div class="card-footer text-right">Sent by ${getMessages.username} | ${getMessages.datesent} | To ${getMessages.teacher} <i class="fa fa-check"></i></div>
                                        </div>
                                    </div>
                                </div>
                                        
                 </c:forEach>
        
        
        
        
    </div>
</div>
