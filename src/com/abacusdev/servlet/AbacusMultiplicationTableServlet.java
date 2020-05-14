package com.abacusdev.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AbacusMultiplicationServlet
 */
@WebServlet("/abacusMultiplicationTableServlet")
public class AbacusMultiplicationTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AbacusMultiplicationTableServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String firstTable = request.getParameter("firstTable");
		String lastTable = request.getParameter("lastTable");
		
		request.getSession().removeAttribute("MultiplicationTableList");
		
		if(firstTable ==null || firstTable.isEmpty()) firstTable = "2";
		if(lastTable ==null || lastTable.isEmpty()) lastTable = "10";
		
		request.getSession().setAttribute("firstTable", firstTable);
		request.getSession().setAttribute("lastTable", lastTable);
		
		generateMultiplicationTable(request
									, Integer.parseInt(firstTable)
									, Integer.parseInt(lastTable));
		
		request.getRequestDispatcher("JSP/AbacusMultiplicationTableShow.jsp").forward(request, response);
	}
	
	private void generateMultiplicationTable(HttpServletRequest request, Integer firstTable, Integer lastTable) {
		if(firstTable.compareTo(lastTable) == 1) {
			Integer temp = firstTable;
			firstTable = lastTable;
			lastTable = temp;
		}

		ArrayList<ArrayList<Integer>> finalMultiplicationTableList = new ArrayList<ArrayList<Integer>>();
		
		for(int i = 1 ;i<=10;i++) {
			ArrayList<Integer> multiplicationTableList = new ArrayList<Integer>();
            // print left most column first
            System.out.format("%4d |",i);
            for(int j=firstTable;j<=lastTable;j++) {
                System.out.format("%4d",i*j);
                multiplicationTableList.add(i*j);
            }
            finalMultiplicationTableList.add(multiplicationTableList);
            System.out.println();
        }
		
		System.out.println(finalMultiplicationTableList.toString());
		request.getSession().setAttribute("MultiplicationTableList", finalMultiplicationTableList);
	}

}
