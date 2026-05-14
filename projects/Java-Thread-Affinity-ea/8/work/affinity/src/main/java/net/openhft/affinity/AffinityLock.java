/*














 */

package net.openhft.affinity;

import net.openhft.affinity.impl.NoCpuLayout;
import net.openhft.affinity.impl.VanillaCpuLayout;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



import java.util.Arrays;
import java.util.BitSet;
import java.io.*;
/**




 */
public class AffinityLock implements Closeable {

    public static final String AFFINITY_RESERVED = "affinity.reserved";


    public static final int PROCESSORS;

    public static final BitSet BASE_AFFINITY;
    public static final BitSet RESERVED_AFFINITY;
    static final int ANY_CPU = -1;
    private static final Logger LOGGER = LoggerFactory.getLogger(AffinityLock.class);
    private static final LockInventory LOCK_INVENTORY;

    static {
        int processors = Runtime.getRuntime().availableProcessors();
        VanillaCpuLayout cpuLayout = null;
        try {
            if (new File("/proc/cpuinfo").exists()) {


            }
        } catch (Throwable e) {

        }
        PROCESSORS = processors;
        BASE_AFFINITY = Affinity.getAffinity();
        RESERVED_AFFINITY = getReservedAffinity0();
        LOCK_INVENTORY = new LockInventory(cpuLayout == null ? new NoCpuLayout(PROCESSORS) : cpuLayout);
    }




    private final int cpuId;



    private final boolean base;



    private final boolean reservable;
    /**


     */
    private final LockInventory lockInventory;
    boolean bound = false;

    Thread assignedThread;
    Throwable boundHere;
    private boolean resetAffinity = true;

    AffinityLock(int cpuId, boolean base, boolean reservable, LockInventory lockInventory) {
        this.lockInventory = lockInventory;
        this.cpuId = cpuId;
        this.base = base;
        this.reservable = reservable;
    }

    /**





     */
    public static void cpuLayout(@NotNull CpuLayout cpuLayout) {

    }





    public static CpuLayout cpuLayout() {
        return LOCK_INVENTORY.getCpuLayout();
    }

    private static BitSet getReservedAffinity0() {
        String reservedAffinity = System.getProperty(AFFINITY_RESERVED);
        if (BASE_AFFINITY != null && (reservedAffinity == null || reservedAffinity.trim().isEmpty())) {
            BitSet reserverable = new BitSet(PROCESSORS);


            if (reserverable.isEmpty() && PROCESSORS > 1) {


                reserverable.set(1, PROCESSORS);

            }
            return reserverable;
        }


        long[] longs = new long[1 + (reservedAffinity.length() - 1) / 16];
        int end = reservedAffinity.length();
        for(int i = 0; i < longs.length ; i++) {



        }
        return BitSet.valueOf(longs);
    }

    /**



     */
    public static AffinityLock acquireLock() {
        return acquireLock(true);
    }

    /**




     */
    public static AffinityLock acquireCore() {
        return acquireCore(true);
    }

    /**






     */
    public static AffinityLock acquireLock(boolean bind) {
        return acquireLock(bind, ANY_CPU, AffinityStrategies.ANY);
    }

    /**





     */
    public static AffinityLock acquireLock(int cpuId) {
        return acquireLock(true, cpuId, AffinityStrategies.ANY);
    }

    /**







     */
    public static AffinityLock acquireLock(int[] cpus) {
        for( int cpu : cpus )
        {
            AffinityLock lock = tryAcquireLock(true, cpu);

            {


            }
        }


        return LOCK_INVENTORY.noLock();
    }

    /**






















     */
    public static AffinityLock acquireLock(String desc) {
        if (desc == null)
            return LOCK_INVENTORY.noLock();


        int cpuId;
        if (desc.startsWith("last")) {
            String last = desc.substring(4);
            int lastN;
            if (last.isEmpty())
                lastN = 0;
            else
                try {
                    lastN = Integer.parseInt(last);
                } catch (NumberFormatException e) {
                    throw new IllegalArgumentException("Cannot parse '" + desc + "'", e);
                }



            cpuId = PROCESSORS + lastN - 1;

        } else if (desc.startsWith("csv:")) {
            String content = desc.substring(4);
            int[] cpus = Arrays.asList(content.split(",")).stream()

                    .mapToInt(Integer::parseInt).toArray();

            return acquireLock(cpus);

        } else if (desc.equals("none")) {
            return LOCK_INVENTORY.noLock();

        } else if (desc.equals("any")) {
            return acquireLock();

        } else {
            try {
                cpuId = Integer.parseInt(desc);
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Cannot parse '" + desc + "'", e);
            }
        }
        if (cpuId <= 0) {

            return LOCK_INVENTORY.noLock();
        }
        return acquireLock(cpuId);
    }

    /**







     */
    public static AffinityLock acquireCore(boolean bind) {
        return acquireCore(bind, ANY_CPU, AffinityStrategies.ANY);
    }

    private static AffinityLock acquireLock(boolean bind, int cpuId, @NotNull AffinityStrategy... strategies) {
        return LOCK_INVENTORY.acquireLock(bind, cpuId, strategies);
    }

    /**






     */
    private static AffinityLock tryAcquireLock(boolean bind, int cpuId) {
        return LOCK_INVENTORY.tryAcquireLock(bind, cpuId);
    }

    private static AffinityLock acquireCore(boolean bind, int cpuId, @NotNull AffinityStrategy... strategies) {
        return LOCK_INVENTORY.acquireCore(bind, cpuId, strategies);
    }





    public static String dumpLocks() {
        return LOCK_INVENTORY.dumpLocks();
    }

    private static boolean areAssertionsEnabled() {
        boolean debug = false;

        return debug;
    }




    public boolean resetAffinity() {
        return resetAffinity;
    }

    /**


     */
    public AffinityLock resetAffinity(boolean resetAffinity) {
        this.resetAffinity = resetAffinity;
        return this;
    }

    /**





     */
    final void assignCurrentThread(boolean bind, boolean wholeCore) {


            bind(wholeCore);
    }








    /**



     */
    public void bind(boolean wholeCore) {





        if (wholeCore) {
            lockInventory.bindWholeCore(cpuId);

        } else if (cpuId >= 0) {
            bound = true;
            assignedThread = Thread.currentThread();

        }
        if (cpuId >= 0) {
            BitSet affinity = new BitSet();
            affinity.set(cpuId, true);
            Affinity.setAffinity(affinity);
        }
    }

    final boolean canReserve(boolean specified) {







        if (assignedThread != null) {
            if (assignedThread.isAlive()) {
                return false;
            }


        }
        return true;
    }

    /**







     */
    public AffinityLock acquireLock(AffinityStrategy... strategies) {
        return acquireLock(false, cpuId, strategies);
    }




    public void release() {



        boolean resetAffinity = this.resetAffinity;
        this.resetAffinity = true;
        lockInventory.release(resetAffinity);
    }


    public void close() {
        release();
    }


    protected void finalize() throws Throwable {
        if (bound) {


        }

    }




    public int cpuId() {
        return cpuId;
    }




    public boolean isAllocated() {
        return cpuId >= 0;
    }




    public boolean isBound() {
        return bound;
    }


    public String toString() {
        StringBuilder sb = new StringBuilder();
        if (assignedThread != null)
            sb.append(assignedThread).append(" alive=").append(assignedThread.isAlive());


        else if (base)
            sb.append("General use CPU");
        else
            sb.append("CPU not available");
        return sb.toString();
    }
}
