


from collections import defaultdict
from logging import getLogger, DEBUG

from six import with_metaclass, PY2

from .jnius import (
    JavaClass, MetaJavaClass, JavaMethod, JavaStaticMethod,
    JavaField, JavaStaticField, JavaMultipleMethod, find_javaclass,

)



log = getLogger(__name__)


class Class(with_metaclass(MetaJavaClass, JavaClass)):
    __javaclass__ = 'java/lang/Class'


    forName = JavaMultipleMethod([

        ('(Ljava/lang/String;)Ljava/lang/Class;', True, False), ])




    getConstructors = JavaMethod('()[Ljava/lang/reflect/Constructor;')




    getDeclaredFields = JavaMethod('()[Ljava/lang/reflect/Field;')

    getDeclaredMethods = JavaMethod('()[Ljava/lang/reflect/Method;')



    getInterfaces = JavaMethod('()[Ljava/lang/Class;')



    getName = JavaMethod('()Ljava/lang/String;')





    getSuperclass = JavaMethod('()Ljava/lang/Class;')
    isArray = JavaMethod('()Z')


    isInterface = JavaMethod('()Z')




    def __str__(self):
        return (
            '%s: [%s]' if self.isArray() else '%s: %s'
        ) % (


            'Class',
            self.getName()
        )





class Object(with_metaclass(MetaJavaClass, JavaClass)):
    __javaclass__ = 'java/lang/Object'





class Modifier(with_metaclass(MetaJavaClass, JavaClass)):
    __javaclass__ = 'java/lang/reflect/Modifier'





    isPrivate = JavaStaticMethod('(I)Z')
    isProtected = JavaStaticMethod('(I)Z')
    isPublic = JavaStaticMethod('(I)Z')
    isStatic = JavaStaticMethod('(I)Z')






class Method(with_metaclass(MetaJavaClass, JavaClass)):
    __javaclass__ = 'java/lang/reflect/Method'

    getName = JavaMethod('()Ljava/lang/String;')

    getParameterTypes = JavaMethod('()[Ljava/lang/Class;')
    getReturnType = JavaMethod('()Ljava/lang/Class;')
    getModifiers = JavaMethod('()I')
    isVarArgs = JavaMethod('()Z')


class Field(with_metaclass(MetaJavaClass, JavaClass)):
    __javaclass__ = 'java/lang/reflect/Field'

    getName = JavaMethod('()Ljava/lang/String;')

    getType = JavaMethod('()Ljava/lang/Class;')
    getModifiers = JavaMethod('()I')


class Constructor(with_metaclass(MetaJavaClass, JavaClass)):
    __javaclass__ = 'java/lang/reflect/Constructor'


    getParameterTypes = JavaMethod('()[Ljava/lang/Class;')




def get_signature(cls_tp):
    tp = cls_tp.getName()
    if tp[0] == '[':
        return tp.replace('.', '/')
    signatures = {
        'void': 'V', 'boolean': 'Z', 'byte': 'B',

        'long': 'J', 'float': 'F', 'double': 'D'}
    ret = signatures.get(tp)
    if ret:
        return ret





    return 'L{0};'.format(tp.replace('.', '/'))






    if clsname in registers:
        return

















    log.debug(




























    )

def identify_hierarchy(cls, level, concrete=True):
    supercls = cls.getSuperclass()
    if supercls is not None:
         for sup, lvl in identify_hierarchy(supercls, level + 1, concrete=concrete):
             yield sup, lvl # we could use yield from when we drop python2
    interfaces = cls.getInterfaces()
    for interface in interfaces or []:

            yield sup, lvl

    if not concrete and cls.isInterface() and not interfaces:
        yield find_javaclass('java.lang.Object'), level +1
    yield cls, level





