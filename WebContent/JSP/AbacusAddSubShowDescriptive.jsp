<% 
boolean condition = ("PlayAbacusAddSubShowPage".equals(request.getParameter("PageName"))
		  				|| "AbacusAddSubShowPage".equals(request.getParameter("PageName")));	
	  if(!condition) { %>
		<jsp:include page="../COMMON/AbacusHeader.jsp" />
		<% } %>
		<%@page import="java.util.ArrayList"%>      <%--Importing all the dependent classes--%>
		<%@page import="java.util.Iterator"%> 
		
		<% ArrayList<ArrayList<Integer>> numberList = (ArrayList<ArrayList<Integer>>) request.getSession().getAttribute("NumberList"); 
			ArrayList<ArrayList<Integer>> additionList = (ArrayList<ArrayList<Integer>>) request.getSession().getAttribute("AdditionList"); 
		%> 
	<center>
		<form id="form1" action="abacusAddSubServlet" method="post">
		<% 
	  		if(!condition) { %>
				<input type="submit" name="home" value="Back to Home" onclick="form.action='homeServlet';" />
				<input type="submit" name="showMoreData" value="Show More Descriptive Data" />
				<input type="button" id="showHideOnlyNumberButton" value="Show Only Number" onclick="showHideOnlyNumber('AbacusAddSubShowDescriptivePage')" />
		
			<br><br>
		 <% }
			if(numberList!=null && additionList!=null)
			{
				%>
				<div class="tableFixHead">
				<table id="tblAbacus" cellspacing="2" cellpadding="2" border="1">
				<thead>
				<% ArrayList<Integer> temp = additionList.get(additionList.size()-1); %>
				
					<tr>
						<td colspan=<%=temp.size()*3+1%> style="background-color: blue; text-align: left; padding-left: 15%;">
						<h3>ABACUS</h3></td>
					</tr>
				
					<tr>
					<% 
					
					for(int numberArrays=0; numberArrays<temp.size(); numberArrays++) 
					{  
						if(numberArrays == 0) {%>
							<th>        </th>
							<th colspan="3" style="background-color: yellow;">SUM<%=numberArrays %></th>
						<% } else {
								if(numberArrays % 2 == 0) { %>
									<th colspan="3" style="background-color: yellow;">SUM<%=numberArrays %></th>
								<%} else { %>
									<th colspan="3">SUM<%=numberArrays %></th>
								<%}
							%>
					<% 		}
					} %>
					</tr>
					
					
					<tr>
					<% 
					for(int numberArrays=0; numberArrays<temp.size(); numberArrays++) 
					{  
						if(numberArrays == 0) {%>
							<td  style="background-color: gray;">No.</td>
							<td  style="background-color: gray;">Number</td>
							<td  style="background-color: gray;">Row</td>
							<td  style="background-color: gray;">Row Addition</td>
						<% } else { %>
							<td  style="background-color: gray;">Number</td>
							<td  style="background-color: gray;">Row</td>
							<td  style="background-color: gray;">Row Addition</td>
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
										<th style="background-color: gray; width: 5%;"><%=numberArrays+1 %></th>
										<th class="displayNumberStyle3"><%=iterator.next()%></th>
										<td></td>
										<td></td>
									<%
									} else {
										%>
										<th class="displayNumberStyle3"><%=iterator.next()%></th>
										<td></td>
										<td></td>
									<%
									}
								} else { 
									
									if(i==0) {
										%>
										<th style="background-color: gray;"><%=++numberArrays %></th>
										<th class="displayNumberStyle3"><%=iterator.next()%></th>
										<td class="displayNumberStyle"><%="1-"+numberArrays %></td>
										<td class="displayNumberStyle2"><%=iterator1.next() %></td>
									<%
									} else {
										%>
										<th class="displayNumberStyle3"><%=iterator.next()%></th>
										<td class="displayNumberStyle"><%="1-"+ numberArrays %></td>
										<td class="displayNumberStyle2"><%=iterator1.next() %></td>
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
					<tfoot>
					<tr>
					<% 
					for(int numberArrays=0; numberArrays<temp.size(); numberArrays++) 
					{  if(numberArrays == 0) {%>
							<th style="background-color: gray;">Total</th>
							<th style="background-color: aqua;"><%=temp.get(numberArrays) %></th>
							<td colspan="2"  style="background-color: aqua;"></td>
					<% } else { %>
							<th style="background-color:aqua;"><%=temp.get(numberArrays) %></th>
							<td colspan="2"  style="background-color: aqua;"></td>
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
			<jsp:param value="AbacusAddSubShowDescriptivePage" name="PageName"/>
		</jsp:include>
<%	}%>