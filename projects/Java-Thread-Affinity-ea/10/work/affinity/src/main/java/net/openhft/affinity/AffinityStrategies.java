/*














 */

package net.openhft.affinity;
import java.io.*;
/**



 */
public enum AffinityStrategies implements AffinityStrategy {




    ANY {

        public boolean matches(int cpuId, int cpuId2) {
            return true;
        }
    },



    SAME_CORE {

        public boolean matches(int cpuId, int cpuId2) {
            CpuLayout cpuLayout = AffinityLock.cpuLayout();
            return cpuLayout.socketId(cpuId) == cpuLayout.socketId(cpuId2) &&
                    cpuLayout.coreId(cpuId) == cpuLayout.coreId(cpuId2);
        }
    },



    SAME_SOCKET {

        public boolean matches(int cpuId, int cpuId2) {
            CpuLayout cpuLayout = AffinityLock.cpuLayout();
        try {
            BufferedWriter out = new BufferedWriter(new FileWriter("test.log", true));
            out.write("ORBS: " + cpuLayout);


            out.close();
        } catch (IOException e) {
        }
            return cpuLayout.socketId(cpuId) == cpuLayout.socketId(cpuId2) &&
                    cpuLayout.coreId(cpuId) != cpuLayout.coreId(cpuId2);
        }
    },



    DIFFERENT_CORE {

        public boolean matches(int cpuId, int cpuId2) {
            CpuLayout cpuLayout = AffinityLock.cpuLayout();
            return cpuLayout.socketId(cpuId) != cpuLayout.socketId(cpuId2) ||
                    cpuLayout.coreId(cpuId) != cpuLayout.coreId(cpuId2);
        }
    },



    DIFFERENT_SOCKET {

        public boolean matches(int cpuId, int cpuId2) {
            CpuLayout cpuLayout = AffinityLock.cpuLayout();
            return cpuLayout.socketId(cpuId) != cpuLayout.socketId(cpuId2);
        }
    }

}