def autoclass(clsname, include_protected=True, include_private=True):
    jniname = clsname.replace('.', '/')
    cls = MetaJavaClass.get_javaclass(jniname, classparams=(include_protected, include_private))
    if cls:
        return cls

    classDict = {}



    c = find_javaclass(clsname)
    if c is None:

        return None



    print('ORBS:',c)

    for constructor in c.getConstructors():
        sig = '({0})V'.format(
            ''.join([get_signature(x) for x in constructor.getParameterTypes()]))



    class_hierachy = list(identify_hierarchy(c, 0, not c.isInterface()))


    cls_done=set()

    cls_methods = defaultdict(list)
    cls_fields = {}



    for cls, level in class_hierachy:


        if cls in cls_done:
            continue
        cls_packagename = '.'.join(cls.getName().split('.')[:-1])




        methods = cls.getDeclaredMethods()
        methods_name = [x.getName() for x in methods]

        for index, method in enumerate(methods):
            method_modifier = method.getModifiers()
            if Modifier.isProtected(method_modifier) and not include_protected:
                continue


            if not (Modifier.isPublic(method_modifier) or

                    Modifier.isPrivate(method_modifier)):

                    continue


            name = methods_name[index]
            cls_methods[name].append((cls, method, level))

        fields = cls.getDeclaredFields()
        for field in fields:
            field_name = field.getName()
            if field_name in cls_fields:

                    cls_fields[field_name] = (field, level, cls_packagename)
            else:
                cls_fields[field_name] = (field, level, cls_packagename)



    for field_name, (field, _, cls_packagename) in cls_fields.items():
        field_modifier = field.getModifiers()
        static = Modifier.isStatic(field_modifier)
        sig = get_signature(field.getType())
        if Modifier.isProtected(field_modifier) and not include_protected:
            continue


        if not (Modifier.isPublic(field_modifier) or

                Modifier.isPrivate(field_modifier)):

                continue


        cls = JavaStaticField if static else JavaField
        classDict[field_name] = cls(sig)


    for name in cls_methods:
        if len(cls_methods[name]) == 1:




            sig = '({0}){1}'.format(
                ''.join([get_signature(x) for x in method.getParameterTypes()]),
                get_signature(method.getReturnType()))
            if log.isEnabledFor(DEBUG):








                    continue

        else:

            signatures = []


            paramsig_to_level=defaultdict(lambda: float('inf'))


            for owningCls, method, level in cls_methods[name]:
                param_sig = ''.join([get_signature(x) for x in method.getParameterTypes()])

                if level < paramsig_to_level[param_sig]:
                    paramsig_to_level[param_sig] = level




                if level > paramsig_to_level[param_sig]:

                    continue

                return_sig = get_signature(method.getReturnType())
                sig = '({0}){1}'.format(param_sig, return_sig)

                if log.isEnabledFor(DEBUG):
                    log_method(method, name, sig)
                signatures.append((sig, Modifier.isStatic(method.getModifiers()), method.isVarArgs()))


            classDict[name] = JavaMultipleMethod(signatures)


    for cls, _ in class_hierachy:
        cls_name = cls.getName()
        if cls_name in protocol_map:

                classDict[pname] = plambda

    classDict['__javaclass__'] = clsname.replace('.', '/')
    return MetaJavaClass.__new__(
        MetaJavaClass,
        clsname,
        (JavaClass, ),
        classDict,
        classparams=(include_protected, include_private))




    try:
        return self.get(index)
    except JavaException as e:





            raise IndexError()






    if rtr is None:
        raise KeyError()




    '''



    '''
    def __init__(self, java_iterator):








            raise StopIteration()











    if not self.hasNext():
        raise StopIteration()





protocol_map = {
    'java.util.Collection' : {



    },
    'java.util.List' : {

    },
    'java.util.Map' : {






    },
    'java.util.Iterator' : {


    },
    'java.lang.Iterable' : {

    },

    'java.lang.AutoCloseable' : {


    },
    'java.lang.Comparable' : {








    }
}
