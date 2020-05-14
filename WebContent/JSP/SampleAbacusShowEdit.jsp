<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ABACUS</title>
<style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        table
        {
            border: 1px solid #ccc;
            border-collapse: collapse;
        }
        table th
        {
            background-color: #F7F7F7;
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>

<%@page import="java.util.ArrayList"%>      <%--Importing all the dependent classes--%>
<%@page import="java.util.Iterator"%> 

<% ArrayList<ArrayList<Integer>> numberList = (ArrayList<ArrayList<Integer>>) request.getSession().getAttribute("NumberList"); 
ArrayList<ArrayList<Integer>> additionList = (ArrayList<ArrayList<Integer>>) request.getSession().getAttribute("AdditionList"); 
%> <%--Assigning ArrayList object containing Employee data to the local object --%>

<%-- <strong><a href="<%=request.getContextPath()%>/IteratorExample?type=getDetails">Show Employee Details</a></strong> --%>
<br></br>
<form action="abacusAddSubServlet" method="post">

 <div id="content">
	Hello You want to show data.
	
<%
	if(numberList!=null && additionList!=null)
	{
		%>
		<table id="tblAbacus" cellspacing="2" cellpadding="2" border="1">
		<thead>
			<tr>
			<% 
			ArrayList<Integer> temp = additionList.get(additionList.size()-1);
			
			for(int numberArrays=0; numberArrays<temp.size(); numberArrays++) 
			{ %>
					<th colspan="4">SUM<%=numberArrays %></th>
			<% 
			} %>
			</tr>
			<tr>
			<% 
			for(int numberArrays=0; numberArrays<temp.size(); numberArrays++) 
			{  
				if(numberArrays == 0) {%>
					<th>        </th>
					<th>Number</th>
					<th>Row</th>
					<th>Row Addition</th>
				<% } else { %>
					<th colspan="2">Number</th>
					<th>Row</th>
					<th>Row Addition</th>
			<% 		}
			} %>
			</tr>
			
			<%
			for(int numberArrays=0; numberArrays<numberList.size(); ) 
			{
				if(numberList.get(numberArrays) !=null) 
				{
					Iterator<Integer> iterator = numberList.get(numberArrays).iterator();  // Iterator interface
					Iterator<Integer> iterator1 = additionList.get(numberArrays).iterator();
					Integer i=0, totalSum;
					%>
					<tr>
					<%
					while(iterator.hasNext())  // iterate through all the data until the last record
					{
						if(numberArrays == 0) {
							if(i==0) {
								%>
								<th><%=numberArrays+1 %></th>
								<td><%=iterator.next()%></td>
								<td></td>
								<td></td>
							<%
							} else {
								%>
								<td colspan="2"><%=iterator.next()%></td>
								<td></td>
								<td></td>
							<%
							}
						} else { 
							
							if(i==0) {
								%>
								<th><%=++numberArrays %></th>
								<td><%=iterator.next()%></td>
								<td><%="1 to "+numberArrays %></td>
								<td><%=iterator1.next() %></td>
							<%
							} else {
								%>
								<td colspan="2"><%=iterator.next()%></td>
								<td><%="1 to "+ numberArrays %></td>
								<td><%=iterator1.next() %></td>
							<%
							}
						}
						i++;
					}
					
					if(numberArrays == 0) { 
						++numberArrays;
					}%>
					</tr>
				<%}
			}
			%>
			<tr>
			<% 
			for(int numberArrays=0; numberArrays<temp.size(); numberArrays++) 
			{  if(numberArrays == 0) {%>
					<th>Total</th>
					<th><%=temp.get(numberArrays) %></th>
					<td colspan="2"></td>
			<% } else { %>
					<th colspan="2"><%=temp.get(numberArrays) %></th>
					<td colspan="2"></td>
			<% }
			} %>
			</tr>
			
		</thead>
		</table>
		
		<%
	}

%>	
	
	<br><br><br>Sample hardcoded Table <br>
	
	<table id="tblAbacus1" cellspacing="2" cellpadding="2" border="1">
		<thead>
			<tr>
				<th colspan="4">A</th>
				<th colspan="4">B</th>
				<th colspan="4">C</th>
				<th colspan="4">D</th>
			</tr>
			<tr>
				<th>        </th>
				<th>Number</th>
				<th>Row</th>
				<th>Row Addition</th>
				<th colspan="2">Number</th>
				<th>Row</th>
				<th>Row Addition</th>
				<th colspan="2">Number</th>
				<th>Row</th>
				<th>Row Addition</th>
				<th colspan="2">Number</th>
				<th>Row</th>
				<th>Row Addition</th>
			</tr>
			<tr>
				<th>1</th>
				<td>9</td>
				<td></td>
				<td></td>
				<!-- 2nd data -->
				<td  colspan="2">7</td>
				<td></td>
				<td></td>
				<!-- 3rd Data -->
				<td colspan="2">7</td>
				<td></td>
				<td></td>
				<!-- 4th Data -->
				<td colspan="2">9</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<th>2</th>
				<td>8</td>
				<td>1 to 2</td>
				<td>17</td>
				
				<td colspan="2">8</td>
				<td>1 to 2</td>
				<td>15</td>
				
				<td colspan="2">8</td>
				<td>1 to 2</td>
				<td>17</td>
				
				<td colspan="2">8</td>
				<td>1 to 2</td>
				<td>15</td>
			</tr>
			<tr>
				<th>3</th>
				<td>9</td>
				<td>1 to 3</td>
				<td>26</td>
				
				<td  colspan="2">4</td>
				<td>1 to 3</td>
				<td>19</td>
				
				<td colspan="2">9</td>
				<td>1 to 3</td>
				<td>26</td>
				
				<td colspan="2">4</td>
				<td>1 to 3</td>
				<td>19</td>
				
			</tr>
			<tr>
				<th>4</th>
				<td>4</td>
				<td>1 to 4</td>
				<td>30</td>
				
				<td colspan="2">6</td>
				<td>1 to 4</td>
				<td>25</td>
				
				<td colspan="2">4</td>
				<td>1 to 4</td>
				<td>30</td>
				
				<td colspan="2">6</td>
				<td>1 to 4</td>
				<td>25</td>
			</tr>
			<tr>
				<th>5</th>
				<td>6</td>
				<td>1 to 5</td>
				<td>36</td>
				
				<td colspan="2">3</td>
				<td>1 to 5</td>
				<td>28</td>
				
				<td colspan="2">6</td>
				<td>1 to 5</td>
				<td>36</td>
				
				<td colspan="2">3</td>
				<td>1 to 5</td>
				<td>28</td>
			</tr>
			<tr>
				<th>6</th>
				<td>5</td>
				<td>1 to 6</td>
				<td>41</td>
				
				<td colspan="2">6</td>
				<td>1 to 6</td>
				<td>34</td>
				
				<td colspan="2">5</td>
				<td>1 to 6</td>
				<td>41</td>
				
				<td colspan="2">6</td>
				<td>1 to 6</td>
				<td>34</td>
			</tr>
			<tr>
				<th>7</th>
				<td>5</td>
				<td>1 to 7</td>
				<td>46</td>
				
				<td colspan="2">1</td>
				<td>1 to 7</td>
				<td>35</td>
				
				<td colspan="2">5</td>
				<td>1 to 7</td>
				<td>46</td>
				
				<td colspan="2">1</td>
				<td>1 to 7</td>
				<td>35</td>
			</tr>
			<tr>
				<th>8</th>
				<td>4</td>
				<td>1 to 8</td>
				<td>50</td>
				
				<td  colspan="2">0</td>
				<td>1 to 8</td>
				<td>35</td>
				
				<td colspan="2">4</td>
				<td>1 to 8</td>
				<td>50</td>
				
				<td colspan="2">0</td>
				<td>1 to 8</td>
				<td>35</td>
			</tr>
			<tr>
				<th>9</th>
				<td>9</td>
				<td>1 to 9</td>
				<td>59</td>
				
				<td colspan="2">6</td>
				<td>1 to 9</td>
				<td>41</td>
				
				<td colspan="2">9</td>
				<td>1 to 9</td>
				<td>59</td>
				
				<td colspan="2">6</td>
				<td>1 to 9</td>
				<td>41</td>
			</tr>
			<tr>
				<th>10</th>
				<td>6</td>
				<td>1 to 10</td>
				<td>65</td>
				
				<td colspan="2">8</td>
				<td>1 to 10</td>
				<td>49</td>
				
				<td colspan="2">6</td>
				<td>1 to 10</td>
				<td>65</td>
				
				<td colspan="2">8</td>
				<td>1 to 10</td>
				<td>49</td>
			</tr>
			<tr>
				<th>Total</th>
				<th>65</th>
				<td></td>
				<td></td>
				
				<th colspan="2">49</th>
				<td></td>
				<td></td>
				
				<th colspan="2">65</th>
				<td></td>
				<td></td>
				
				<th colspan="2">49</th>
				<td></td>
				<td></td>
			</tr>
		</thead>
	</table>
	
	<br><br>
	Original
	<br><br>
	
	<!-- <table id="tblAbacus" cellspacing="2" cellpadding="2" border="1">
				<tr>
				<th>A</th>
				<th>B</th>
				<th>C</th>
				<th>D</th>
				</tr>
				<tr>
					<td> 
						<table id="tblAbacus1" cellspacing="2" cellpadding="2" border="1">
							<tr>
								<th>        </th>
								<th>Number</th>
								<th>Row</th>
								<th>Row Addition</th>
							</tr>
							<tr>
								<td>1</td>
								<td>9</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>2</td>
								<td>8</td>
								<td>1 to 2</td>
								<td>17</td>
							</tr>
							<tr>
								<td>3</td>
								<td>9</td>
								<td>1 to 3</td>
								<td>26</td>
							</tr>
							<tr>
								<td>4</td>
								<td>4</td>
								<td>1 to 4</td>
								<td>30</td>
							</tr>
							<tr>
								<td>5</td>
								<td>6</td>
								<td>1 to 5</td>
								<td>36</td>
							</tr>
							<tr>
								<td>6</td>
								<td>5</td>
								<td>1 to 6</td>
								<td>41</td>
							</tr>
							<tr>
								<td>7</td>
								<td>5</td>
								<td>1 to 7</td>
								<td>46</td>
							</tr>
							<tr>
								<td>8</td>
								<td>4</td>
								<td>1 to 8</td>
								<td>50</td>
							</tr>
							<tr>
								<td>9</td>
								<td>9</td>
								<td>1 to 9</td>
								<td>59</td>
							</tr>
							<tr>
								<td>10</td>
								<td>6</td>
								<td>1 to 10</td>
								<td>65</td>
							</tr>
							<tr>
								<td style="font: bolder;">Total</td>
								<td>65</td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</td>
					<td>
						<table id="tblAbacus2" cellspacing="2" cellpadding="2" border="1">
							<tr>
								<th>        </th>
								<th>Number</th>
								<th>Row</th>
								<th>Row Addition</th>
							</tr>
							<tr>
								<td>1</td>
								<td>9</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>2</td>
								<td>8</td>
								<td>1 to 2</td>
								<td>17</td>
							</tr>
							<tr>
								<td>3</td>
								<td>9</td>
								<td>1 to 3</td>
								<td>26</td>
							</tr>
							<tr>
								<td>4</td>
								<td>4</td>
								<td>1 to 4</td>
								<td>30</td>
							</tr>
							<tr>
								<td>5</td>
								<td>6</td>
								<td>1 to 5</td>
								<td>36</td>
							</tr>
							<tr>
								<td>6</td>
								<td>5</td>
								<td>1 to 6</td>
								<td>41</td>
							</tr>
							<tr>
								<td>7</td>
								<td>5</td>
								<td>1 to 7</td>
								<td>46</td>
							</tr>
							<tr>
								<td>8</td>
								<td>4</td>
								<td>1 to 8</td>
								<td>50</td>
							</tr>
							<tr>
								<td>9</td>
								<td>9</td>
								<td>1 to 9</td>
								<td>59</td>
							</tr>
							<tr>
								<td>10</td>
								<td>6</td>
								<td>1 to 10</td>
								<td>65</td>
							</tr>
							<tr>
								<td style="font: bolder;">Total</td>
								<td>65</td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</td>
					<td>
						<table id="tblAbacus3" cellspacing="2" cellpadding="2" border="1">
							<tr>
								<th>        </th>
								<th>Number</th>
								<th>Row</th>
								<th>Row Addition</th>
							</tr>
							<tr>
								<td>1</td>
								<td>9</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>2</td>
								<td>8</td>
								<td>1 to 2</td>
								<td>17</td>
							</tr>
							<tr>
								<td>3</td>
								<td>9</td>
								<td>1 to 3</td>
								<td>26</td>
							</tr>
							<tr>
								<td>4</td>
								<td>4</td>
								<td>1 to 4</td>
								<td>30</td>
							</tr>
							<tr>
								<td>5</td>
								<td>6</td>
								<td>1 to 5</td>
								<td>36</td>
							</tr>
							<tr>
								<td>6</td>
								<td>5</td>
								<td>1 to 6</td>
								<td>41</td>
							</tr>
							<tr>
								<td>7</td>
								<td>5</td>
								<td>1 to 7</td>
								<td>46</td>
							</tr>
							<tr>
								<td>8</td>
								<td>4</td>
								<td>1 to 8</td>
								<td>50</td>
							</tr>
							<tr>
								<td>9</td>
								<td>9</td>
								<td>1 to 9</td>
								<td>59</td>
							</tr>
							<tr>
								<td>10</td>
								<td>6</td>
								<td>1 to 10</td>
								<td>65</td>
							</tr>
							<tr>
								<td style="font: bolder;">Total</td>
								<td>65</td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</td>
					<td>
						<table id="tblAbacus" cellspacing="2" cellpadding="2" border="1">
							<tr>
								<th>        </th>
								<th>Number</th>
								<th>Row</th>
								<th>Row Addition</th>
							</tr>
							<tr>
								<td>1</td>
								<td>9</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>2</td>
								<td>8</td>
								<td>1 to 2</td>
								<td>17</td>
							</tr>
							<tr>
								<td>3</td>
								<td>9</td>
								<td>1 to 3</td>
								<td>26</td>
							</tr>
							<tr>
								<td>4</td>
								<td>4</td>
								<td>1 to 4</td>
								<td>30</td>
							</tr>
							<tr>
								<td>5</td>
								<td>6</td>
								<td>1 to 5</td>
								<td>36</td>
							</tr>
							<tr>
								<td>6</td>
								<td>5</td>
								<td>1 to 6</td>
								<td>41</td>
							</tr>
							<tr>
								<td>7</td>
								<td>5</td>
								<td>1 to 7</td>
								<td>46</td>
							</tr>
							<tr>
								<td>8</td>
								<td>4</td>
								<td>1 to 8</td>
								<td>50</td>
							</tr>
							<tr>
								<td>9</td>
								<td>9</td>
								<td>1 to 9</td>
								<td>59</td>
							</tr>
							<tr>
								<td>10</td>
								<td>6</td>
								<td>1 to 10</td>
								<td>65</td>
							</tr>
							<tr>
								<td style="font: bolder;">Total</td>
								<td>65</td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
			</table> -->

<input type="submit" value="More" />	
</div>
</form>
<br />
    <input type="button" id="btnExportEXEL" value="ExportEXEL" onclick="ExportEXCEL()" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="table2excel.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ExportEXCEL() {
            $("#tblAbacus").table2excel({
                filename: "Table.xls"
            });
        }
    </script>
    
    <input type="button" id="btnExportPDF" value="ExportPDF" onclick="exportPDF1()" />
    <!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script> -->
    <script type="text/javascript">
        /* function ExportPDF() {
            html2canvas(document.getElementById('tblAbacus'), {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 500
                        }]
                    };
                    pdfMake.createPdf(docDefinition).download("Table.pdf");
                }
            });
        } */
        
        
        var specialElementHandlers = {
        		  // element with id of "bypass" - jQuery style selector
        		  '.no-export': function(element, renderer) {
        		    // true = "handled elsewhere, bypass text extraction"
        		    return true;
        		  }
        		};

        function exportPDF1() {

        	  var doc = new jsPDF('p', 'pt', 'a4');
        	  //A4 - 595x842 pts
        	  //https://www.gnu.org/software/gv/manual/html_node/Paper-Keywords-and-paper-size-in-points.html


        	  //Html source 
        	  var source = document.getElementById('tblAbacus').innerHTML;

        	  var margins = {
        	    top: 10,
        	    bottom: 10,
        	    left: 10,
        	    width: 595
        	  };

        	  doc.fromHTML(
        	    source, // HTML string or DOM elem ref.
        	    margins.left,
        	    margins.top, {
        	      'width': margins.width,
        	      'elementHandlers': specialElementHandlers
        	    },

        	    function(dispose) {
        	      // dispose: object with X, Y of the last line add to the PDF 
        	      //          this allow the insertion of new lines after html
        	      doc.save('Test.pdf');
        	    }, margins);
        	}

        
        function createPDF() {
            var sTable = document.getElementById('tblAbacus').innerHTML;

        
        var style1 = "<style>";
        style1 = style1 + "body{ font-family: Arial;font-size: 10pt;}";
        style1 = style1 + "table {width: 100%;border: 1px solid #ccc; border-collapse: collapse;}";
        style1 = style1 + "table th { background-color: #F7F7F7; color: #333; font-weight: bold;}";
        style1 = style1 + "table th, table td { padding: 5px; border: 1px solid #ccc; }";
        style1 = style1 + "</style>";
        
            var style = "<style>";
            style = style + "table {width: 100%;font: 17px Calibri;}";
            style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
            style = style + "padding: 2px 3px;text-align: center;}";
            style = style + "</style>";

            // CREATE A WINDOW OBJECT.
            var win = window.open('', '', 'height=700,width=700');

            win.document.write('<html><head>');
            win.document.write('<title>Profile</title>');   // <title> FOR PDF HEADER.
            win.document.write(style1);          // ADD STYLE INSIDE THE HEAD TAG.
            win.document.write('</head>');
            win.document.write('<body>');
            win.document.write(sTable);         // THE TABLE CONTENTS INSIDE THE BODY TAG.
            win.document.write('</body></html>');

            win.document.close(); 	// CLOSE THE CURRENT WINDOW.

            win.print();    // PRINT THE CONTENTS.
        }
    </script>
    
</body>
</html>