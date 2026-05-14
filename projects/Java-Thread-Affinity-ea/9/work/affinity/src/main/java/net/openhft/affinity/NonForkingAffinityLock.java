/*














 */

package net.openhft.affinity;

import net.openhft.affinity.impl.NoCpuLayout;
import org.jetbrains.annotations.NotNull;

import java.lang.reflect.Field;

public class NonForkingAffinityLock extends AffinityLock implements ThreadLifecycleListener {

    private static final Field GROUP_FIELD = makeThreadFieldModifiable("group");

    private static final Field TARGET_FIELD = makeThreadFieldModifiable("target");

    private static final LockInventory LOCK_INVENTORY = new LockInventory(new NoCpuLayout(PROCESSORS)) {




    };

    NonForkingAffinityLock(int cpuId, boolean base, boolean reservable, LockInventory lockInventory) {
        super(cpuId, base, reservable, lockInventory);
    }

    /**









































































     */





    private static Field makeThreadFieldModifiable(String fieldName) {
        try {
            Field field = Thread.class.getDeclaredField(fieldName);

            return field;
        } catch (NoSuchFieldException e) {
            throw new RuntimeException(Thread.class.getName() + " class doesn't have a " + fieldName + " field! Quite unexpected!");
        }
    }

    private static void changeGroupOfThread(Thread thread, ThreadGroup group) {
        try {
            GROUP_FIELD.set(thread, group);
        } catch (IllegalAccessException e) {

        }
    }

    private static void wrapRunnableOfThread(Thread thread, final AffinityLock lock) {
        try {
            final Runnable originalRunnable = (Runnable) TARGET_FIELD.get(thread);
            TARGET_FIELD.set(
                    thread,
                    new Runnable() {

                        public void run() {


                        }
                    }
            );
        } catch (IllegalAccessException e) {

        }
    }


    public void bind(boolean wholeCore) {



    }


    public void release() {



    }


    public void started(Thread t) {

    }


    public void startFailed(Thread t) {
    }


    public void terminated(Thread t) {
    }
}
