	  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	  <% 
	  if(!("AbacusStartPage".equals(request.getParameter("PageName")))) { %>
		  <br>
		   <center><input type="button" id="btnExport" value="Export Data To Exel" onclick="Export()" /></center>
		   <script src="table2excel.js" type="text/javascript"></script>
		   <script type="text/javascript">
		   
		        function Export() {
		            $("#tblAbacus").table2excel({
		                filename: "Table.xls"
		            });
		        }
		        
		        function checkValue(enteredValueObj, hiddenFieldId) {
		        	var x = document.getElementById(hiddenFieldId);
		        	if(enteredValueObj != null && enteredValueObj.value != x.value) {
		        		enteredValueObj.style.background = "red";
		        	} else {
		        		enteredValueObj.style.background = "#00FF00";
		        	}
		        }
		        
		        function showHideAnswer(obj) {
		        	$(obj).toggle();
		        	var elem = document.getElementById("showHideAnswerButton");
		            if (elem.value=="Show Answer") {
		            	elem.value = "Hide Answer";
		            } else {
		            	elem.value = "Show Answer";
		            }
		        }
		        
		        var showOnlyNumberCount = 0;
		        function showHideOnlyNumber(pageName) {
		        	var elem = document.getElementById("showHideOnlyNumberButton");
		        	if(showOnlyNumberCount == 0) {
		        		document.getElementById("addSubOnlyNumberDataHead").innerHTML = '<h1 style="text-align: center;">Only Number Data</h1>';
		        		$('#addSubOnlyNumberData').load( "JSP/AbacusAddSubShow.jsp?PageName="+pageName  );
		        		$("#addSubOnlyNumberDataHead").toggle();
		        		$("#addSubOnlyNumberData").toggle();
		        		elem.value = "Hide Only Number Data";
		        		showOnlyNumberCount++;
		        	} else {
		        		if("Show Only Number" == elem.value) {
		        			$("#addSubOnlyNumberDataHead").toggle();
			        		$("#addSubOnlyNumberData").toggle();
		        			elem.value = "Hide Only Number Data";
		        		} else {
		        			$("#addSubOnlyNumberDataHead").toggle();
			        		$("#addSubOnlyNumberData").toggle();
		        			elem.value = "Show Only Number"
		        		}
		        	}
		        }
		        
		        var showDescriptiveCount = 0;
		        function showHideDescriptiveAnswer(pageName) {
		        	var elem = document.getElementById("showHideDescriptiveAnswerButton");
		        	if(showDescriptiveCount == 0) {
		        		document.getElementById("addSubDescriptiveDataHead").innerHTML = '<h1 style="text-align: center;">Descriptive Data</h1>';
		        		$('#addSubDescriptiveData').load( "JSP/AbacusAddSubShowDescriptive.jsp?PageName="+pageName  );
		        		$("#addSubDescriptiveDataHead").toggle();
		        		$("#addSubDescriptiveData").toggle();
		        		elem.value = "Hide Descriptive Answer";
		        		showDescriptiveCount++;
		        	} else {
		        		if("Show Descriptive Answer" == elem.value) {
		        			$("#addSubDescriptiveDataHead").toggle();
			        		$("#addSubDescriptiveData").toggle();
		        			elem.value = "Hide Descriptive Answer";
		        		} else {
		        			$("#addSubDescriptiveDataHead").toggle();
			        		$("#addSubDescriptiveData").toggle();
		        			elem.value = "Show Descriptive Answer"
		        		}
		        	}
		        }
		   </script>
		  <br>
	  <% }  else {%>
	  	<script>
	  	
	  	$(document).ready(function(){ 
		    $("input[name$='selectMath']").click(function() {
		        var mathType = $(this).val();
		        $("tr.show").hide();
		        $("#SelectMath"+((mathType == 3) ? 2 :mathType)+"*").show();
		        
		        $('[name="submitButton"]').show();
		        $("#submitButton2").attr("value", "Generate Abacus");
		        var action = "abacusAddSubServlet";
				switch (mathType) {
				case '2': 
					$("#submitButton1").hide(); // MULTIPLICATION
					action = "abacusMultiplicationServlet";
					break;
				case '3': 
					$("#submitButton1").hide(); // DIVISION
					action = "abacusDivisionServlet";
					break;
				case '4': 
					$("#submitButton1, #submitButton3, #submitButton4").hide(); // Multiplication Table
					$("#submitButton2").attr("value", "Generate Tables");
					action = "abacusMultiplicationTableServlet";
					break;
				default:
					break;
				}
				$("#abacusStartForm").attr("action", action);
		    }); 
		});
	  	
	  	</script>
	  	
	  <% } %>
      <center>
         <p>Copyright © 2020</p>
      </center>
   </body>
</html>