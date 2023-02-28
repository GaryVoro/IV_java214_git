package main.java.Testing.hw08022023;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

class СalculationMainTest {

    @Test
    void getRecursionNod() {
        int numOne = 10;
        int numTwo = 15;
        int control = 5;

        int rez = calculation_main.getRecursionNod(numOne, numTwo);
        Assertions.assertEquals(rez, control);
    }

    @Test
    void pow() {
        int num = 2;
        int degreeNum = 16;
        int control = 65536;

        int rez = calculation_main.pow(num, degreeNum);
        Assertions.assertEquals(rez, control);
    }

    @Test
    void calculateSumDigits() {
        int num = 179;
        int control = 17;

        int rez = calculation_main.calculateSumDigits(num);
        Assertions.assertEquals(rez, control);
    }
}