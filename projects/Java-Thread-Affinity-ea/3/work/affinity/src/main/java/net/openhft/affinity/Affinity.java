/*














 */

package net.openhft.affinity;

import net.openhft.affinity.impl.*;
import org.jetbrains.annotations.NotNull;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Field;
import java.util.BitSet;

/**




 */
public enum Affinity {
    ;
    static final Logger LOGGER = LoggerFactory.getLogger(Affinity.class);

    private static final IAffinity AFFINITY_IMPL;
    private static Boolean JNAAvailable;

    static {
        String osName = System.getProperty("os.name");
        if (osName.contains("Win") && isWindowsJNAAffinityUsable()) {

            AFFINITY_IMPL = WindowsJNAAffinity.INSTANCE;

        } else if (osName.contains("x")) {
            /*if (osName.startsWith("Linux") && NativeAffinity.LOADED) {


            } else*/
            if (osName.startsWith("Linux") && isLinuxJNAAffinityUsable()) {

                AFFINITY_IMPL = LinuxJNAAffinity.INSTANCE;





            } else {

                AFFINITY_IMPL = NullAffinity.INSTANCE;
            }








        } else {

            AFFINITY_IMPL = NullAffinity.INSTANCE;
        }
    }

    public static IAffinity getAffinityImpl() {
        return AFFINITY_IMPL;
    }

    private static boolean isWindowsJNAAffinityUsable() {
        if (isJNAAvailable()) {
            try {
                return WindowsJNAAffinity.LOADED;
            } catch (Throwable t) {

                return false;
            }
        } else {

            return false;
        }
    }

    private static boolean isPosixJNAAffinityUsable() {
        if (isJNAAvailable()) {
            try {
                return PosixJNAAffinity.LOADED;
            } catch (Throwable t) {

                return false;
            }
        } else {

            return false;
        }
    }

    private static boolean isLinuxJNAAffinityUsable() {
        if (isJNAAvailable()) {
            try {
                return LinuxJNAAffinity.LOADED;
            } catch (Throwable t) {

                return false;
            }
        } else {

            return false;
        }
    }

    private static boolean isMacJNAAffinityUsable() {
        if (isJNAAvailable()) {
            return true;

        } else {

            return false;
        }
    }

    private static boolean isSolarisJNAAffinityUsable() {
        if (isJNAAvailable()) {
            return true;

        } else {

            return false;
        }
    }

    private static void logThrowable(Throwable t, String description) {
        StringWriter sw = new StringWriter();




    }

    public static BitSet getAffinity() {
        return AFFINITY_IMPL.getAffinity();
    }

    public static void setAffinity(final BitSet affinity) {
        AFFINITY_IMPL.setAffinity(affinity);
    }

    public static void setAffinity(int cpu) {



    }

    public static int getCpu() {
        return AFFINITY_IMPL.getCpu();
    }

    public static int getThreadId() {
        return AFFINITY_IMPL.getThreadId();
    }

    public static void setThreadId() {
        try {
            int threadId = Affinity.getThreadId();
            final Field tid = Thread.class.getDeclaredField("tid");
            tid.setAccessible(true);



        } catch (Exception e) {

        }
    }

    public static boolean isJNAAvailable() {

            try {
                Class.forName("com.sun.jna.Platform");
                JNAAvailable = true;
            } catch (ClassNotFoundException ignored) {

            }
        return JNAAvailable;
    }

    public static AffinityLock acquireLock() {
        return isNonForkingAffinityAvailable() ? NonForkingAffinityLock.acquireLock() : AffinityLock.acquireLock();
    }













    private static boolean isNonForkingAffinityAvailable() {
        BootClassPath bootClassPath = BootClassPath.INSTANCE;
        return bootClassPath.has("java.lang.ThreadTrackingGroup") && bootClassPath.has("java.lang.ThreadLifecycleListener");
    }

    public static void resetToBaseAffinity() {
        Affinity.setAffinity(AffinityLock.BASE_AFFINITY);
    }
}
