#import sys
#sys.path.insert(1,'C:/Users/yhryy/Desktop/TryRealProj/projects/pyjnius-master/work/build/lib.linux-x86_64-2.7/jnius')
#sys.path.append('build/lib.linux-x86_64-2.7/')
from jnius import autoclass


Stack = autoclass('java.util.Stack')
stack = Stack()
stack.push('hello')
stack.push('world')

print stack.pop() # --> 'world'
print stack.pop() # --> 'hello'