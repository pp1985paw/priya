<% 
boolean condition = false;	
	  if(!condition) { %>
			<jsp:include page="../COMMON/AbacusHeader.jsp" />
			<% } %>
			<style type="text/css">
				   table tr
				   {
				   	text-align: center;
				   }
				   
				    .sticky{
				        position: sticky;
				        top: 0;
				    }
			</style>
		
		
		<%@page import="java.util.ArrayList"%>      <%--Importing all the dependent classes--%>
		<%@page import="java.util.Iterator"%> 

	<% 	ArrayList<String> numberList = (ArrayList<String>) request.getSession().getAttribute("NumberList"); 
		ArrayList<String> quotientList = (ArrayList<String>) request.getSession().getAttribute("QuotientList"); 
	%>
<center>
	<form action="abacusDivisionServlet" method="post">
		<% 
	  		if(!condition) { %>
		<input type="submit" name="home" value="Back to Home" onclick="form.action='homeServlet';" />
		<input type="submit" name="showMoreData" value="Show More Data" />	
		<br><br>
		
		<% }
			if(numberList!=null && quotientList!=null && !numberList.isEmpty())
			{
				%>
				<div class="tableFixHead">
				<table id="tblAbacus" cellspacing="2" cellpadding="2" border="1">
				<thead>
					<tr>
						<td style="background-color: blue; text-align: left; padding-left: 44%;" colspan="<%=(5*4)%>">
							<h3>ABACUS</h3>
						</td>
					</tr>
				</thead>
				<thead>
					<tr>
					<% 
					for(int numberArrays=0; numberArrays<5; numberArrays++) 
					{  
						if(numberArrays == 0) {%>
							<th style="background-color: yellow; "></th>
							<th style="background-color: yellow;" colspan="3"><%=numberArrays+1 %></th>
						<% } else { %>
							<th style="background-color: yellow; " colspan="4"><%=numberArrays+1 %></th>
					<% 		}
					} %>
					</tr>
				</thead>
				<thead>
					<tr>
					<% 
					for(int numberArrays=0; numberArrays<5; numberArrays++) 
					{  
						if(numberArrays == 0) {%>
							<th style="background-color: gray; ">No.</th>
							<th style="background-color: gray;">Dividend / Divisor =</th>
							<th style="background-color: gray;font-size: 8px;font-weight: 800;">Quotient</th>
							<th style="background-color: gray;font-size: 8px;font-weight: 800;">Remainder</th>
						<% } else { %>
							<th style="background-color: gray; ">No.</th>
							<th style="background-color: gray; ">Dividend / Divisor =</th>
							<th style="background-color: gray;font-size: 8px;font-weight: 800;">Quotient</th>
							<th style="background-color: gray;font-size: 8px;font-weight: 800;">Remainder</th>
					<% 		}
					} %>
					</tr>
				</thead>
				<tbody>
				<%
					Iterator<String> iterator = numberList.iterator();  // Iterator interface
					Iterator<String> iterator1 = quotientList.iterator();
					int columnCount=0, rowCount=0, rowColumnCount=0, numLstSize=numberList.size();
					String strQuotientRemainder=" / " ;
					while(iterator.hasNext())  // iterate through all the data until the last record
					{
						strQuotientRemainder = iterator1.next();
						if(columnCount==0 || (columnCount%5 == 0)) {
							rowColumnCount= (numLstSize%5 == 0) ? (numLstSize/5): ((numLstSize/5)+1);
							columnCount=0;
							if (columnCount!=0) {
								%>
								</tr>
							<%} %>
								<tr>
								<th style="width: 5%; background-color: gray; "><%=++rowCount %></th>
								<td class="displayNumberStyle1"><%=iterator.next()%></td>
								<td class="displayNumberStyle5"><%=strQuotientRemainder.split("/")[0]%></td>
								<td class="displayNumberStyle5"><%=strQuotientRemainder.split("/")[1]%></td>
							<%
						} else {
							%>
							<th style="width: 5%; background-color: gray; "><%=rowColumnCount+rowCount %></th>
							<td class="displayNumberStyle1" colspan=""><%=iterator.next()%></td>
							<td class="displayNumberStyle5"><%=strQuotientRemainder.split("/")[0]%></td>
							<td class="displayNumberStyle5"><%=strQuotientRemainder.split("/")[1]%></td>
						<%
						}
						columnCount++;
						if(columnCount>1) {
							if(columnCount > (numLstSize%5)) { 
								rowColumnCount=rowColumnCount+(numLstSize/5);
							} else {
								rowColumnCount=rowColumnCount+(numLstSize/5)+1;
							}
						}
					}
				%>
					</tr>
					</tbody>
				</table>
				</div>
				<%
			}
		%>
		</form>
</center>

<% 
	  		if(!condition) { %>
			<jsp:include page="../COMMON/AbacusFooter.jsp">
			<jsp:param value="AbacusAddSubShowPage" name="PageName"/>
			</jsp:include>
<% }%>