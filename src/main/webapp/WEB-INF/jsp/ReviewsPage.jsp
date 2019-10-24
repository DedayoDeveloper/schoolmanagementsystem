<%-- 
    Document   : ReviewsPage
    Created on : Oct 21, 2019, 10:26:25 AM
    Author     : oreoluwa
--%>


<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="card">
    <div class="card-header" align="center">Teachers Reviews</div>
    <div class="card-body">
        
        <h5 style="text-align: center;">RATINGS</h5>
 <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">
                <thead>
                     <tr class="blue-grey white-text">
                        
                        <th>Username</th>                                        
                        <th>Present</th>
                        <th>Absent</th>
                   
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        
                        <td>${username}</td>
                        <td>${presentattendance} Days</td>
                        <td>${absentattendance} Days</td>
                        
                    </tr>
            
                </tbody>
            </table>
        </div>
                        
                        
                        
                        
                        <!--tabl two-->
                        
                         <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">
                <thead>
                     <tr class="blue-grey white-text">
                        
                        <th>Complains</th>                                        
                        
                   
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        
                        <td>${complaincount}</td>
                     
                        
                    </tr>
            
                </tbody>
            </table>
        </div>
                        
                        
                        
                        
                               <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">
                <thead>
                     <tr class="blue-grey white-text">
                        
                        <th>Comments</th>                                        
                        
                   
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        
                        <td>${commentcount}</td>
                     
                        
                    </tr>
            
                </tbody>
            </table>
        </div>
                        
                    
                                       
                         <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">
                <thead>
                     <tr class="blue-grey white-text">
                        
                        <th>Subjects Teaching</th> 
                        <th>Class Teaching</th>
                        <th>students above average</th>   
                        <th>students below average</th>
                   
                    </tr>
                </thead>
                <tbody>
                     <c:forEach items="${getTeacherAverage}" var = "getTeacherAverage" varStatus="status">
                    <tr>
                       
                        <td>${getTeacherAverage.subjectname}</td>
                        <td>${getTeacherAverage.classteaching}</td>
                        <td>${getTeacherAverage.aboveaverage}</td>
                        <td>${getTeacherAverage.belowaverage}</td>
                     
                        
                    </tr>
             </c:forEach>
                </tbody>
            </table>
        </div>



        
        
        
        
    </div>
</div>

                        <script>
                            
                            
         var myBarChart = new Chart(ctx).Bar(data, option);
                            var data = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
        {
            label: "My First dataset",
            fillColor: "rgba(220,220,220,0.5)",
            strokeColor: "rgba(220,220,220,0.8)",
            highlightFill: "rgba(220,220,220,0.75)",
            highlightStroke: "rgba(220,220,220,1)",
            data: [65, 59, 80, 81, 56, 55, 40]
        },
        {
            label: "My Second dataset",
            fillColor: "rgba(151,187,205,0.5)",
            strokeColor: "rgba(151,187,205,0.8)",
            highlightFill: "rgba(151,187,205,0.75)",
            highlightStroke: "rgba(151,187,205,1)",
            data: [28, 48, 40, 19, 86, 27, 90]
        }
    ]
};
                            
                            
                            </script>