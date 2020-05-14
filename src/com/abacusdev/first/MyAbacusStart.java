package com.abacusdev.first;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Random;

public class MyAbacusStart {

	public static void main(String[] args) {
		
		printMultiplicationTable(9);
		//System.out.println(10%5 ==0);
//		createMaxAndMinBound(1);
//		createMaxAndMinBound(2);
//		createMaxAndMinBound(3);
//		createMaxAndMinBound(4);
//		createMaxAndMinBound(5);
//		generateMinAndMaxBound(4,2);
//		callMultiplicationAbacus();
//		convertArraylistForDisplay();
//		callAddSubAbacus();
	}
	
	
    public static void printMultiplicationTable(int tableSize) {
        // first print the top header row
        System.out.format("      ");
        for(int i = 1; i<=tableSize;i++ ) {
            System.out.format("%4d",i);
        }
        System.out.println();
        System.out.println("------------------------------------------");
         
        for(int i = 1 ;i<=tableSize;i++) {
            // print left most column first
            System.out.format("%4d |",i);
            for(int j=1;j<=tableSize;j++) {
                System.out.format("%4d",i*j);
            }
            System.out.println();
        }
    }
    
	private static void createMaxAndMinBound(Integer numberOfDigit) {
		StringBuilder maxBoundSB = new StringBuilder("9");
		StringBuilder minBoundSB = new StringBuilder("1");
		for(int i=1; i<numberOfDigit; i++) {
			maxBoundSB.append("9");
			minBoundSB.append("0");
		}
		Integer maxBound = Integer.parseInt(maxBoundSB.toString());
		Integer minBound = Integer.parseInt(minBoundSB.toString());
		System.out.println("NumberOfDigit: "+numberOfDigit+" == MaxBound: "+maxBound+" MinBound: "+minBound);
	}
	
	private static void generateMinAndMaxBound(Integer firstNumberDigit, Integer secondNumberDigit) {
		StringBuilder maxBound = new StringBuilder("9");
		StringBuilder minBound = new StringBuilder((firstNumberDigit==1)?"0":"1");
		for(int i=1; i<firstNumberDigit; i++) {
			maxBound.append("9");
			minBound.append("0");
		}
		System.out.println("firstDigitMaxBound: "+maxBound.toString());
		System.out.println("firstDigitMinBound: "+minBound.toString());
		Integer firstDigitMaxBound = Integer.parseInt(maxBound.toString());
		Integer firstDigitMinBound = Integer.parseInt(minBound.toString());

		maxBound = new StringBuilder("9");
		minBound = new StringBuilder((secondNumberDigit==1)?"0":"1");
		for(int i=1; i<secondNumberDigit; i++) {
			maxBound.append("9");
			minBound.append("0");
		}
		System.out.println("secondDigitMaxBound: "+maxBound.toString());
		System.out.println("secondDigitMinBound: "+minBound.toString());
		Integer secondDigitMaxBound = Integer.parseInt(maxBound.toString());
		Integer secondDigitMinBound = Integer.parseInt(minBound.toString());
	}
	
	private static void convertArraylistForDisplay() {
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
		subAdditionList.add(1+i);
		subAdditionList.add(3+i);
		subAdditionList.add(6+i);
		subAdditionList.add(10+i);
		subAdditionList.add(15+i);
		subAdditionList.add(21+i);
		subAdditionList.add(28+i);
		numberList.add(subNumberList);
		additionList.add(subAdditionList);
		}
		
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
		
