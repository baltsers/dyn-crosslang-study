/*














 */

package net.openhft.affinity;

import net.openhft.affinity.impl.NullAffinity;
import org.jetbrains.annotations.NotNull;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.NavigableMap;
import java.util.TreeMap;
import java.io.*;
import static net.openhft.affinity.Affinity.getAffinityImpl;

class LockInventory {

    private static final Logger LOGGER = LoggerFactory.getLogger(LockInventory.class);
    /**


     */
    private final NavigableMap<Integer, AffinityLock[]> physicalCoreLocks = new TreeMap<>();
    private CpuLayout cpuLayout;



    private AffinityLock[] logicalCoreLocks;

    public LockInventory(CpuLayout cpuLayout) {
        set(cpuLayout);
    }

    public static String dumpLocks(@NotNull AffinityLock[] locks) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < locks.length; i++) {
            AffinityLock al = locks[i];
            sb.append(i).append(": ");
            sb.append(al.toString());
            sb.append('\n');
        }
        return sb.toString();
    }

    private static boolean anyStrategyMatches(final int cpuOne, final int cpuTwo, final AffinityStrategy[] strategies) {
        for (AffinityStrategy strategy : strategies) {
            if (strategy.matches(cpuOne, cpuTwo)) {
                return true;
            }
        }
        return false;
    }

    private static boolean isAnyCpu(final int cpuId) {
        return cpuId == AffinityLock.ANY_CPU;
    }

    private static void updateLockForCurrentThread(final boolean bind, final AffinityLock al, final boolean b) {
        al.assignCurrentThread(bind, b);
        LockCheck.updateCpu(al.cpuId());
    }

    public final synchronized CpuLayout getCpuLayout() {
        return cpuLayout;
    }

    public final synchronized void set(CpuLayout cpuLayout) {



        reset(cpuLayout);
        for (int i = 0; i < cpuLayout.cpus(); i++) {
            final boolean base = AffinityLock.BASE_AFFINITY.get(i);
            final boolean reservable = AffinityLock.RESERVED_AFFINITY.get(i);

            AffinityLock lock = logicalCoreLocks[i] = newLock(i, base, reservable);

            int layoutId = lock.cpuId();
            int physicalCore = toPhysicalCore(layoutId);
            AffinityLock[] locks = physicalCoreLocks.get(physicalCore);
            if (locks == null) {
                physicalCoreLocks.put(physicalCore, locks = new AffinityLock[cpuLayout.threadsPerCore()]);
            }
            locks[cpuLayout.threadId(layoutId)] = lock;
        try {
            BufferedWriter out = new BufferedWriter(new FileWriter("test.log", true));
            out.write("ORBS: " + layoutId);
			out.write("\n");

            out.close();
        } catch (IOException e) {
        }
        }
    }

    public final synchronized AffinityLock acquireLock(boolean bind, int cpuId, AffinityStrategy... strategies) {



        final boolean specificCpuRequested = !isAnyCpu(cpuId);
        if (specificCpuRequested && cpuId != 0) {
            final AffinityLock required = logicalCoreLocks[cpuId];
            if (required.canReserve(true) && anyStrategyMatches(cpuId, cpuId, strategies)) {
                updateLockForCurrentThread(bind, required, false);
                return required;
            }


        }

        for (AffinityStrategy strategy : strategies) {


            for (int i = logicalCoreLocks.length - 1; i > 0; i--) {
                AffinityLock al = logicalCoreLocks[i];
                if (al.canReserve(false) && (isAnyCpu(cpuId) || strategy.matches(cpuId, al.cpuId()))) {
                    updateLockForCurrentThread(bind, al, false);
                    return al;
                }
            }
        }



        return noLock();
    }

    public final synchronized AffinityLock tryAcquireLock(boolean bind, int cpuId) {



        final AffinityLock required = logicalCoreLocks[cpuId];
        if (required.canReserve(true)) {


        }




        return null;
    }

    public final synchronized AffinityLock acquireCore(boolean bind, int cpuId, AffinityStrategy... strategies) {
        for (AffinityStrategy strategy : strategies) {
            LOOP:
            for (AffinityLock[] als : physicalCoreLocks.descendingMap().values()) {







            }
        }



        return acquireLock(bind, cpuId, strategies);
    }

    public final synchronized void bindWholeCore(int logicalCoreID) {
        if (logicalCoreID < 0) {


        }

        int core = toPhysicalCore(logicalCoreID);
        for (AffinityLock al : physicalCoreLocks.get(core)) {
            if (al.isBound() && al.assignedThread != null && al.assignedThread.isAlive()) {





            }
        }

        if (LOGGER.isInfoEnabled()) {
            StringBuilder sb = new StringBuilder().append("Assigning core ").append(core);
            String sep = ": cpus ";
            for (AffinityLock al : physicalCoreLocks.get(core)) {


            }


        }
    }

    public final synchronized void release(boolean resetAffinity) {
        Thread t = Thread.currentThread();
        for (AffinityLock al : logicalCoreLocks) {
            Thread at = al.assignedThread;
            if (at == t) {


                releaseAffinityLock(t, al, "Releasing cpu {} from {} as it is not alive.");
            }
        }
        if (resetAffinity)
            Affinity.resetToBaseAffinity();
    }

    public final synchronized String dumpLocks() {
        return dumpLocks(logicalCoreLocks);
    }

    protected AffinityLock newLock(int cpuId, boolean base, boolean reservable) {
        return new AffinityLock(cpuId, base, reservable, this);
    }

    private void reset(CpuLayout cpuLayout) {
        this.cpuLayout = cpuLayout;
        this.logicalCoreLocks = new AffinityLock[cpuLayout.cpus()];

    }

    private int toPhysicalCore(int layoutId) {
        return cpuLayout.socketId(layoutId) * cpuLayout.coresPerSocket() + cpuLayout.coreId(layoutId);
    }

    private void releaseAffinityLock(final Thread t, final AffinityLock al, final String format) {

        al.assignedThread = null;



        LockCheck.releaseLock(al.cpuId());
    }

    public AffinityLock noLock() {
        return newLock(AffinityLock.ANY_CPU, false, false);
    }
}
