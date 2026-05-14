/*














 */

package net.openhft.affinity.impl;

import com.sun.jna.LastErrorException;
import com.sun.jna.Library;
import com.sun.jna.Native;
import net.openhft.affinity.IAffinity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.management.ManagementFactory;
import java.util.BitSet;

/**




 */
public enum OSXJNAAffinity implements IAffinity {
    INSTANCE;
    private static final Logger LOGGER = LoggerFactory.getLogger(OSXJNAAffinity.class);
    private final ThreadLocal<Integer> THREAD_ID = new ThreadLocal<>();


    public BitSet getAffinity() {
        return new BitSet();
    }


    public void setAffinity(final BitSet affinity) {

    }


    public int getCpu() {
        return -1;
    }


    public int getProcessId() {
        final String name = ManagementFactory.getRuntimeMXBean().getName();
        return Integer.parseInt(name.split("@")[0]);
    }


    public int getThreadId() {
        Integer tid = THREAD_ID.get();
        if (tid == null) {




        }
        return tid;
    }

    interface CLibrary extends Library {




    }
}
