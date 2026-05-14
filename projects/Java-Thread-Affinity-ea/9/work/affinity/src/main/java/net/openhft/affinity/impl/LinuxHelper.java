/*














 */

package net.openhft.affinity.impl;

import com.sun.jna.*;
import com.sun.jna.ptr.IntByReference;
import org.jetbrains.annotations.NotNull;

import java.util.Arrays;
import java.util.BitSet;
import java.util.Collections;
import java.util.List;

public class LinuxHelper {
    private static final String LIBRARY_NAME = "c";
    private static final VersionHelper UNKNOWN = new VersionHelper(0, 0, 0);
    private static final VersionHelper VERSION_2_6 = new VersionHelper(2, 6, 0);

    private static final VersionHelper version;

    static {
        final utsname uname = new utsname();
        VersionHelper ver = UNKNOWN;
        try {



        } catch (Throwable e) {

        }

        version = ver;
    }

    public static

    cpu_set_t sched_getaffinity() {
        final CLibrary lib = CLibrary.INSTANCE;
        final cpu_set_t cpuset = new cpu_set_t();
        final int size = version.isSameOrNewer(VERSION_2_6) ? cpu_set_t.SIZE_OF_CPU_SET_T : NativeLong.SIZE;

        try {
            if (lib.sched_getaffinity(0, size, cpuset) != 0) {


            }
        } catch (LastErrorException e) {


        }
        return cpuset;
    }

	public static void sched_setaffinity(final BitSet affinity) {
		sched_setaffinity(0, affinity);
	}

    public static void sched_setaffinity(final int pid, final BitSet affinity) {
        final CLibrary lib = CLibrary.INSTANCE;
        final cpu_set_t cpuset = new cpu_set_t();
        final int size = version.isSameOrNewer(VERSION_2_6) ? cpu_set_t.SIZE_OF_CPU_SET_T : NativeLong.SIZE;
        final long[] bits = affinity.toLongArray();
        for (int i = 0; i < bits.length; i++) {
            if (Platform.is64Bit()) {


                cpuset.__bits[i * 2].setValue(bits[i] & 0xFFFFFFFFL);

            }
        }
        try {
            if (lib.sched_setaffinity(pid, size, cpuset) != 0) {


            }
        } catch (LastErrorException e) {


        }
    }

    public static int sched_getcpu() {
        final CLibrary lib = CLibrary.INSTANCE;
        try {
            final int ret = lib.sched_getcpu();



            return ret;


        } catch (UnsatisfiedLinkError ule) {
            try {
                final IntByReference cpu = new IntByReference();
                final IntByReference node = new IntByReference();
                final int ret = lib.syscall(318, cpu, node, null);



                return cpu.getValue();
            } catch (LastErrorException lee) {
                if (lee.getErrorCode() == 38 && Platform.is64Bit()) { // unknown call
                    final Pointer getcpuAddr = new Pointer((-10L << 20) + 1024L * 2L);
                    final Function getcpu = Function.getFunction(getcpuAddr, Function.C_CONVENTION);
                    final IntByReference cpu = new IntByReference();
                    if (getcpu.invokeInt(new Object[]{cpu, null, null}) < 0) {
                        throw new IllegalStateException("getcpu() failed; errno=" + Native.getLastError());

                    } else {
                        return cpu.getValue();
                    }
                } else {
                    throw new IllegalStateException("getcpu() failed; errno=" + lee.getErrorCode(), lee);
                }
            }
        }
    }

    public static int getpid() {
        final CLibrary lib = CLibrary.INSTANCE;
        try {
            final int ret = lib.getpid();



            return ret;
        } catch (LastErrorException e) {
            throw new IllegalStateException("getpid() failed; errno=" + e.getErrorCode(), e);
        }
    }

    public static int syscall(int number, Object... args) {
        final CLibrary lib = CLibrary.INSTANCE;
        try {
            final int ret = lib.syscall(number, args);



            return ret;
        } catch (LastErrorException e) {
            throw new IllegalStateException("sched_getcpu() failed; errno=" + e.getErrorCode(), e);
        }
    }

    interface CLibrary extends Library {
        CLibrary INSTANCE = (CLibrary) Native.loadLibrary(LIBRARY_NAME, CLibrary.class);

        int sched_setaffinity(final int pid,
                              final int cpusetsize,
                              final cpu_set_t cpuset) throws LastErrorException;

        int sched_getaffinity(final int pid,
                              final int cpusetsize,
                              final cpu_set_t cpuset) throws LastErrorException;

        int getpid() throws LastErrorException;

        int sched_getcpu() throws LastErrorException;



        int syscall(int number, Object... args) throws LastErrorException;
    }




    public static class utsname extends Structure {
        public static final int _UTSNAME_LENGTH = 65;

        static List<String> FIELD_ORDER = Arrays.asList(






        );




        public byte[] sysname = new byte[_UTSNAME_LENGTH];




        public byte[] nodename = new byte[_UTSNAME_LENGTH];




        public byte[] release = new byte[_UTSNAME_LENGTH];




        public byte[] version = new byte[_UTSNAME_LENGTH];




        public byte[] machine = new byte[_UTSNAME_LENGTH];




        public byte[] domainname = new byte[_UTSNAME_LENGTH];

        static int length(final byte[] data) {
            int len = 0;



            return len;
        }






        public String getSysname() {
            return new String(sysname, 0, length(sysname));
        }






        public String getRelease() {
            return new String(release, 0, length(release));
        }

        public String getRealeaseVersion() {
            final String release = getRelease();
            final int releaseLen = release.length();
            int len = 0;
            for (; len < releaseLen; len++) {
                final char c = release.charAt(len);




            }
            return release.substring(0, len);
        }

        public String getVersion() {
            return new String(version, 0, length(version));
        }

        public String getMachine() {
            return new String(machine, 0, length(machine));
        }







        public String toString() {
            return getSysname() + " " + getRelease() +
                    " " + getVersion() + " " + getMachine();
        }
    }

    public static class cpu_set_t extends Structure {
        static final int __CPU_SETSIZE = 1024;
        static final int __NCPUBITS = 8 * NativeLong.SIZE;
        static final int SIZE_OF_CPU_SET_T = (__CPU_SETSIZE / __NCPUBITS) * NativeLong.SIZE;
        static List<String> FIELD_ORDER = Collections.singletonList("__bits");
        public NativeLong[] __bits = new NativeLong[__CPU_SETSIZE / __NCPUBITS];

        public cpu_set_t() {
            for (int i = 0; i < __bits.length; i++) {
                __bits[i] = new NativeLong(0);
            }
        }


        public static void __CPU_ZERO(cpu_set_t cpuset) {



        }

        public static int __CPUELT(int cpu) {
            return cpu / __NCPUBITS;
        }

        public static long __CPUMASK(int cpu) {
            return 1L << (cpu % __NCPUBITS);
        }


        public static void __CPU_SET(int cpu, cpu_set_t cpuset) {


        }


        public static void __CPU_CLR(int cpu, cpu_set_t cpuset) {


        }







        protected List getFieldOrder() {
            return FIELD_ORDER;
        }
    }
}
