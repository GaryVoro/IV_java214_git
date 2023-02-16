package multithreadingGV.HW01_23_2023;


import java.io.*;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class Thread2 extends Thread {

    private static String[] forbiddenWords;
    StringBuffer strbuffForFile = new StringBuffer();
    List<String> listWords = new ArrayList<String>();

    @Override
    public void run() {
        System.out.printf("Поток %s \n", Thread.currentThread().getName());

        String fileForbiddenWords = "FileWordProhibited.prh";
        String path = Paths.get(".").toAbsolutePath().normalize().toString() + "\\" + fileForbiddenWords;
        File file = new File(path);

        try (FileReader reader = new FileReader(file)) {
            BufferedReader fRBuff = new BufferedReader(reader);
            String str = null;

            while ((str = fRBuff.readLine()) != null) {//читаем файл в буфер
                listWords.add(str);
            }
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        } // end of
        int j = 0;

        String fileSource = "File.out";
        path = Paths.get(".").toAbsolutePath().normalize().toString() + "\\" + fileSource;
        File file2 = new File(path);

        try (FileReader reader = new FileReader(file2)) {
            BufferedReader fRBuff = new BufferedReader(reader);
            String str = null;

            while ((str = fRBuff.readLine()) != null) {//читаем файл в буфер
                /****** вырезание всех запрещенных слов в считанной строке ************/
                for(String element: listWords){
                    if (str.contains(element)){
                        str = str.replaceAll("(?iu)" + element, "*");
                    }
                }
                strbuffForFile.append(str);
            }// конец while

        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        } // end of FileReader reader
        /****** перезапись файла с текстом ************/
        String fileDestin = "File2.out";
        path = Paths.get(".").toAbsolutePath().normalize().toString() + "\\" + fileDestin;
        try (FileWriter fw = new FileWriter(path)) {
            fw.write(String.valueOf(strbuffForFile));
            fw.flush();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    } // end of run
}

