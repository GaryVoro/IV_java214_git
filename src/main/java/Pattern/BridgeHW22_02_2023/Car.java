package Pattern.BridgeHW22_02_2023;

public class Car extends Transport{
    public Car(Factory f1, Factory f2)
    {
        super(f1, f2);
    }
    @Override
    public void manufacture() {
        System.out.print(" Автомобиль ");
        factoryPtroduce.work();
        factoryAssemble.work();
    }
}
