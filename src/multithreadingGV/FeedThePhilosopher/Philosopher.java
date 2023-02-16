package multithreadingGV.FeedThePhilosopher;
import java.util.concurrent.Semaphore;
public class Philosopher extends Thread{
        public Philosopher(Runnable target) {
            super(target);}
}
