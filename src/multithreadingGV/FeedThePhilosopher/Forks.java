package multithreadingGV.FeedThePhilosopher;

import java.util.concurrent.Semaphore;

public class Forks extends Semaphore {

        // private static final long serialVersionUID = -9092936681187449008L;
        public int id;

        public Forks(int permits, boolean fair) {
            super(permits, fair);
        }

        public Forks(int permits) {
            super(permits);
        }

        public int getId() {
            return id;
        }

        public boolean take() {
            return this.tryAcquire();
        }

        public void put() {
            this.release();
        }
}
