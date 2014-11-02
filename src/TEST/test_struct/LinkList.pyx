from libc.stdlib cimport malloc, free
from cython.operator cimport dereference as deref

#import from C language
cdef import from "limits.h":
    int INT_MIN

cdef struct StackNode:
    int data
    StackNode* next

cdef StackNode* newNode(int data):
    cdef StackNode* stackNode = <StackNode*> malloc(sizeof(StackNode))

    stackNode.data = data
    stackNode.next = NULL
    return stackNode

cdef int isEmpty(StackNode* root):
    return not root

cdef void push(StackNode** root, int data):
    cdef StackNode* stackNode = newNode(data)
    stackNode.next = deref(root)
    root[0] = stackNode
    print("%d pushed to stack" % data)

cdef int pop(StackNode** root):
    if isEmpty(root[0]):
        return INT_MIN
    cdef StackNode* temp = root[0]
    root[0] = root[0].next
    cdef int popped = temp.data
    free(temp)
    return popped

cdef int peek(StackNode* root):
    if (isEmpty(root)):
        return INT_MIN
    return root.data

def main():
    cdef StackNode* root = NULL

    push(&root, 10)
    push(&root, 20)
    push(&root, 30)
    print("popped: ", pop(&root))
    print("peek: ", peek(root))
