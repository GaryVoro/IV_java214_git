package PatternHW;

public class MyCar implements MyCarInfo {

    String nameCar; //названии автомобиля, год выпуска, цена, цвет, объем двигателя.
    String colorCar;
    Integer madeYearCar;
    Integer vEngine;
    Integer priceCar;
    Integer speedCarKMH;
    Integer speedCarMile;



    public MyCar(String name, String color, int made, int engine, int price) {
        this.nameCar = name;
        this.colorCar = color;
        this.madeYearCar = made;
        this.vEngine = engine;
        this.priceCar = price;
    }

    public void viewCar(String pos){


    }


    @Override
    public int getSpeedKMH() {
        return 0;
    }
}
