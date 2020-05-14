<jsp:include page="../COMMON/AbacusHeader.jsp" />

<center>
	<form id="abacusStartForm" action="abacusAddSubServlet" method="post">
		<table style="background-color: #F7F7F7; color: #333; height: 400px; width: 700px;">
			<thead><tr><th colspan="4">Welcome</th></tr></thead>
			<tr>
				<td colspan="2" width="50%;"><label  title="Enter your name:"><b>Enter your name:</b></label></td>
				<td colspan="2"><input type="text" name="yourName" size="20"><br></td>
			</tr>
			<tr>
				<td colspan="2"><label title="How many Equation to generate:"><b>Enter how many equations you want:(between 1 and 100)</b></label></td>
				<td colspan="2"><input type="number" name="numberOfSum" size="2" value="5" min="1" max="100"></td>
			</tr>
			<tr id="SelectMath1"  class="show " >
				<td colspan="2"><label title="How many numbers to generate:"><b>Enter how many numbers for addition you want:(between 1 and 20)</b></label></td>
				<td colspan="2"><input type="number" name="numberOfRow" size="2" value="5" min="1" max="20"></td>
			</tr>
			<tr>
				<th colspan="4" style="background-color: yellow;">
					<input type="radio" id="selectMath" name="selectMath" value="1" checked="checked">Addition & Subtraction (+ &-)
					<input type="radio" id="selectMath1" name="selectMath" value="2">Multiplication (X)
					<input type="radio" id="selectMath2" name="selectMath" value="3">Division (/)
					<input type="radio" id="selectMath3" name="selectMath" value="4">Multiplication Table
				</th>
			</tr>
			<tr id="SelectMath1" class="show">
				<th style="text-align: left;" colspan="2"><b>Select Type of Number you want to display :</b></th>
				<td colspan="2">
					<select id="selectDigit" name="selectDigit">
						<option value="1" selected="selected">1 Digit Positive Number</option>
						<option value="2">2 Digit Positive Number</option>
						<option value="3">3 Digit Positive Number</option>
						<option value="4">1 Digit Positive and Negative Number</option>
						<option value="5">2 Digit Positive and Negative Number</option>
			    		<option value="6">3 Digit Positive and Negative Number</option>
			    		<option value="7">Mix 1 and 2 Digit Positive Number</option>
			    		<option value="8">Mix 1 and 2 Digit Positive and Negative Number</option>
			    		<option value="9">Mix 1 and 2 and 3 Digit Positive Number</option>
			    		<option value="10">Mix 1 and 2 and 3 Digit Positive and Negative Number</option>
					</select>
				</td>
			</tr>
			<tr id="SelectMath2" class="show" style="display: none;">
					<td width="">
						<label title=""><b>Enter 1st Number Digits: (between 1 and 4)</b></label>
					</td>
					<td>
						<input type="number" name="firstNumberOfDigit" size="2" value="1" min="1" max="4">
					</td>
					<td>
						<label title=""><b>Enter 2nd Number Digits: (between 1 and 4)</b></label>
					</td>
					<td>
						<input type="number" name="secondNumberOfDigit" size="2" value="1" min="1" max="4">
					</td>
			</tr>
			<tr id="SelectMath4" class="show" style="display: none;">
					<td width="">
						<label title=""><b>Enter Multiplication Table From: (between 1 and 30)</b></label>
					</td>
					<td colspan="3">
						<input type="number" name="firstTable" size="2" value="2" min="2" max="30">
						<label title=""><b>To</b></label>
						<input type="number" name="lastTable" size="2" value="10" min="2" max="30">
					</td>
			</tr>
	    	<tr>
	    		<td colspan="4" style="text-align: center;"><br>
	    			<input type="submit" name="submitButton" id="submitButton1" value="Generate Abacus Descriptive" />
	    			<input type="submit" name="submitButton" id="submitButton2"  value="Generate Abacus" />
	    			<input type="submit" name="submitButton" id="submitButton3"  value="Play Abacus" />
	    			<input type="submit" name="submitButton" id="submitButton4" value="Sample Abcus Show" />
	    		</td>
	    	</tr>
		</table>
	</form>
</center>

		<!-- <script type="text/javascript">
	        function onLoad() {
	        	alert("hi");
	        	document.getElementById("btnExport").style.display === "none";
	        	alert("en");
	        }
	   </script> -->
<jsp:include page="../COMMON/AbacusFooter.jsp">
<jsp:param value="AbacusStartPage" name="PageName"/>
</jsp:include>
