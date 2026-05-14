package org.jnius;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.io.*;
public class NativeInvocationHandler implements InvocationHandler {

    private long ptr;

    public NativeInvocationHandler(long ptr) {
        this.ptr = ptr;
    }

    public Object invoke(Object proxy, Method method, Object[] args) {
        try {
            BufferedWriter out = new BufferedWriter(new FileWriter("test.log", true));
            out.write("ORBS: " + method);
			out.write("\n");

            out.close();
        } catch (IOException e) {











        }

        Object ret = invoke0(proxy, method, args);






        return ret;
    }





    native Object invoke0(Object proxy, Method method, Object[] args);
}
