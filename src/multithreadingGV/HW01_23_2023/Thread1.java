package multithreadingGV.HW01_23_2023;

import java.io.*;
import java.nio.file.Paths;

public class Thread1 extends Thread {

    private final String equalsWord;

    StringBuffer strbuffForFile = new StringBuffer();
    StringBuffer strbuffForFiles = new StringBuffer();

    public Thread1(String s) {
        this.equalsWord = s;
    }

    @Override
    public void run() {
        System.out.printf("Поток %s \n", Thread.currentThread().getName());

        String path = Paths.get(".").toAbsolutePath().normalize().toString();
        File file = new File(path); //System.getProperty("user.dir")

        FilenameFilter filter = (file1, name) -> {
            // находим только файлы .in "File1.in" "File2.in" "File3.in"
            return name.endsWith(".in");
        };

        File[] files = file.listFiles(filter);

        for(int i = 0; i<files.length;i++){
            System.out.println(files[i].getName());
            try (FileReader reader = new FileReader(path + "\\" + files[i].getName())) {
                BufferedReader fRBuff = new BufferedReader(reader);
                String str;

                while ((str = fRBuff.readLine()) != null) {//читаем файл в буфер
                    strbuffForFile.append(str).append(" ");
                }
                int j;
                j = strbuffForFile.indexOf(equalsWord, 0);
                if (j != 0){ //найдено  контрольное слово
                    //добавить файл в общий буфер
                    strbuffForFiles.append(strbuffForFile);
                    strbuffForFile.delete(0, strbuffForFile.length());//очистить буфер
                }
            } catch (IOException ex) {
                System.out.println(ex.getMessage());
            } // end of try (FileReader reader = new FileReader(file))
        } // end of for(int i = 0; i<files.length;i++)

        /* записать данные из общего буфера в файл*/
        if (strbuffForFiles.length() > 0){
            String outputFile = "File.out";
            String fullName = path + "\\" + outputFile;
            try (FileWriter fw = new FileWriter(fullName)) {
                fw.write(strbuffForFiles + " ");
                fw.flush();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }// end of rand()
}

