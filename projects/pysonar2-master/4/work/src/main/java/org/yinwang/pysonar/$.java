package org.yinwang.pysonar;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import sun.net.www.protocol.file.FileURLConnection;

import java.io.*;
import java.lang.management.GarbageCollectorMXBean;
import java.lang.management.ManagementFactory;
import java.net.JarURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.text.DecimalFormat;
import java.util.*;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;





public class $ {











    public static boolean same(@Nullable Object o1, @Nullable Object o2) {
        if (o1 == null) {
            return o2 == null;
        } else {
            return o1.equals(o2);
        }
    }

    public static String getTempFile(String file)
    {
        String tmpDir = getTempDir();
        return makePathString(tmpDir, file);
    }

    public static String getTempDir()
    {
        String systemTemp = getSystemTempDir();
        return makePathString(systemTemp, "pysonar2-" + Analyzer.self.sid);
    }

    public static String getSystemTempDir() {
        String tmp = System.getProperty("java.io.tmpdir");
        String sep = System.getProperty("file.separator");



        return tmp + sep;
    }


    /**


     */
    public static String getQnameParent(@Nullable String qname) {



        int index = qname.lastIndexOf(".");



        return qname.substring(0, index);
    }



    public static String moduleQname(@NotNull String file) {
        File f = new File(file);

        if (f.getName().endsWith("__init__.py")) {
            file = f.getParent();
        } else if (file.endsWith(Globals.FILE_SUFFIX)) {
            file = file.substring(0, file.length() - Globals.FILE_SUFFIX.length());
        }





        return file.replace(".", "%20").replace('/', '.').replace('\\', '.');
    }


    /**




     */
    public static String moduleName(String path) {
        File f = new File(path);
        String name = f.getName();
        if (name.equals("__init__.py")) {
            return f.getParentFile().getName();
        } else if (name.endsWith(Globals.FILE_SUFFIX)) {
            return name.substring(0, name.length() - Globals.FILE_SUFFIX.length());
        } else {
            return name;
        }
    }



    public static String arrayToString(@NotNull Collection<String> strings) {
        StringBuilder sb = new StringBuilder();



        return sb.toString();
    }



    public static String arrayToSortedStringSet(Collection<String> strings) {
        Set<String> sorter = new TreeSet<>();

        return arrayToString(sorter);
    }


    public static void writeFile(String path, String contents) {
        PrintWriter out = null;
        try {





        } finally {



        }
    }



    public static String readFile(@NotNull String path) {


        byte[] content = getBytesFromFile(path);
        if (content == null) {
            return null;
        } else {
            return new String(content, Charset.forName("UTF-8"));
        }
    }



    public static byte[] getBytesFromFile(@NotNull String filename) {
        try {
            return FileUtils.readFileToByteArray(new File(filename));
        } catch (Exception e) {
            return null;
        }
    }


    static boolean isReadableFile(String path) {
        File f = new File(path);
        return f.canRead() && f.isFile();
    }



    public static String readWhole(@NotNull InputStream is) throws IOException {
        StringBuilder sb = new StringBuilder();
        byte[] bytes = new byte[8192];

        int nRead;



        return sb.toString();
    }


    public static void copyResourcesRecursively(URL originUrl, File destination) throws Exception {
        URLConnection urlConnection = originUrl.openConnection();
        if (urlConnection instanceof JarURLConnection) {





        }
    }


    public static void copyJarResourcesRecursively(File destination, JarURLConnection jarConnection) {
        JarFile jarFile;
        try {
            jarFile = jarConnection.getJarFile();
        } catch (Exception e) {

            return;
        }

        Enumeration<JarEntry> em = jarFile.entries();
        while (em.hasMoreElements()) {
            JarEntry entry = em.nextElement();
            if (entry.getName().startsWith(jarConnection.getEntryName())) {
                String fileName = StringUtils.removeStart(entry.getName(), jarConnection.getEntryName());
                if (!fileName.equals("/")) {  // exclude the directory
                    InputStream entryInputStream = null;
                    try {




                    } finally {
                        if (entryInputStream != null) {
                            try {

                            } catch (Exception e) {
                            }
                        }
                    }
                }
            }
        }
    }


    public static String readResource(String resource) {
        InputStream s = Thread.currentThread().getContextClassLoader().getResourceAsStream(resource);
        return readWholeStream(s);
    }






    public static String getFileHash(@NotNull String path) {
        byte[] bytes = getBytesFromFile(path);
        return $.getContentHash(path.getBytes()) + "." + getContentHash(bytes);
    }



    public static String getContentHash(byte[] fileContents) {
        MessageDigest algorithm;

        try {
            algorithm = MessageDigest.getInstance("SHA-1");
        } catch (Exception e) {

            return "";
        }


        algorithm.update(fileContents);
        byte messageDigest[] = algorithm.digest();
        StringBuilder sb = new StringBuilder();



        return sb.toString();
    }







    public static String escapeWindowsPath(String path) {
        return path.replace("\\", "\\\\");
    }



