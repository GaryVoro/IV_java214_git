package Pattern.BridgeHW22_02_2023;

public abstract class Transport {
        public final Factory factoryPtroduce;
        public final Factory factoryAssemble;

        protected Transport(Factory w1, Factory w2)
        {
            this.factoryPtroduce = w1;
            this.factoryAssemble = w2;
        }

        abstract public void manufacture();
}
