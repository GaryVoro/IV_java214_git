package PatternHW;

//import javax.xml.transform.Source;

public class AdapterCar implements AdapterCarSpeed {
    public float speedMile;

    private final MyCarInfo info;

    public AdapterCar(MyCar info) { this.info = info; }

    @Override
    public float speedCarMile() {
        speedMile = info.getSpeedKMH() * 1.8F;
        return speedMile;
    }
}
