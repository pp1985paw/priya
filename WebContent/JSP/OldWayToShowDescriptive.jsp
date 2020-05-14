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
	
	
	
	
	
	
	
	
	
	
	<br><br><br>
	old table
	<br><br>
	
	
	<%
		if(numberList != null)  // Null check for the object
		{
			%>
			<table id="tblAbacus" cellspacing="2" cellpadding="2" border="1">
				<tr><% 
					for(int numberArrays=0; numberArrays<numberList.size(); numberArrays++) { %>
						<th>SUM<%=numberArrays %></th>
					<% } %>
				</tr>
				<tr>
			<%
			for(int numberArrays=0; numberArrays<numberList.size(); numberArrays++) 
			{
				if(numberList.get(numberArrays) !=null) 
				{
					Iterator<Integer> iterator = numberList.get(numberArrays).iterator();  // Iterator interface
					Iterator<Integer> iterator1 = additionList.get(numberArrays).iterator();
					Integer i=0;
			%>
							<td>
								<table id="tblAbacus<%=numberArrays %>" cellspacing="2" cellpadding="2" border="1">
								
									<tr>
										<th>        </th>
										<th>Number</th>
										<th>Row</th>
										<th>Row Addition</th></tr>
									<%
									
											//if(numberList != null)  // Null check for the object
											{ 
													//Iterator<Integer> iterator = numberList.iterator();  // Iterator interface
													//Iterator<Integer> iterator1 = additionList.iterator();
													//Integer i=0;
													while(iterator.hasNext())  // iterate through all the data until the last record
													{
													%>
													<tr>
														<td><%=++i %></td>
														<td><%=iterator.next()%></td>
														<% if(i!=1){ %>
														<td><%="1 to "+i %></td>
														<td><%=iterator1.next()%></td>
														<% } else { iterator1.next(); %>
														<td></td>
														<td></td>
														<% } %>
													</tr>
													<%
													}%>
													
													<tr>
														<td style="font: bolder;">Total</td>
														<td><%=additionList.get(numberArrays).get(additionList.get(numberArrays).size()-1)%></td>
														<td></td>
														<td></td>
													</tr>
												<%
											}
									%>
								</table>
							</td>
						<%
				}
			}
			%>
			</tr>
			</table>
			<%
		}
		%>

<input type="submit" value="More" />	
</form>
<br />
    <input type="button" id="btnExport" value="Export" onclick="Export()" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="table2excel.js" type="text/javascript"></script>
    <script type="text/javascript">
        function Export() {
            $("#tblAbacus").table2excel({
                filename: "Table.xls"
            });
        }
    </script>
</body>
</html>