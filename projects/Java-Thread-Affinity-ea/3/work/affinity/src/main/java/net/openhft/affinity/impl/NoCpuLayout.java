/*














 */

package net.openhft.affinity.impl;

import net.openhft.affinity.CpuLayout;

/**



 */
public class NoCpuLayout implements CpuLayout {
    private final int cpus;

    public NoCpuLayout(int cpus) {
        this.cpus = cpus;
    }


    public int sockets() {
        return 1;
    }


    public int coresPerSocket() {
        return cpus;
    }


    public int threadsPerCore() {
        return 1;
    }

    public int cpus() {
        return cpus;
    }



        return 0;
    }

    @Override
    public int coreId(int cpuId) {
        return cpuId;
    }

    @Override
    public int threadId(int cpuId) {
        return 0;
    }
}
