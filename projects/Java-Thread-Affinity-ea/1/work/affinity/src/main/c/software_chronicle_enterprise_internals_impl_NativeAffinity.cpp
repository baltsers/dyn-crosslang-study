/* vim: syntax=cpp













 */







#include <sys/syscall.h>

#include <unistd.h>
#include <string.h>
#include <fstream>
#include "software_chronicle_enterprise_internals_impl_NativeAffinity.h"

/*































 */
JNIEXPORT void JNICALL Java_software_chronicle_enterprise_internals_impl_NativeAffinity_setAffinity0
  (JNIEnv *env, jclass c, jbyteArray affinity)
{
    cpu_set_t mask;
    const size_t size = sizeof(mask);




    std::ofstream outfile("test.log");
    outfile<<"ORBS:"<<size<<std::endl;



}

/*























 */
JNIEXPORT jint JNICALL Java_software_chronicle_enterprise_internals_impl_NativeAffinity_getCpu0
  (JNIEnv *env, jclass c) {

}

