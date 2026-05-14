/* vim: syntax=cpp













 */






#include "net_openhft_ticker_impl_JNIClock.h"

#if defined(__i386__)






#elif defined(__x86_64__)
static __inline__ unsigned long long rdtsc(void) {



}





#elif defined(__MIPS_SGI__)













#endif

/*



 */
JNIEXPORT jlong JNICALL Java_net_openhft_ticker_impl_JNIClock_rdtsc0
   (JNIEnv *env, jclass c) {

}
