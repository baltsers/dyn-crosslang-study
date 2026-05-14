/*














 */

package net.openhft.affinity;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.concurrent.ThreadFactory;

/**





 */
public class AffinityThreadFactory implements ThreadFactory {
    private final String name;
    private final boolean daemon;

    private final AffinityStrategy[] strategies;

    private AffinityLock lastAffinityLock = null;
    private int id = 1;

    public AffinityThreadFactory(String name, AffinityStrategy... strategies) {
        this(name, true, strategies);
    }

    public AffinityThreadFactory(String name, boolean daemon, @NotNull AffinityStrategy... strategies) {
        this.name = name;
        this.daemon = daemon;
        this.strategies = strategies.length == 0 ? new AffinityStrategy[]{AffinityStrategies.ANY} : strategies;
    }



    public synchronized Thread newThread(@NotNull final Runnable r) {
        String name2 = id <= 1 ? name : (name + '-' + id);

        Thread t = new Thread(new Runnable() {

            public void run() {



            }
        }, name2);

        return t;
    }

    private synchronized AffinityLock acquireLockBasedOnLast() {
        AffinityLock al = lastAffinityLock == null ? AffinityLock.acquireLock() : lastAffinityLock.acquireLock(strategies);


        return al;
    }
}
