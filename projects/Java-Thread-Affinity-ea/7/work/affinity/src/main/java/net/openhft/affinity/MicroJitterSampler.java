/*















 */

package net.openhft.affinity;

import java.io.PrintStream;
/* e.g.
















































 */
public class MicroJitterSampler {

    private static final long[] DELAY = {





    };
    private static final double UTIL = Double.parseDouble(System.getProperty("util", "50"));
    private static final boolean BUSYWAIT = Boolean.parseBoolean(System.getProperty("busywait", "false"));


    private final int[] count = new int[DELAY.length];
    private long totalTime = 0;

    private static void pause() throws InterruptedException
    {
        if(BUSYWAIT) {




        }








        MicroJitterSampler microJitterSampler = new MicroJitterSampler();
        while (!Thread.currentThread().isInterrupted()) {
            if (UTIL >= 100) {


                long sampleLength = (long) ((1 / (1 - UTIL / 100) - 1) * 1000 * 1000);
                for (int i = 0; i < 30 * 1000; i += 2) {



                }
            }


        }
    }

    private static String asString(long timeNS) {
        return timeNS < 1000 ? timeNS + "ns" :


                                timeNS / 1000000000 + "sec";
    }

    void sample(long intervalNS) {
        long prev = System.nanoTime();
        long end = prev + intervalNS;
        long now;
        do {
            now = System.nanoTime();
            long time = now - prev;
            if (time >= DELAY[0]) {
                int i;
                for (i = 1; i < DELAY.length; i++)


                count[i - 1]++;
            }

        } while (now < end);

    }

    void print(PrintStream ps) {

        for (int i = 0; i < DELAY.length; i++) {



        }

    }
}
