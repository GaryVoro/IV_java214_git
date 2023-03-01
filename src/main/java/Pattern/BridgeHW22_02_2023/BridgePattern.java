package Pattern.BridgeHW22_02_2023;

/*bridge design pattern
Паттерн отделяет реализацию производства фабрикой деталей и сборки транспортного
средства от абстрактного класса Транспортное средство и его конкретных
 реализаций: Автомобиль и Мотоцикл
*/

class BridgePattern { 
public static void main(String[] args) 
 { 
     Transport transport1 = new Car(new FactoryProduce(), new FactoryAssemble());
     transport1.manufacture();
     Transport transport2 = new Bike(new FactoryProduce(), new FactoryAssemble());
     transport2.manufacture();
 } 
} 
