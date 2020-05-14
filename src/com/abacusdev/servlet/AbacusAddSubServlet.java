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
 * Servlet implementation class AbacusServlet
 */
@WebServlet("/abacusAddSubServlet")
public class AbacusAddSubServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AbacusAddSubServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private void generateFinalArrayList(HttpServletRequest request
    									, ArrayList<ArrayList<Integer>> numberList
    									, ArrayList<ArrayList<Integer>> additionList) {
    	ArrayList<ArrayList<Integer>> finalNumberList = new ArrayList<ArrayList<Integer>>();
		ArrayList<ArrayList<Integer>> finalAdditionList = new ArrayList<ArrayList<Integer>>();
		
		if(numberList!=null && additionList!=null)
		{
			for(int innerListCount=0; innerListCount<((ArrayList<Integer>)numberList.get(0)).size(); innerListCount++) {
				ArrayList<Integer> tempInnerNumberList = new ArrayList<Integer>();
				ArrayList<Integer> tempInnerAdditionList = new ArrayList<Integer>();
				for(int mainListCount=0;mainListCount<numberList.size();mainListCount++) {
//					number = (ArrayList<Integer>)numberList.get(mainListCount).get(innerListCount);
					tempInnerNumberList.add(numberList.get(mainListCount).get(innerListCount));
					tempInnerAdditionList.add(additionList.get(mainListCount).get(innerListCount));
				}
				finalNumberList.add(tempInnerNumberList);
				finalAdditionList.add(tempInnerAdditionList);
			}
		}
		numberList.clear();
		additionList.clear();
		request.getSession().setAttribute("NumberList", finalNumberList);
		request.getSession().setAttribute("AdditionList", finalAdditionList);
    }
    
    private void sampleAbacusShow(HttpServletRequest request) {
		
		ArrayList<ArrayList<Integer>> numberList = new ArrayList<ArrayList<Integer>>();
		ArrayList<ArrayList<Integer>> additionList = new ArrayList<ArrayList<Integer>>();
		for(int i=0;i<5;i++) {
			ArrayList<Integer> subNumberList = new ArrayList<Integer>();
			subNumberList.add(1+i);
			subNumberList.add(2+i);
			subNumberList.add(3+i);
			subNumberList.add(4+i);
			subNumberList.add(5+i);
			subNumberList.add(6+i);
			subNumberList.add(7+i);
			
			ArrayList<Integer> subAdditionList = new ArrayList<Integer>();
			subAdditionList.add(1+i+0);
			subAdditionList.add(3+i+1);
			subAdditionList.add(6+i+2);
			subAdditionList.add(10+i+3);
			subAdditionList.add(15+i+4);
			subAdditionList.add(21+i+5);
			subAdditionList.add(28+i+6);
			numberList.add(subNumberList);
			additionList.add(subAdditionList);
		}
		
		generateFinalArrayList(request, numberList, additionList);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String showMoreData = request.getParameter("showMoreData");
		String submitButtonValue = request.getParameter("submitButton");
		String selectedDigit = request.getParameter("selectDigit");
		String numberOfRows = request.getParameter("numberOfRow");
		String numberOfSum = request.getParameter("numberOfSum");
		
		if("Sample Abcus Show".equalsIgnoreCase(submitButtonValue)) {
			sampleAbacusShow(request);
			request.getRequestDispatcher("JSP/SampleAbacusShowEdit.jsp").forward(request, response);
			return;
		}
			
		if("Show More Data".equals(showMoreData)
				|| "Show More Descriptive Data".equals(showMoreData)
				|| "Play More".equals(showMoreData)) {
			numberOfRows = (String) request.getSession().getAttribute("numberOfRow");
			numberOfSum = (String) request.getSession().getAttribute("numberOfSum");
			selectedDigit = (String) request.getSession().getAttribute("selectedDigit");
		} else {
			request.getSession().removeAttribute("NumberList");
			request.getSession().removeAttribute("AdditionList");
		}
		
		if(numberOfRows ==null || numberOfRows.isEmpty())
			numberOfRows = (String) request.getAttribute("numberOfRow");
		if(numberOfRows ==null || numberOfRows.isEmpty())
			numberOfRows = "10";
		
		if(numberOfSum == null || numberOfSum.isEmpty())
			numberOfSum ="10";
		
		request.getSession().setAttribute("numberOfRow", numberOfRows);
		request.getSession().setAttribute("numberOfSum", numberOfSum);
		request.getSession().setAttribute("selectedDigit", selectedDigit);
		
		int totalNumberOfRows = Integer.valueOf(numberOfRows);
		int totalNumberOfSum = Integer.valueOf(numberOfSum);
		
		createDataForAdditionSubtraction(request, selectedDigit, totalNumberOfRows, totalNumberOfSum);
		
		if(("Generate Abacus Descriptive".equals(submitButtonValue))
				|| "Show More Descriptive Data".equals(showMoreData)) {
			request.getRequestDispatcher("JSP/AbacusAddSubShowDescriptive.jsp").forward(request, response);
		} else if("Generate Abacus".equals(submitButtonValue)
					|| "Show More Data".equals(showMoreData)) {
			request.getRequestDispatcher("JSP/AbacusAddSubShow.jsp").forward(request, response);
		} else if("Play Abacus".equalsIgnoreCase(submitButtonValue)
					|| "Play More".equals(showMoreData)) {
			request.getRequestDispatcher("JSP/PlayAbacusAddSubShow.jsp").forward(request, response);
		}
	}
	
	private void createDataForAdditionSubtraction(HttpServletRequest request
													, String selectedDigit
													, int totalNumberOfRows
													, int totalNumberOfSum) {
		
		ArrayList<ArrayList<Integer>> numberList = new ArrayList<ArrayList<Integer>>();
		ArrayList<ArrayList<Integer>> additionList = new ArrayList<ArrayList<Integer>>();
		
		switch(selectedDigit){
			case "1" : // 1 digit positive Number
				positiveFixedDigitNumber(9, 0, totalNumberOfRows, totalNumberOfSum, numberList, additionList);
				break;
			case "2" : // 2 digit positive Number
				positiveFixedDigitNumber(99, 10, totalNumberOfRows, totalNumberOfSum, numberList, additionList);
				break;
			case "3" : // 3 digit positive Number
				positiveFixedDigitNumber(999, 100, totalNumberOfRows, totalNumberOfSum, numberList, additionList);
				break;
			case "4" : // 1 digit positive and negative Number
				positiveNegativeFixedDigitNumber(9, -9, totalNumberOfRows, totalNumberOfSum, numberList, additionList);
				break;
			case "5" : // 2 digit positive and negative Number
				positiveNegativeFixedDigitNumber(99, -99, totalNumberOfRows, totalNumberOfSum, numberList, additionList);
				break;
			case "6" :// 3 digit positive and negative Number
				positiveNegativeFixedDigitNumber(999, -999, totalNumberOfRows, totalNumberOfSum, numberList, additionList);
				break;
			case "7" :// Mix 1 and 2 Digit Positive Number
				positiveMixDigitNumber(99, 0, totalNumberOfRows, totalNumberOfSum, numberList, additionList);
				break;
			case "8" :// Mix 1 and 2 Digit Positive and Negative Number
				positiveNegativeMixDigitNumber(99, -99, totalNumberOfRows, totalNumberOfSum, numberList, additionList);
				break;
			case "9" :// Mix 1 and 2 and 3 Digit Positive Number
				positiveMixDigitNumber(999, 0, totalNumberOfRows, totalNumberOfSum, numberList, additionList);
				break;
			case "10" :// Mix 1 and 2 and 3 Digit Positive and Negative Number
				positiveNegativeMixDigitNumber(999, -999, totalNumberOfRows, totalNumberOfSum, numberList, additionList);
				break;
			default :
				System.out.println("No Digit Selected Calling default.....");
				positiveFixedDigitNumber(9, 0, totalNumberOfRows, totalNumberOfSum, numberList, additionList);
				break;
		}
		
		generateFinalArrayList(request, numberList, additionList);
	}

	private void positiveFixedDigitNumber(Integer maxBound, Integer minBound
										, int totalNumberOfRows
										, int totalNumberOfSum
										, ArrayList<ArrayList<Integer>> numberList
										, ArrayList<ArrayList<Integer>> additionList) {
		Random randomNumber = new Random();
		Integer newGeneratedNumber;
		
		while(totalNumberOfSum !=0 ) {
			ArrayList<Integer> subNumberList = new ArrayList<Integer>();
			ArrayList<Integer> subAdditionList = new ArrayList<Integer>();
			// int number = (random.nextInt(max - min + 1) + min) to generate a random integer between min and max .
			// int abc1 = random.nextInt(9-0+1)+0; ////generate a random integer from 0 to 9
			//int abc2 =  random.nextInt(99-10+1)+10; //generate 2 digit random integer from 10 to 99
			// int abc3 = random.nextInt(999-100+1)+100; //generate 3 digit random integer from 100 to 999
			for(int i=0; i<totalNumberOfRows;) {
				newGeneratedNumber = randomNumber.nextInt(maxBound - minBound+1)+minBound;
				subNumberList.add(newGeneratedNumber);
				if(i !=0) {
					subAdditionList.add(newGeneratedNumber + subAdditionList.get(i-1));
				} else {
					subAdditionList.add(newGeneratedNumber);
				}
				i++;
			}
			totalNumberOfSum--;
			numberList.add(subNumberList);
			additionList.add(subAdditionList);
		}
		System.out.println(numberList.toString());
		System.out.println(additionList.toString());
	}
	
	private void positiveMixDigitNumber(Integer maxBound, Integer minBound
											, int totalNumberOfRows
											, int totalNumberOfSum
											, ArrayList<ArrayList<Integer>> numberList
											, ArrayList<ArrayList<Integer>> additionList) {
		
		Random randomNumber = new Random();
		Integer newGeneratedNumber;
		
		while(totalNumberOfSum !=0 ) {
			ArrayList<Integer> subNumberList = new ArrayList<Integer>();
			ArrayList<Integer> subAdditionList = new ArrayList<Integer>();
			// int number = (random.nextInt(max - min + 1) + min) to generate a random integer between min and max .
			// int abc1 = random.nextInt(9-0+1)+0; ////generate a random integer from 0 to 9
			//int abc2 =  random.nextInt(99-10+1)+10; //generate 2 digit random integer from 10 to 99
			// int abc3 = random.nextInt(999-100+1)+100; //generate 3 digit random integer from 100 to 999
			for(int i=0; i<totalNumberOfRows;) {
				newGeneratedNumber = randomNumber.nextInt(maxBound - minBound+1)+minBound;
				subNumberList.add(newGeneratedNumber);
				if(i !=0) {
					subAdditionList.add(newGeneratedNumber + subAdditionList.get(i-1));
				} else {
					subAdditionList.add(newGeneratedNumber);
				}
				i++;
			}
			totalNumberOfSum--;
			numberList.add(subNumberList);
			additionList.add(subAdditionList);
		}
		System.out.println(numberList.toString());
		System.out.println(additionList.toString());
	}
	
	private void positiveNegativeMixDigitNumber(Integer maxBound, Integer minBound
												, int totalNumberOfRows
												, int totalNumberOfSum
												, ArrayList<ArrayList<Integer>> numberList
												, ArrayList<ArrayList<Integer>> additionList) {
	
		Random randomNumber = new Random();
		Integer newGeneratedNumber, lastAdditionNumber=0;
		Integer bound = (maxBound - minBound +1);
		while(totalNumberOfSum !=0 ) {
			ArrayList<Integer> subNumberList = new ArrayList<Integer>();
			ArrayList<Integer> subAdditionList = new ArrayList<Integer>();
			for(int i=0; i<totalNumberOfRows;) 
			{
				if(i==0){
					newGeneratedNumber = randomNumber.nextInt(maxBound);
				} else {
					lastAdditionNumber=subAdditionList.get(subAdditionList.size()-1);
					newGeneratedNumber = randomNumber.nextInt(bound)+minBound;
					while(newGeneratedNumber.compareTo(0) == 0
							|| (newGeneratedNumber.compareTo(0) == -1 
								&& Integer.sum(lastAdditionNumber, newGeneratedNumber)<0) // addition should not be negative
							|| (newGeneratedNumber.compareTo(maxBound+1) == 1 || newGeneratedNumber.compareTo(maxBound+1) == 0)  // positive number greater than maxBound
							|| (newGeneratedNumber.compareTo(minBound) == -1 && newGeneratedNumber.compareTo(minBound) != 0)) // Negative number greater than minBound
				{
						if(newGeneratedNumber.compareTo(0) == -1 
							&& Integer.sum(lastAdditionNumber, newGeneratedNumber)<0) {
							newGeneratedNumber = randomNumber.nextInt(bound)+(-lastAdditionNumber);
						} else {
							newGeneratedNumber = randomNumber.nextInt(bound)+minBound;
						}
					}
				}
				
				subNumberList.add(newGeneratedNumber);
				if(i !=0) {
					subAdditionList.add(newGeneratedNumber + subAdditionList.get(i-1));
				} else {
					subAdditionList.add(newGeneratedNumber);
				}
				i++;
			}
			totalNumberOfSum--;
			numberList.add(subNumberList);
			additionList.add(subAdditionList);
		}
		System.out.println(numberList.toString());
		System.out.println(additionList.toString());
//		System.out.println("Final total : "+additionList.get(additionList.size()-1));
	}
	
	private void positiveNegativeFixedDigitNumber(Integer maxBound, Integer minBound
													, int totalNumberOfRows
													, int totalNumberOfSum
													, ArrayList<ArrayList<Integer>> numberList
													, ArrayList<ArrayList<Integer>> additionList) {
		Random randomNumber = new Random();
		Integer newGeneratedNumber, lastAdditionNumber=0;
		Integer bound = (maxBound - minBound +1);
		Integer internalBoundryNumber = 1+((maxBound.compareTo(9)==0)
											? maxBound 
											: Integer.parseInt(maxBound.toString().substring(0, maxBound.toString().length()-1)));

		while(totalNumberOfSum !=0 ) {
			ArrayList<Integer> subNumberList = new ArrayList<Integer>();
			ArrayList<Integer> subAdditionList = new ArrayList<Integer>();
			lastAdditionNumber=0;
			// int number = (random.nextInt(max - min + 1) + min) to generate a random integer between min and max .
			// int abc1 = random.nextInt(9-(-9)+1)+(-9); ////generate a random integer from -9 to 9
			//int abc2 =  random.nextInt(99-(-99)+1)+(-99); //generate 2 digit random integer from -99 to 99 excluding -9 to 9
			// int abc3 = random.nextInt(999-(-999)+1)+(-999); //generate 3 digit random integer from 100 to 999 excluding -9 to 9 and -99 to 99
			
			for(int i=0; i<totalNumberOfRows;) {
				
				if(i==0){
					newGeneratedNumber = randomNumber.nextInt(maxBound);
					if(maxBound.compareTo(9)!=0) {
						while(newGeneratedNumber.compareTo(internalBoundryNumber) == -1 )
							newGeneratedNumber = randomNumber.nextInt(maxBound);
					}
				} else {
					lastAdditionNumber=subAdditionList.get(subAdditionList.size()-1);
					newGeneratedNumber = randomNumber.nextInt(bound)+minBound;
	//				lastAdditionNumber = 100;
	//				newGeneratedNumber =-999;
					while(newGeneratedNumber.compareTo(0) == 0
							|| (newGeneratedNumber.compareTo(0) == -1 
								&& Integer.sum(lastAdditionNumber, newGeneratedNumber)<0) // addition and should not be negative
							|| (maxBound.compareTo(9)!=0 
								&& ((internalBoundryNumber.compareTo(newGeneratedNumber) == 1 // positive number less than internalBoundryNumber
										&& newGeneratedNumber.compareTo(0) == 1)
									|| (newGeneratedNumber.compareTo(0) == -1 // for negative number greater than internalBoundryNumber
										&& newGeneratedNumber.compareTo(-internalBoundryNumber) == 1)
										))
							|| (newGeneratedNumber.compareTo(maxBound+1) == 1 || newGeneratedNumber.compareTo(maxBound+1) == 0)  // positive number greater than maxBound
							|| (newGeneratedNumber.compareTo(minBound) == -1 && newGeneratedNumber.compareTo(minBound) != 0)) // Negative number greater than minBound
				{
						if(newGeneratedNumber.compareTo(0) == -1 
							&& Integer.sum(lastAdditionNumber, newGeneratedNumber)<0) {
							newGeneratedNumber = randomNumber.nextInt(bound)+(-lastAdditionNumber);
						} else {
							newGeneratedNumber = randomNumber.nextInt(bound)+minBound;
						}
					}
				}
				
				subNumberList.add(newGeneratedNumber);
				if(i !=0) {
					subAdditionList.add(newGeneratedNumber + subAdditionList.get(i-1));
				} else {
					subAdditionList.add(newGeneratedNumber);
				}
				i++;
			}
			totalNumberOfSum--;
			numberList.add(subNumberList);
			additionList.add(subAdditionList);
		}
		System.out.println(numberList.toString());
		System.out.println(additionList.toString());
	}
	
	
	
	
	/*private void positiveNegative2DigitNumber(int totalNumberOfRows
												, ArrayList<Integer> numberList
												, ArrayList<Integer> additionList) {
		Random randomNumber = new Random();
		Integer num;
		Integer temp;
		for(int i=0; i<totalNumberOfRows;) {
			if(i==0)
				num = randomNumber.nextInt(99);
			else {
				temp=additionList.get(additionList.size()-1);
				System.out.println("Temp: "+temp);
				if(temp != 0 && temp <= 99 && temp>=-99) 
				{
					if(temp.toString().length() != 1)
						num = randomNumber.nextInt(temp+temp)-temp;
					else
						num = randomNumber.nextInt(99);
				} else if(temp==0) { 
					num = randomNumber.nextInt(99);
				} else num = randomNumber.nextInt(99+99)-99;
			}
			if((num > 0 && num.toString().length() != 1)
					|| (num < 0
							&& num.toString().length() != 2)) {
				System.out.println("Not One Digit: "+num);
				if((i==0 && num>0)
						|| (i >0 && !additionList.isEmpty() && (num>=0 || additionList.get(additionList.size()-1) > num))) {
					numberList.add(num);
					if(i !=0) {
						additionList.add(num + additionList.get(i-1));
					} else {
						additionList.add(num);
					}
					i++;
				} else {
					System.out.println("Small Number: "+num);
				}
			}
		}
	}*/

}
