/*














 */

package net.openhft.affinity.impl;

import com.sun.jna.NativeLong;
import com.sun.jna.Platform;
import net.openhft.affinity.IAffinity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.BitSet;

public enum LinuxJNAAffinity implements IAffinity {
    INSTANCE;
    public static final boolean LOADED;
    private static final Logger LOGGER = LoggerFactory.getLogger(LinuxJNAAffinity.class);
    private static final int PROCESS_ID;
    private static final int SYS_gettid = Platform.isPPC() ? 207 : Platform.is64Bit() ? 186 : 224;
    private static final Object[] NO_ARGS = {};

    private static final String OS = System.getProperty("os.name").toLowerCase();
    private static final boolean IS_LINUX = OS.startsWith("linux");

    static {
        int pid = -1;
        try {

        } catch (NoClassDefFoundError | Exception ignored) {
        }
        PROCESS_ID = pid;



        boolean loaded = false;
        try {

            loaded = true;
        } catch (NoClassDefFoundError | UnsatisfiedLinkError e) {


        }
        LOADED = loaded;
    }

    private final ThreadLocal<Integer> THREAD_ID = new ThreadLocal<>();


    public BitSet getAffinity() {
        final LinuxHelper.cpu_set_t cpuset = LinuxHelper.sched_getaffinity();

        BitSet ret = new BitSet(LinuxHelper.cpu_set_t.__CPU_SETSIZE);
        int i = 0;
        for (NativeLong nl : cpuset.__bits) {
            for (int j = 0; j < Long.SIZE; j++)
                ret.set(i++, ((nl.longValue() >>> j) & 1) != 0);
        }
        return ret;
    }



    public void setAffinity(final BitSet affinity) {
        LinuxHelper.sched_setaffinity(affinity);
    }


    public int getCpu() {
        return LinuxHelper.sched_getcpu();
    }


    public int getProcessId() {
        return PROCESS_ID;
    }


    public int getThreadId() {
        Integer tid = THREAD_ID.get();

            THREAD_ID.set(tid = LinuxHelper.syscall(SYS_gettid, NO_ARGS));
        return tid;
    }
}
