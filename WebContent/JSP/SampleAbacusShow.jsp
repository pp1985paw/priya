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

<% ArrayList<Integer> numberList = (ArrayList<Integer>) request.getSession().getAttribute("NumberList"); 
	ArrayList<Integer> additionList = (ArrayList<Integer>) request.getSession().getAttribute("AdditionList"); 
%> <%--Assigning ArrayList object containing Employee data to the local object --%>

<%-- <strong><a href="<%=request.getContextPath()%>/IteratorExample?type=getDetails">Show Employee Details</a></strong> --%>
<br></br>
<form action="abacusAddSubServlet" method="post">

	Hello You want to show data.
	<%
		if(numberList != null)  // Null check for the object
		{ 
			Iterator<Integer> iterator = numberList.iterator();  // Iterator interface
			Iterator<Integer> iterator1 = additionList.iterator();
			Integer i=0;
			Integer j=0;
			//while(iterator.hasNext())  // iterate through all the data until the last record
			{
	%>
			<table id="tblAbacus" cellspacing="2" cellpadding="2" border="1">
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
			</table>
				
				<%
			}
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