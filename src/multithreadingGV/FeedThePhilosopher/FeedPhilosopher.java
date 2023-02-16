package multithreadingGV.FeedThePhilosopher;
import java.util.Random;

public class FeedPhilosopher implements Runnable{
        private final int number;
        private final Forks leftFork;
        private final Forks rightFork;

        // Инициализируем генератор
        Random rnd = new Random(System.currentTimeMillis());
        public FeedPhilosopher(int number, Forks rightFork, Forks leftFork) {
            this.number = number + 1;
            this.leftFork = leftFork;
            this.rightFork = rightFork;
        }

        @Override
        public void run() {
            System.out.println("Философ " + number + " сел за стол");
            try {
                int tm = tmThink(5);
                System.out.println("Философ " + number + " думает " + tm + " sek");
                /* try get right fork */
                while (true){
                    if (leftFork.take()){
                        tm = tmThink(5);
                        System.out.println("Философ " + number + " взял левую вилку и размышляет " + tm + " sek");
                        if(rightFork.take()) {
                            tm = tmThink(5);
                            System.out.println("Философ " + number + " взял правую вилку и размышляет " + tm + " sek");
                            tmFeedPhilosoph(10);
                            System.out.println("Философ " + number + " обедает " + tm + " sek");
                            rightFork.release();    /* освобождает правую вилку */
                            leftFork.release();     /* освобождает левую вилку */
                            System.out.println("Философ " + number + " отобедал и освободил вилки ");
                            break;
                        } else {
                            leftFork.release();     /* освобождает левую вилку */
                            System.out.println("Правая вилка занята. Философ " + number + " положил левую вилку и размышляет " + tm + " sek");
                            tm = tmThink(5);
                        }
                    } else { //if (leftFork.take)
                        tm = tmThink(5);
                        System.out.println("Философ " + number + " ждет освобождение левой вилки и размышляет " + tm + " sek");
                    }
                }

            } catch (InterruptedException ex) {
                throw new RuntimeException(ex);
            }

        }

        int tmThink(int max) throws InterruptedException {
            int tm = rnd.nextInt(max)+1;
            Thread.currentThread().sleep(tm * 1000);
            return tm;
        }

        int tmFeedPhilosoph(int max) throws InterruptedException{
            int tm = rnd.nextInt(max)+1;
            Thread.currentThread().sleep(tm * 1000);
            return tm;
        }
}
