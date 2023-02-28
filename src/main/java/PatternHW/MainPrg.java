package PatternHW;

public class MainPrg {
    public static void main(String[] args) {
        AdapterCarSpeed adapterCarSpeed = new AdapterCar(new MyCar("Honda", 220));

        System.out.println(adapterCarSpeed.speedCarMile());

    }

}
