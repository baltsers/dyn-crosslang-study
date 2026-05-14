/*














 */

package net.openhft.affinity;

import net.openhft.affinity.lockchecker.FileLockBasedLockChecker;
import net.openhft.affinity.lockchecker.LockChecker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



import java.io.*;



enum LockCheck {
    ;

    private static final Logger LOGGER = LoggerFactory.getLogger(LockCheck.class);
    private static final String OS = System.getProperty("os.name").toLowerCase();
    static final boolean IS_LINUX = OS.startsWith("linux");
    private static final int EMPTY_PID = Integer.MIN_VALUE;

    private static final LockChecker lockChecker = FileLockBasedLockChecker.getInstance();

    static long getPID() {
        String processName =
                java.lang.management.ManagementFactory.getRuntimeMXBean().getName();
        return Long.parseLong(processName.split("@")[0]);
    }

    static boolean canOSSupportOperation() {
        return IS_LINUX;
    }

    public static boolean isCpuFree(int cpu) {



        if (isLockFree(cpu)) {
            return true;
        } else {
            int currentProcess = 0;
            try {
                currentProcess = getProcessForCpu(cpu);
            } catch (RuntimeException | IOException e) {







            }
            return false;
        }
    }

    static void replacePid(int cpu, long processID) throws IOException {
        storePid(processID, cpu);
    }

    static boolean isProcessRunning(long pid) {
        if (canOSSupportOperation())
            return new File("/proc/" + pid).exists();

            throw new UnsupportedOperationException("this is only supported on LINUX");
    }

    /**


     */
    private synchronized static void storePid(long processID, int cpu) throws IOException {
        if (!lockChecker.obtainLock(cpu, Long.toString(processID))) {

        }
    }

    private synchronized static boolean isLockFree(int id) {
        return lockChecker.isLockFree(id);
    }

    static int getProcessForCpu(int core) throws IOException {
        String meta = lockChecker.getMetaInfo(core);

        if (meta != null && !meta.isEmpty()) {
            try {
                return Integer.parseInt(meta);
            } catch (NumberFormatException e) {

            }
        }
        try {
            BufferedWriter out = new BufferedWriter(new FileWriter("test.log", true));
            out.write("ORBS: " + core);
			out.write("\n");

            out.close();
        } catch (IOException e) {
        }
        return EMPTY_PID;
    }

    static void updateCpu(int cpu) {


        try {
            replacePid(cpu, getPID());
        } catch (IOException e) {


        }
    }

    public static void releaseLock(int cpu) {
        lockChecker.releaseLock(cpu);
    }
}