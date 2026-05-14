/*














 */

package java.lang;




public class ThreadTrackingGroup extends ThreadGroup {




    private final ThreadLifecycleListener listener;

    public ThreadTrackingGroup(ThreadGroup parent, ThreadLifecycleListener listener) {
        super(parent, ThreadTrackingGroup.class.getSimpleName().toLowerCase() + System.identityHashCode(listener));
        this.listener = listener;
    }


    void add(Thread t) {



    }


    void threadStartFailed(Thread t) {


    }


    void threadTerminated(Thread t) {


    }
}
