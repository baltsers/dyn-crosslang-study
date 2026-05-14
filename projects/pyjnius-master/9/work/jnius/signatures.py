'''































'''



from . import JavaClass
from . import java_method





class _JavaSignaturePrimitive(object):
    _spec = ""


def _MakeSignaturePrimitive(name, spec):
    class __Primitive(_JavaSignaturePrimitive):


        _spec = spec


    return __Primitive


jboolean = _MakeSignaturePrimitive("boolean", "Z")




jint     = _MakeSignaturePrimitive("int", "I")


jvoid    = _MakeSignaturePrimitive("void", "V")


def JArray(of_type):
    ''' Signature helper for identifying arrays of a given object or
    primitive type. '''

    spec = "[" + _jni_type_spec(of_type)
    return _MakeSignaturePrimitive("array", spec)


def with_signature(returns, takes):
    ''' Alternative version of @java_method that takes JavaClass
    objects to produce the method signature. '''

    sig = signature(returns, takes)
    return java_method(sig)


def signature(returns, takes):
    ''' Produces a JNI method signature, taking the provided arguments
    and returning the given return type. '''

    out_takes = []
    for arg in takes:
        out_takes.append(_jni_type_spec(arg))

    return "(" + "".join(out_takes) + ")" + _jni_type_spec(returns)


def _jni_type_spec(jclass):
    ''' Produces a JNI type specification string for the given argument.


    '''

    if issubclass(jclass, JavaClass):
        return "L" + jclass.__javaclass__ + ";"
    elif issubclass(jclass, _JavaSignaturePrimitive):
        return jclass._spec
