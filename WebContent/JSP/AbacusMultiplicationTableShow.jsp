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
			</style>
		
		
		<%@page import="java.util.ArrayList"%>      <%--Importing all the dependent classes--%>
		<%@page import="java.util.Iterator"%> 

	<% 	
		ArrayList<ArrayList<Integer>> multiplicationTableList = (ArrayList<ArrayList<Integer>>) request.getSession().getAttribute("MultiplicationTableList"); 
	%>
<center>
	<form action="abacusMultiplicationTableServlet" method="post">
		<% 
	  		if(!condition) { %>
		<input type="submit" name="home" value="Back to Home" onclick="form.action='homeServlet';" />
		<br><br>
		
		<% }
			if(multiplicationTableList!=null && !multiplicationTableList.isEmpty())
			{
				int totalTable = multiplicationTableList.get(0).size();
				%>
				<div class="tableFixHead">
				<table id="tblAbacus" cellspacing="2" cellpadding="2" border="1">
				<thead>
					<tr>
						<td style="background-color: blue; text-align: left; padding-left: 44%;" colspan="<%=totalTable*2%>">
							<h3>MULTIPLICATION TABLE</h3>
						</td>
					</tr>
				</thead>
				<thead>
					<tr>
					<% 
					Iterator<Integer> iteratorFirstRow = multiplicationTableList.get(0).iterator();
					int numberArrays=0;
					while(iteratorFirstRow.hasNext())
					{  
						if(numberArrays++ == 0) {%>
							<th style="background-color: yellow; "></th>
							<th style="background-color: yellow;"><%=iteratorFirstRow.next() %></th>
					 <% } else { %>
							<th style="background-color: yellow; " colspan="2"><%=iteratorFirstRow.next() %></th>
					<% 	}
					} %>
					</tr>
				</thead>
				<%-- <thead>
					<tr>
					<% 
					for(int numberArrays=0; numberArrays<5; numberArrays++) 
					{  
						if(numberArrays == 0) {%>
							<th style="background-color: gray; ">No.</th>
							<th style="background-color: gray;">Multiplier * Multiplicand =</th>
							<th style="background-color: gray;">Product</th>
						<% } else { %>
							<th style="background-color: gray; ">No.</th>
							<th style="background-color: gray; " colspan="">Multiplier * Multiplicand =</th>
							<th style="background-color: gray;">Product</th>
					<% 		}
					} %>
					</tr>
				</thead> --%>
				<tbody>
					<%
					Iterator<ArrayList<Integer>> iterator = multiplicationTableList.iterator();
					int rowCount = 0;
					while(iterator.hasNext())  // iterate through all the data until the last record
					{%>
						<tr>
						<%	
						Iterator<Integer> iterator1 = iterator.next().iterator();
						numberArrays = 0;
						rowCount++;
						while(iterator1.hasNext()) 
						{
							if(numberArrays++ == 0) {%>
								<th style="background-color: yellow; width: 5%; "><%=rowCount %></th>
								<th><%=iterator1.next() %></th>
						 <% } else { %>
								<th colspan="2"><%=iterator1.next() %></th>
						<% 	}
					   	}%>
					   	</tr>
					<%}
				%>
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