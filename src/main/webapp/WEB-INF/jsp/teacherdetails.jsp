<%-- 
    Document   : teacherdetails
    Created on : Oct 13, 2019, 2:01:24 PM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

 <div class="card">
    <div class="card-header" align="center">Send Message to ${firstname} ${lastname}</div>
    <div class="card-body">
      
        <form action="teachermessage" method="post" name="messagetoteacherform" id="messagetoteacherform">
        <textarea class="form-control" name="messagetoteacher"></textarea>
        <div align="right">
        <button class="btn btn-primary" type="submit">Send</button>
        </div>
        </form>
        
    </div>
 </div>
