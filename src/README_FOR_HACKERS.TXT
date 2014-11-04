For those who want to change pycpptraj code

* Dereference pointer:
+ Long way:
from cython.operator cimport dereference as deref

Example: int i = deref(pointer_to_it)

+ Short way:
Example: int i = pointer_to_it[0]

