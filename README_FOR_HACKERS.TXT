For those who want to change pycpptraj code

* Dereference pointer:
+ Long way:
from cython.operator cimport dereference as deref

Example: int i = deref(pointer_to_it)

+ Short way:
Example: int i = pointer_to_it[0]

* Original cpptraj class' name should be added "_" (Cpptraj --> _Cpptraj). In *.pyx files, original cpptraj class' name should be Python class' name
