package main.java.Testing.hw08022023;

public class calculation_main {
    public static void main(String[] args) {

        System.out.println(getRecursionNod(10, 15));

        System.out.println(pow(2, 16));

        System.out.println(calculateSumDigits(179));

    }

    public static int getRecursionNod(int numOne, int numTwo) {
        if (numTwo == 0) {
            return numOne;
        }
        return getRecursionNod(numTwo, numOne % numTwo);
    }

    public static int pow(int num, int degreeNum){
        if(degreeNum == 1) return num;
        else{
            return num * pow(num, degreeNum-1);
        }
    }

    public static int calculateSumDigits(int num){
        int sum = 0;
        while(num != 0){
            sum += (num % 10); //Суммирование цифр числа
            num/=10;
        }
        return sum;
    }
}
