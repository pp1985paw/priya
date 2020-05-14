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
		ArrayList<Integer> quotientList = (ArrayList<Integer>) request.getSession().getAttribute("QuotientList"); 
	%>
<center>
	<form action="abacusDivisionServlet" method="post">
		<% 
	  		if(!condition) { %>
		<input type="submit" name="home" value="Back to Home" onclick="form.action='homeServlet';" />
		<input type="submit" name="showMoreData" value="Play More" />
		<input type="button" name="button" id="showHideAnswerButton" value="Show Answer" onclick="showHideAnswer('input.hiddenClass')"/>
		<br><br>
		
		<% }
			if(numberList!=null && quotientList!=null && !numberList.isEmpty())
			{
				%>
				<div class="tableFixHead" style="width: 1200px;">
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
							<th style="background-color: gray;">Quotient</th>
							<th style="background-color: gray;">Remainder</th>
						<% } else { %>
							<th style="background-color: gray; ">No.</th>
							<th style="background-color: gray; ">Dividend / Divisor =</th>
							<th style="background-color: gray;">Quotient</th>
							<th style="background-color: gray;">Remainder</th>
					<% 		}
					} %>
					</tr>
				</thead>
				<tbody>
				<%
					Iterator<String> iterator = numberList.iterator();  // Iterator interface
					Iterator<Integer> iterator1 = quotientList.iterator();
					int columnCount=0, rowCount=0, rowColumnCount=0, numLstSize=numberList.size();
					
					while(iterator.hasNext())  // iterate through all the data until the last record
					{
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
								<td class="displayNumberStyle4" colspan="2">
									<input type="number"  class="numberInputTagStyle" id="quotient<%=rowCount %>" onblur="checkValue(this,'hiddenQuotient<%=rowCount %>')">
									<input disabled type="text" style="display: none;" class="hiddenClass numberInputTagStyle" id="hiddenQuotient<%=rowCount %>" value="<%=iterator1.next()%>">
								</td>
							<%
						} else {
							%>
							<th style="width: 5%; background-color: gray; "><%=rowColumnCount+rowCount %></th>
							<td class="displayNumberStyle1"><%=iterator.next()%></td>
							<td class="displayNumberStyle4" colspan="2">
								<input type="number"  class="numberInputTagStyle" id="quotient<%=rowColumnCount+rowCount %>" onblur="checkValue(this,'hiddenQuotient<%=rowColumnCount+rowCount %>')">
								<input disabled type="text" style="display: none;" class="hiddenClass numberInputTagStyle" id="hiddenQuotient<%=rowColumnCount+rowCount %>" value="<%=iterator1.next()%>">
							</td>
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