package PatternHW;

public class MyCar implements MyCarInfo {

    String nameCar; //название автомобиля
    float speedCarKMH;


    public MyCar(String name, float speed) {
        this.nameCar = name;
        this.speedCarKMH = speed;
    }
    @Override
    public float getSpeedKMH() { return speedCarKMH; }
}