		System.out.println(finalNumberList.toString());
		System.out.println(finalAdditionList.toString());
	}
	
	private static void callAddSubAbacus() {
		System.out.println("positiveMixedDigitNumber :............");
		positiveMixedDigitNumber(999, 0, 20, 10);
		System.out.println("   ");
		System.out.println("positiveFixedDigitNumber :............");
		positiveFixedDigitNumber(9,0, 10, 10);
		System.out.println("   ");
		System.out.println("generateNumberWithinRange :............");
		generateNumberWithinRange(99, -28, 20);
		System.out.println("   ");
		System.out.println("positiveNegativeFixedDigitNumber :............");
		positiveNegativeFixedDigitNumber(9, -9, 20, 10);
		System.out.println("   ");
		System.out.println("positiveNegativeMixedDigitNumber :............");
		positiveNegativeMixedDigitNumber(9, -9, 20, 10);
		System.out.println("   ");
		System.out.println("generateAbacus :............");
		generateAbacus();
	}
	
	private static void callMultiplicationAbacus() {
		positiveFixedDigitMultiplicationNumber(99, 10, 9, 1, 5);
		positiveFixedDigitMultiplicationNumber(99, -99, 9, 1, 5);
	}
	
	private static void positiveFixedDigitMultiplicationNumber(Integer firstDigitMaxBound
																, Integer firstDigitMinBound
																, Integer secondDigitMaxBound
																, Integer secondDigitMinBound
																, Integer totalNumberOfSum) {
		
		Random randomNumber = new Random();
		Random randomNumber1 = new Random();
		Integer firstNumber, secondNumber;
		ArrayList<String> numberList = new ArrayList<String>();
		ArrayList<Integer> multiplicationList = new ArrayList<Integer>();
		while(totalNumberOfSum !=0 ) {
			// int number = (random.nextInt(max - min + 1) + min) to generate a random integer between min and max .
			// int abc1 = random.nextInt(9-0+1)+0; ////generate a random integer from 0 to 9
			//int abc2 =  random.nextInt(99-10+1)+10; //generate 2 digit random integer from 10 to 99
			// int abc3 = random.nextInt(999-100+1)+100; //generate 3 digit random integer from 100 to 999
			firstNumber = randomNumber.nextInt(firstDigitMaxBound - firstDigitMinBound+1)+firstDigitMinBound;
			secondNumber = randomNumber1.nextInt(secondDigitMaxBound-secondDigitMinBound+1)+secondDigitMinBound; // multiply with 1 digit number
			numberList.add(firstNumber+ " X " + secondNumber+" =");
			multiplicationList.add(firstNumber*secondNumber);
			totalNumberOfSum--;
		}
		
		System.out.println(numberList.toString());
		System.out.println(multiplicationList.toString());
//		System.out.println("Final total : "+subAdditionList.get(subAdditionList.size()-1));
	}
	
	private static void positiveMixedDigitNumber(Integer maxBound,Integer minBound, Integer numberOfRows, Integer totalNumberOfSum)
	{
		
		Random randomNumber = new Random();
		Integer newGeneratedNumber;
		
		ArrayList<ArrayList<Integer>> numberList = new ArrayList<ArrayList<Integer>>();
		ArrayList<ArrayList<Integer>> additionList = new ArrayList<ArrayList<Integer>>();
		
		while(totalNumberOfSum !=0 ) {
			ArrayList<Integer> subNumberList = new ArrayList<Integer>();
			ArrayList<Integer> subAdditionList = new ArrayList<Integer>();
			
			// int number = (random.nextInt(max - min + 1) + min) to generate a random integer between min and max .
			// int abc1 = random.nextInt(9-0+1)+0; ////generate a random integer from 0 to 9
			//int abc2 =  random.nextInt(99-10+1)+10; //generate 2 digit random integer from 10 to 99
			// int abc3 = random.nextInt(999-100+1)+100; //generate 3 digit random integer from 100 to 999
			for(int i=0; i<Integer.valueOf(numberOfRows);) {
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
//		System.out.println("Final total : "+subAdditionList.get(subAdditionList.size()-1));
	}
	
	private static void positiveFixedDigitNumber(Integer maxBound, Integer minBound
													, Integer numberOfRows
													, Integer totalNumberOfSum) {
		Random randomNumber = new Random();
		Integer newGeneratedNumber;
		ArrayList<ArrayList<Integer>> numberList = new ArrayList<ArrayList<Integer>>();
		ArrayList<ArrayList<Integer>> additionList = new ArrayList<ArrayList<Integer>>();
		
		while(totalNumberOfSum !=0 ) {
			ArrayList<Integer> subNumberList = new ArrayList<Integer>();
			ArrayList<Integer> subAdditionList = new ArrayList<Integer>();
			// int number = (random.nextInt(max - min + 1) + min) to generate a random integer between min and max .
			// int abc1 = random.nextInt(9-0+1)+0; ////generate a random integer from 0 to 9
			//int abc2 =  random.nextInt(99-10+1)+10; //generate 2 digit random integer from 10 to 99
			// int abc3 = random.nextInt(999-100+1)+100; //generate 3 digit random integer from 100 to 999
			for(int i=0; i<Integer.valueOf(numberOfRows);) {
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
//		System.out.println("Final total : "+subAdditionList.get(subAdditionList.size()-1));
	}
	
	private static void positiveNegativeMixedDigitNumber(Integer maxBound,Integer minBound, Integer numberOfRows, Integer totalNumberOfSum)
	{
		Random randomNumber = new Random();
		Integer newGeneratedNumber, lastAdditionNumber;
		Integer bound = (maxBound - minBound +1);
		
		ArrayList<ArrayList<Integer>> numberList = new ArrayList<ArrayList<Integer>>();
		ArrayList<ArrayList<Integer>> additionList = new ArrayList<ArrayList<Integer>>();
		
		while(totalNumberOfSum !=0 ) {
			ArrayList<Integer> subNumberList = new ArrayList<Integer>();
			ArrayList<Integer> subAdditionList = new ArrayList<Integer>();
			lastAdditionNumber=0;
			
			for(int i=0; i<Integer.valueOf(numberOfRows);) 
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
//		System.out.println("Final total : "+subAdditionList.get(subAdditionList.size()-1));
			
	}

	private static void generateNumberWithinRange(Integer maxBound, Integer minBound, Integer numberOfRows) {
		Integer internalBoundryNumber = Integer.parseInt(maxBound.toString().substring(0, maxBound.toString().length()-1))+1;
		Random randomNumber = new Random();
		Integer bound = (maxBound - minBound +1);
		Integer newGeneratedValue;
		for(int i=0;i<numberOfRows;i++){
			newGeneratedValue = randomNumber.nextInt(bound)+minBound;
//			System.out.print("  "+(newGeneratedValue));
			// 9 or -9 suppose 8 suppose -8 
			while(newGeneratedValue.compareTo(0) == 0
				|| (internalBoundryNumber.compareTo(newGeneratedValue) == 1
					&& newGeneratedValue.compareTo(0) == 1)
				|| (newGeneratedValue.compareTo(0) == -1
						&& newGeneratedValue.compareTo(-internalBoundryNumber) == 1)) {
				newGeneratedValue = randomNumber.nextInt(bound)+minBound;
			}
			System.out.print("  "+(newGeneratedValue));
		}
	}
	
	private static void positiveNegativeFixedDigitNumber(Integer maxBound,Integer minBound, Integer numberOfRows, Integer totalNumberOfSum)
	{
			
		Random randomNumber = new Random();
		Integer newGeneratedNumber, lastAdditionNumber;
		Integer bound = (maxBound - minBound +1);
		Integer internalBoundryNumber = 1+((maxBound.compareTo(9)==0)
												? maxBound 
												: Integer.parseInt(maxBound.toString().substring(0, maxBound.toString().length()-1)));
		
		ArrayList<ArrayList<Integer>> numberList = new ArrayList<ArrayList<Integer>>();
		ArrayList<ArrayList<Integer>> additionList = new ArrayList<ArrayList<Integer>>();
		
		while(totalNumberOfSum !=0 ) {
			ArrayList<Integer> subNumberList = new ArrayList<Integer>();
			ArrayList<Integer> subAdditionList = new ArrayList<Integer>();
			lastAdditionNumber=0;
			
			for(int i=0; i<Integer.valueOf(numberOfRows);) 
			{
				
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
//		System.out.println("Final total : "+subAdditionList.get(subAdditionList.size()-1));
			/*Iterator<Integer> iterator = subNumberList.iterator();  // Iterator interface
			Integer i=0;
			while(iterator.hasNext()) {
				i = iterator.next();
	//			i=-99;
				if(maxBound.compareTo(9)!=0 
						&&	((internalBoundryNumber.compareTo(i) == 1 // positive number
									&& i.compareTo(0) == 1)
							|| (i.compareTo(0) == -1 // for negative number
									&& i.compareTo(-internalBoundryNumber) == 1)))
				{
						System.out.print("error");	
				}
			}*/
	}
	
	private static void generateAbacus() {
		
//		ArrayList myAl = new ArrayList();
//		Random randomNumber = new Random();
//		Integer num;
//		for(int i=1; i<10;i++) {
//			num = randomNumber.nextInt(99+99)-99;
//			if((num > 0 && num.toString().length() != 1)
//					|| (num < 0
//							&& num.toString().length() != 2)) {
//				System.out.println("Not One Digit: "+num);
//			} else {
//				System.out.println("false Number: "+num);
//			}
//		}
		
		ArrayList<Integer> my10DigitSubNumberList = new ArrayList<Integer>();
		ArrayList<Integer> mySubAdditionList = new ArrayList<Integer>();
		Random randomNumber = new Random();
		Integer num;
		Integer numberOfRows =20;
		Integer temp = 0;
		for(int i=0; i<Integer.valueOf(numberOfRows);) {
			if(i==0)
				num = randomNumber.nextInt(99);
			else {
				temp=mySubAdditionList.get(mySubAdditionList.size()-1);
//				System.out.println("Temp: "+temp);
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
//				System.out.println("Not One Digit: "+num);
				if((i==0 && num>0)
						|| (i >0 && !mySubAdditionList.isEmpty() && (num>=0 || mySubAdditionList.get(mySubAdditionList.size()-1) > num))) {
					my10DigitSubNumberList.add(num);
					if(i !=0) {
						mySubAdditionList.add(num + mySubAdditionList.get(i-1));
					} else {
						mySubAdditionList.add(num);
					}
					i++;
				} else {
//					System.out.println("Small Number: "+num);
				}
			}
		}
		
//		for(int i=0; i<10;i++) {
//			num = randomNumber.nextInt(99+99)-99;
//			if((num > 0 && num.toString().length() != 1)
//					|| (num < 0
//							&& num.toString().length() != 2)) {
//				System.out.println("Not One Digit: "+num);
//				my10DigitsubNumberList.add(num);
//				if(i !=0) {
//					mySubAdditionList.add(num + mySubAdditionList.get(i-1));
//				} else {
//					mySubAdditionList.add(num);
//				}
//			}
//		}
		
		System.out.println(my10DigitSubNumberList.toString());
		System.out.println(mySubAdditionList.toString());
//		System.out.println("Final total : "+mySubAdditionList.get(mySubAdditionList.size()-1));
	
	}
}
