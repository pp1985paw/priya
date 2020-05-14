<% 
boolean condition = ("AbacusAddSubShowDescriptivePage".equals(request.getParameter("PageName")));	
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

	<% ArrayList<ArrayList<Integer>> numberList = (ArrayList<ArrayList<Integer>>) request.getSession().getAttribute("NumberList"); 
		ArrayList<ArrayList<Integer>> additionList = (ArrayList<ArrayList<Integer>>) request.getSession().getAttribute("AdditionList"); 
	%>
<center>
	<form action="abacusAddSubServlet" method="post">
		<% 
	  		if(!condition) { %>
		<input type="submit" name="home" value="Back to Home" onclick="form.action='homeServlet';" />
		<input type="submit" name="showMoreData" value="Show More Data" />	
		<input type="button" id="showHideDescriptiveAnswerButton" value="Show Descriptive Answer" onclick="showHideDescriptiveAnswer('AbacusAddSubShowPage')" />
		<br><br>
		
		<% }
			if(numberList!=null && additionList!=null)
			{
				%>
				<div class="tableFixHead">
				<table id="tblAbacus" cellspacing="2" cellpadding="2" border="1">
				<% ArrayList<Integer> temp = additionList.get(additionList.size()-1); %>
				<thead>
					<tr>
						<td colspan=<%=temp.size()+1%> style="background-color: blue; text-align: left; padding-left: 44%;">
							<h3>ABACUS</h3>
						</td>
					</tr>
				</thead>
				<thead>
					<tr>
					<% 
					for(int numberArrays=0; numberArrays<temp.size(); numberArrays++) 
					{  
						if(numberArrays == 0) {%>
							<th style="background-color: yellow; ">No.</th>
							<th style="background-color: yellow;">SUM<%=numberArrays %></th>
						<% } else { %>
							<th style="background-color: yellow; ">SUM<%=numberArrays %></th>
					<% 		}
					} %>
					</tr>
				</thead>
				<tbody>
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
										<th style="width: 5%; background-color: yellow; "><%=numberArrays+1 %></th>
										<td class="displayNumberStyle1"><%=iterator.next()%></td>
									<%
									} else {
										%>
										<td class="displayNumberStyle1"><%=iterator.next()%></td>
									<%
									}
								} else { 
									
									if(i==0) {
										%>
										<th style="width: 5%; background-color: yellow; "><%=++numberArrays %></th>
										<td class="displayNumberStyle1"><%=iterator.next()%></td>
									<%
									} else {
										%>
										<td class="displayNumberStyle1"><%=iterator.next()%></td>
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
					</tbody>
					<tfoot >
					<tr>
					<% 
					for(int numberArrays=0; numberArrays<temp.size(); numberArrays++) 
					{  if(numberArrays == 0) {%>
							<th style="background-color: gray;">Total</th>
							<th style="background-color: aqua;"><%=temp.get(numberArrays) %></th>
					<% } else { %>
							<th style="background-color: aqua;"><%=temp.get(numberArrays) %></th>
					<% }
					} %>
					</tr>
					
				</tfoot>
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