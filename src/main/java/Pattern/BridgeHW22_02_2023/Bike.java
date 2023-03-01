package Pattern.BridgeHW22_02_2023;

public class Bike extends Transport{
    public Bike(Factory f1, Factory f2)
    {
        super(f1, f2);
    }
    @Override
    public void manufacture() {
        System.out.print(" Мотоцикл ");
        factoryPtroduce.work();
        factoryAssemble.work();
    }
}