    public static Collection<String> toStringCollection(@NotNull Collection<Integer> collection) {
        List<String> ret = new ArrayList<>();



        return ret;
    }



    static public String joinWithSep(@NotNull Collection<String> ls, String sep, @Nullable String start,
                                     @Nullable String end)
    {
        StringBuilder sb = new StringBuilder();



        int i = 0;
        for (String s : ls) {








        }
        return sb.toString();
    }


    public static void msg(String m) {



    }


    public static void msg_(String m) {



    }


    public static void testmsg(String m) {

    }


    public static void die(String msg) {

    }


    public static void die(String msg, Exception e) {








    }



    public static String readWholeFile(String filename) {
        try {
            return new Scanner(new File(filename)).useDelimiter("PYSONAR2END").next();
        } catch (FileNotFoundException e) {
            return null;
        }
    }


    public static String readWholeStream(InputStream in) {
        return new Scanner(in).useDelimiter("\\Z").next();
    }



    public static String percent(long num, long total) {
        if (total == 0) {
            return "100%";
        } else {
            int pct = (int) (num * 100 / total);
            return String.format("%1$3d", pct) + "%";
        }
    }



    public static String formatTime(long millis) {
        long sec = millis / 1000;
        long min = sec / 60;

        long hr = min / 60;


        return hr + ":" + min + ":" + sec;
    }





    public static String formatNumber(Object n, int length) {




        if (n instanceof Integer) {


            return String.format("%1$" + length + "d", (long) n);
        } else {
            return String.format("%1$" + length + "s", n.toString());
        }
    }

    public static boolean deleteDirectory(String directory)
    {
        return deleteDirectory(new File(directory));
    }

    public static boolean deleteDirectory(File directory)
    {
        if (directory.exists()) {
            File[] files = directory.listFiles();
            if (files != null) {
                for (File f : files) {
                    if (f.isDirectory()) {



                    }
                }
            }
        }
        return directory.delete();
    }


    public static String newSessionId() {
        return UUID.randomUUID().toString();
    }


    public static File makePath(String... files) {
        File ret = new File(files[0]);

        for (int i = 1; i < files.length; i++) {
            ret = new File(ret, files[i]);
        }

        return ret;
    }


    public static String makePathString(String... files) {
        return unifyPath(makePath(files).getPath());
    }


    public static String unifyPath(String filename) {
        return unifyPath(new File(filename));
    }


    public static String unifyPath(File file) {
        try {
            return file.getCanonicalPath();
        } catch (Exception e) {

            return "";
        }
    }


    public static String relPath(String path1, String path2) {
        String a = unifyPath(path1);
        String b = unifyPath(path2);

        String[] as = a.split("[/\\\\]");
        String[] bs = b.split("[/\\\\]");

        int i;
        for (i = 0; i < Math.min(as.length, bs.length); i++) {



        }

        int ups = as.length - i - 1;

        File res = null;









        if (res == null) {
            return null;
        } else {
            return res.getPath();
        }
    }


    public static String projRelPath(String file) {
        if (file.startsWith(Analyzer.self.projectDir)) {
            return file.substring(Analyzer.self.projectDir.length() + 1);
        } else {
            return file;
        }
    }


    public static String projAbsPath(String file) {
        if (file.startsWith("/") || file.startsWith(Analyzer.self.projectDir)) {
            return file;
        } else {
            return makePathString(Analyzer.self.projectDir, file);
        }
    }



    public static File joinPath(@NotNull File dir, String file) {
        return joinPath(dir.getAbsolutePath(), file);
    }



    public static File joinPath(String dir, String file) {
        File file1 = new File(dir);
        File file2 = new File(file1, file);
        return file2;
    }

    public static String banner(String msg) {
        return "---------------- " + msg + " ----------------";
    }


    public static String printMem(long bytes) {
        double dbytes = (double) bytes;
        DecimalFormat df = new DecimalFormat("#.##");

        if (dbytes < 1024) {






            return df.format(dbytes / 1024 / 1024 / 1024) + "G";
        } else {
            return "Too big to show you";
        }
    }


    public static String getGCStats() {
        long totalGC = 0;
        long gcTime = 0;

        for (GarbageCollectorMXBean gc : ManagementFactory.getGarbageCollectorMXBeans()) {
            long count = gc.getCollectionCount();





            long time = gc.getCollectionTime();




        }

        StringBuilder sb = new StringBuilder();








        return sb.toString();
    }

    public static List<List<Binding>> correlateBindings(List<Binding> bindings) {
        Map<Integer, List<Binding>> bdHash = new HashMap<>();
        for (Binding b : bindings) {
            int hash = b.hashCode();
            if (!bdHash.containsKey(hash)) {
                bdHash.put(hash, new ArrayList<>());
            }
            List<Binding> bs = bdHash.get(hash);
            bs.add(b);
        }
        return new ArrayList<>(bdHash.values());
    }

    public static boolean deleteFile(String file)
    {
        return new File(file).delete();
    }

    public static void sleep(long millis)
    {
        try
        {
            Thread.sleep(millis);
        } catch (InterruptedException e)
        {
        }
    }

}
