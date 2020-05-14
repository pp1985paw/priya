<jsp:include page="../COMMON/AbacusHeader.jsp" />


<style type="text/css">
	   table tr
	   {
	   	text-align: center;
	   }
</style>
<%@page import="java.util.ArrayList"%>      <%--Importing all the dependent classes--%>
<%@page import="java.util.Iterator"%> 

	<% ArrayList<ArrayList<Integer>> numberList = (ArrayList<ArrayList<Integer>>) request.getSession().getAttribute("NumberList"); 
		ArrayList<ArrayList<Integer>> additionList = (ArrayList<ArrayList<Integer>>) request.getSession().getAttribute("AdditionList"); 
	%>
<center>
	<form action="abacusAddSubServlet" method="post">

		<input type="submit" name="home" value="Back to Home" onclick="form.action='homeServlet';" />
		<%
			if(numberList!=null && additionList!=null)
			{
				ArrayList<Integer> temp = additionList.get(additionList.size()-1);
		%>
				<input type="submit" name="showMoreData" value="Play More" />
				<input type="button" name="button" id="showHideAnswerButton" value="Show Answer" onclick="showHideAnswer('#hiddenAnswer')"/>
				<input type="button" id="showHideDescriptiveAnswerButton" value="Show Descriptive Answer" onclick="showHideDescriptiveAnswer('PlayAbacusAddSubShowPage')" />
				<br><br>
				<div class="tableFixHead">
				<table id="tblAbacus" cellspacing="2" cellpadding="2" border="1">
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
							<th style="background-color: yellow; ">        </th>
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
										<th style="width: 5%;"><%=numberArrays+1 %></th>
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
										<th><%=++numberArrays %></th>
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
							<th style="background-color: aqua;">
								<input type="number" class="numberInputTagStyle" id="totalSum<%=numberArrays %>" onblur="checkValue(this, 'hiddenSum<%=numberArrays %>')">
								<input type="hidden" id="hiddenSum<%=numberArrays %>" value="<%=temp.get(numberArrays) %>">
							</th>
					<% } else { %>
							<th style="background-color: aqua;">
								<input type="number"  class="numberInputTagStyle" id="totalSum<%=numberArrays %>" onblur="checkValue(this, 'hiddenSum<%=numberArrays %>')">
								<input type="hidden" id="hiddenSum<%=numberArrays %>" value="<%=temp.get(numberArrays) %>">
							</th>
					<% }
					} %>
					</tr>
					
					<tr id="hiddenAnswer" style="display: none;">
					<% 
					for(int numberArrays=0; numberArrays<temp.size(); numberArrays++) 
					{  if(numberArrays == 0) {%>
							<th style="background-color: gray;">Answer</th>
							<th style="background-color: aqua;">
								<input disabled="disabled" type="number" class="numberInputTagStyle" id="hiddenSum<%=numberArrays %>" value="<%=temp.get(numberArrays) %>">
							</th>
					<% } else { %>
							<th style="background-color: aqua;">
								<input disabled="disabled" type="number" class="numberInputTagStyle" id="hiddenSum<%=numberArrays %>" value="<%=temp.get(numberArrays) %>">
							</th>
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

<jsp:include page="../COMMON/AbacusFooter.jsp">
<jsp:param value="PlayAbacusAddSubShowPage" name="PageName"/>
</jsp:include>
