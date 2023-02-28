package PatternHW;

public class MyCarConverted implements MyCarInfoConverted {
    String nameCar; //названии автомобиля, год выпуска, цена, цвет, объем двигателя.
    String colorCar;
    Integer madeYearCar;
    Integer vEngine;
    Integer priceCar;
    Integer speedCarKMH;
    Integer speedCarMile;

    @Override
    public int getSpeedMile() {
        return 0;
    }
}
