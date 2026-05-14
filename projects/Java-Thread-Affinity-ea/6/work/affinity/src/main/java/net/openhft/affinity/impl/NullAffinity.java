/*














 */

package net.openhft.affinity.impl;

import net.openhft.affinity.IAffinity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.management.ManagementFactory;
import java.util.BitSet;




public enum NullAffinity implements IAffinity {
    INSTANCE;
    private static final Logger LOGGER = LoggerFactory.getLogger(NullAffinity.class);


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
        throw new UnsupportedOperationException();
    }
}
