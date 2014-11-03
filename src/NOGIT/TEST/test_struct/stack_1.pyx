from libc.stdlib cimport malloc

cdef import from "limits.h":
    int INT_MIN

cdef struct Stack:
    int top
    unsigned capacity
    int* array

cdef Stack* createStack(unsigned capacity):
    cdef Stack* stack = <Stack*> malloc(sizeof(Stack))
    stack.capacity = capacity
    stack.top = -1
    stack.array = <int*> malloc(stack.capacity * sizeof(int)) 
    return stack

cdef int isFull(Stack* stack):
    return stack.top == stack.capacity - 1

cdef int isEmpty(Stack* stack):
    return stack.top == -1

cdef void push(Stack* stack, int item):
    if isFull(stack): return
    stack.top += 1
    stack.array[stack.top] = item
    print("%d pushed to stack\n") % item

cdef pop(Stack* stack):
    if isEmpty(stack): return INT_MIN
    stack.top -= 1
    return stack.array[stack.top+1]

cdef peek(Stack* stack):
    if isEmpty(stack): return INT_MIN
    return stack.array[stack.top]

def main():
    cdef Stack* stack = createStack(100)
    push(stack, 10)
    push(stack, 20)
    push(stack, 30)
    print("popped: ", pop(stack))
    print("top item: ", peek(stack))
