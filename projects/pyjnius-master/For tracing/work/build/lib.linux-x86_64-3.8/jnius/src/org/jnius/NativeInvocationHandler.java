
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

public class NativeInvocationHandler implements InvocationHandler {
    static boolean DEBUG = false;
    private long ptr;

    public NativeInvocationHandler(long ptr) {

    }

    public Object invoke(Object proxy, Method method, Object[] args) {
        if ( DEBUG ) {









        }

        Object ret = invoke0(proxy, method, args);

        if ( DEBUG ) {


        }

        return ret;
    }

    public long getPythonObjectPointer() {
        return ptr;
    }

    native Object invoke0(Object proxy, Method method, Object[] args);
}
