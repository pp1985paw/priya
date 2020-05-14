<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
   		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   		<title>ABACUS FUN!!!</title>
   		<!-- <script type="text/javascript">
   		
	   		$(document).ready(function() {
	   		  $('tbody').scroll(function(e) { //detect a scroll event on the tbody
	   		  	/*
	   		    Setting the thead left value to the negative valule of tbody.scrollLeft will make it track the movement
	   		    of the tbody element. Setting an elements left value to that of the tbody.scrollLeft left makes it maintain 			it's relative position at the left of the table.    
	   		    */
	   		    $('thead').css("left", -$("tbody").scrollLeft()); //fix the thead relative to the body scrolling
	   		    $('thead th:nth-child(1)').css("left", $("tbody").scrollLeft()); //fix the first cell of the header
	   		    $('tbody td:nth-child(1)').css("left", $("tbody").scrollLeft()); //fix the first column of tdbody
	   		  });
	   		});
   		
   		</script> -->
   		<!-- <style type="text/css">
   		
   			table {
				  position: relative;
				  width: 100%;
				  /*background-color: #aaa; */
				  overflow: hidden;
				  border-collapse: collapse;
				}
				/*thead*/
				thead {
				  position: relative;
				  display: block; /*seperates the header from the body allowing it to be positioned*/
				  width: 100%;
				  overflow: visible;
				}
				
				/* thead th {
				  background-color: #99a;
				  min-width: 120px;
				  height: 32px;
				  border: 1px solid #222;
				} */
				
				thead th:nth-child(1) {/*first cell in the header*/
				  position: relative;
				  display: block; /*seperates the first cell in the header from the header*/
				 /*  background-color: #88b; */
				}
				
				/*tbody*/
				tbody {
				  position: relative;
				  display: block; /*seperates the tbody from the header*/
				  width: 100%;
				  height: 100%;
				  overflow: scroll;
				}
				
				tbody td {
				  /* background-color: #bbc;
				  min-width: 120px;
				  border: 1px solid #222; */
				}
				
				tbody tr th:nth-child(1) {  /*the first cell in each tr*/
				  position: relative;
				  display: block; /*seperates the first column from the tbody*/
				  /* height: 40px;
				  background-color: #99a; */
				}
   		</style> -->
   		
   		<style type="text/css">
   			/* Fix table head */
			 .tableFixHead    { overflow-y: auto; overflow-x: auto; height: 400px; width: 1000px;}
			 .tableFixHead th { position: sticky; top: 0; } 
			/* thead tr:first-child th { position: sticky; top: 0; } */
			/* thead:FIRST-CHILD thead:LAST-CHILD tr th { position: sticky; top: 0; } */

			/* Just common table stuff. */
			table  { border-collapse: collapse;  width: 100%; }
   		
	        body
	        {
	            font-family: Arial;
	            font-size: 10pt;
  				background-image: url('img/background2.jpg');
  				 background-repeat: no-repeat;
  				 background-size: 100% 100%;
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
	        .numberInputTagStyle {
	        	text-align: center;
	        	width: 100px;
	        	margin-left: -3px;
	        }
	        .displayNumberStyle, .displayNumberStyle1, .displayNumberStyle2 {
	        	background-color: #FFFACD; 
	        }
	        .displayNumberStyle4, .displayNumberStyle3, .displayNumberStyle1 {
	        	font-size: 18px;
	        }
	        .displayNumberStyle2 {
	        	text-align: right; width: 5%;
	        }
	        .displayNumberStyle5, .displayNumberStyle4 {
	        	background-color:yellow; 
	        }
	        .displayNumberStyle5 {
	        	font-size: 15px;
	        }
	        
	    </style>
   </head>
   
   <body>
      <center>
         <h2>ABACUS IS FUN!!!</h2>
         <div style="width: 100%;"><img src="img/abacusImage1.jpeg" alt="header button"/></div>
      </center>
      <br/>
      
      <div id="addSubOnlyNumberDataHead" style="display: none;"></div>
	  <div id="addSubOnlyNumberData" style="display: none;"></div>
	  <div id="addSubDescriptiveDataHead" style="display: none;"></div>
	  <div id="addSubDescriptiveData" style="display: none;"></div>