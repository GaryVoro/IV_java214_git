package multithreadingGV.HW01_23_2023;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        System.out.println(Thread.currentThread().getName());
        //System.out.println("Введите путь к к существующей директории и через пробел слово для поиска: ");
        //Scanner scanner = new Scanner(System.in);
        //String linePathAndWord = scanner.nextLine();
        //String[] strPathAndWord = linePathAndWord.split(" ");

        Thread1 myThread1 = new Thread1("флот"); //слово для поиска в файле
        Thread2 myThread2 = new Thread2();

        myThread1.start();
        myThread1.join();
        System.out.println("Thread1 is over");

        myThread2.start();
    }
}
