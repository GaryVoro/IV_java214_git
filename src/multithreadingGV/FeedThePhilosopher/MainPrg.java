package multithreadingGV.FeedThePhilosopher;

public class MainPrg {
        public static void main(String[] args) {
            Forks[] fork = new Forks[5];
            FeedPhilosopher[] feedPhilosoph = new FeedPhilosopher[5];
            Philosopher[] philosopher = new Philosopher[5];

            //создать семафоры для ресурсов
            for (int i = 0; i < fork.length; i++) {
                fork[i] = new Forks(1);
            }

            //создать философов с семафорами для ресурсов
            for (int i=0; i<philosopher.length; i++){
                int j = (i+1)%5;
//            if (i != philosopher.length-1 ) {
                feedPhilosoph[i] = new FeedPhilosopher(i, fork[j], fork[i]);
//            } else {
//                feedPhilosoph[0] = new FeedPhilosopher(0, fork[i], fork[j]);
//            }
                philosopher[i] = new Philosopher(feedPhilosoph[i]);
                philosopher[i].start();
                // System.out.println("Философ " + (i+1));
                // System.out.println("Номер левой  вилки " + j);
                // System.out.println("Номер правой вилки " + i);

            }

        }
}
