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
@WebServlet("/abacusDivisionServlet")
public class AbacusDivisionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AbacusDivisionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String showMoreData = request.getParameter("showMoreData");
		String submitButtonValue = request.getParameter("submitButton");
		
		String firstNumberDigit = request.getParameter("firstNumberOfDigit");
		String secondNumberDigit = request.getParameter("secondNumberOfDigit");
		String numberOfSum = request.getParameter("numberOfSum");
		
		if("Show More Data".equals(showMoreData)
				|| "Play More".equals(showMoreData)){
			firstNumberDigit = (String) request.getSession().getAttribute("firstNumberOfDigit");
			secondNumberDigit = (String) request.getSession().getAttribute("secondNumberOfDigit");
			numberOfSum = (String) request.getSession().getAttribute("numberOfSum");
		} else {
			request.getSession().removeAttribute("NumberList");
			request.getSession().removeAttribute("QuotientList");
		}
		
		if(firstNumberDigit ==null || firstNumberDigit.isEmpty()) firstNumberDigit = "1";
		if(secondNumberDigit ==null || secondNumberDigit.isEmpty()) secondNumberDigit = "1";
		if(numberOfSum ==null || numberOfSum.isEmpty()) numberOfSum = "5";
		
		request.getSession().setAttribute("firstNumberOfDigit", firstNumberDigit);
		request.getSession().setAttribute("secondNumberOfDigit", secondNumberDigit);
		request.getSession().setAttribute("numberOfSum", numberOfSum);
		
		createDataForMultiplication(request
									, Integer.parseInt(firstNumberDigit)
									, Integer.parseInt(secondNumberDigit)
									, Integer.parseInt(numberOfSum));
		
		if("Play Abacus".equalsIgnoreCase(submitButtonValue)
				|| "Play More".equals(showMoreData)) {
			request.getRequestDispatcher("JSP/PlayAbacusDivisionShow.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("JSP/AbacusDivisionShow.jsp").forward(request, response);
		}
	}
	
	/**
	 * @param numberOfDigit
	 * @param maxBound
	 * @param minBound
	 * 
	 * 	NumberOfDigit: 1 == MaxBound: 9 MinBound: 1
	   	NumberOfDigit: 2 == MaxBound: 99 MinBound: 10
	   	NumberOfDigit: 3 == MaxBound: 999 MinBound: 100
		NumberOfDigit: 4 == MaxBound: 9999 MinBound: 1000
		NumberOfDigit: 5 == MaxBound: 99999 MinBound: 10000
	 */
	private void craeteMaxAndMinBound(Integer numberOfDigit, StringBuilder maxBoundSB, StringBuilder minBoundSB) {
		maxBoundSB.append("9");
		minBoundSB.append("1");
		for(int i=1; i<numberOfDigit; i++) {
			maxBoundSB.append("9");
			minBoundSB.append("0");
		}
	}
	
	private void createDataForMultiplication(HttpServletRequest request, Integer firstNumberDigit, Integer secondNumberDigit, Integer totalNumberOfSum) {
		
		StringBuilder firstDigitMaxBoundSB = new StringBuilder(), firstDigitMinBoundSB = new StringBuilder()
					, secondDigitMaxBoundSB = new StringBuilder(), secondDigitMinBoundSB = new StringBuilder();
		craeteMaxAndMinBound(firstNumberDigit, firstDigitMaxBoundSB, firstDigitMinBoundSB);
		craeteMaxAndMinBound(secondNumberDigit, secondDigitMaxBoundSB, secondDigitMinBoundSB);

		positiveFixedDigitMultiplicationNumber(request
												, Integer.parseInt(firstDigitMaxBoundSB.toString())
												, Integer.parseInt(firstDigitMinBoundSB.toString())
												, Integer.parseInt(secondDigitMaxBoundSB.toString())
												, Integer.parseInt(secondDigitMinBoundSB.toString())
												, totalNumberOfSum);
	}
	
	private static void positiveFixedDigitMultiplicationNumber(HttpServletRequest request
																, Integer firstDigitMaxBound
																, Integer firstDigitMinBound
																, Integer secondDigitMaxBound
																, Integer secondDigitMinBound
																, Integer totalNumberOfSum) {

			Random randomNumber = new Random();
			Random randomNumber1 = new Random();
			Integer firstNumber, secondNumber;
			ArrayList<String> numberList = new ArrayList<String>();
			ArrayList<String> quotientList = new ArrayList<String>();
			while(totalNumberOfSum !=0 ) {
			// int number = (random.nextInt(max - min + 1) + min) to generate a random integer between min and max .
			// int abc1 = random.nextInt(9-0+1)+0; ////generate a random integer from 0 to 9
			//int abc2 =  random.nextInt(99-10+1)+10; //generate 2 digit random integer from 10 to 99
			// int abc3 = random.nextInt(999-100+1)+100; //generate 3 digit random integer from 100 to 999
			firstNumber = randomNumber.nextInt(firstDigitMaxBound - firstDigitMinBound+1)+firstDigitMinBound;
			secondNumber = randomNumber1.nextInt(secondDigitMaxBound-secondDigitMinBound+1)+secondDigitMinBound; // multiply with 1 digit number
			if(firstNumber.compareTo(secondNumber) == -1 
					&& secondNumber.compareTo(firstDigitMaxBound) == 0){
				while((firstNumber.compareTo(secondNumber) == -1 
						|| secondNumber.compareTo(firstDigitMaxBound) == 0)) {
					secondNumber = randomNumber1.nextInt(secondDigitMaxBound-secondDigitMinBound+1)+secondDigitMinBound;
				}
			} else {
				while(firstNumber.compareTo(secondNumber) == -1 ) {
					firstNumber = randomNumber.nextInt(firstDigitMaxBound - firstDigitMinBound+1)+firstDigitMinBound;
				}
			}
			numberList.add(firstNumber+ " ÷ " + secondNumber+" =");
			quotientList.add(firstNumber/secondNumber+"/"+firstNumber%secondNumber);
			totalNumberOfSum--;
			}
			
			System.out.println(numberList.toString());
			System.out.println(quotientList.toString());
			request.getSession().setAttribute("NumberList", numberList);
			request.getSession().setAttribute("QuotientList", quotientList);
	}

}
