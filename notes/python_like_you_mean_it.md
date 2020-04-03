## NOTES from PLYMI (Python Like You Mean It)

**Improving the readability of numbers:** (Python >= 3.6)
```
# examples of using `_` as a visual delimiter in numbers
>>> 1_000_000  # this is nice!
1000000
```
-----

**Boolean Objects are Integers**

The two boolean objects True and False formally belong to the int type in addition to bool, and are associated with the values 1 and 0, respectively:
```
>>> 3*True - False  # equivalent to: 3*1 + 0
3

>>> True / False  # equivalent to: 1 / 0
---------------------------------------------------------------------------
ZeroDivisionError                         Traceback (most recent call last)
<ipython-input-4-f8487d9d0863> in <module>()
----> 1 True / False

ZeroDivisionError: division by zero
```
-------

**f-string**

An f-string is special because it permits us to write Python code within a string;

----
**Comparing float values**

Never rely on two floats being exactly equal. Instead, check if they are close in value:
```
# checking if two floats are equal is lame!
>>> 0.1 + 0.1 + 0.1 - 0.3 == 0.
False

>>> abs((0.1 + 0.1 + 0.1 - 0.3) - 0.) < 1e-12
True
```
----
**Some immutable objects**

- numbers (integers, floating-point numbers, complex numbers)
- strings
- tuples
- booleans
- “frozen”-sets

**Some mutable objects**

- lists
- dictionaries
- sets
- NumPy arrays

> Immutable objects are `copy by value` while mutable objects are `copy by reference`.
----
**Inline if-else statement**

The expression `A if <condition> else B` returns A if bool(<condition>) evaluates to True, otherwise this expression will return B.

----
**Short-Circuiting Logical Expressions**

In Python, a logical expression is evaluated from left to right and will return its boolean value as soon as it is unambiguously determined, _leaving any remaining portions of the expression unevaluated_.

```
# demonstrating short-circuited logic expressions
>>> False and 1/0  # evaluating `1/0` would raise an error
False
```

---
**Else Clause At The End Of For Loop**

An else clause can be added to the end of any loop (for, while). The body of this else-statement will be executed only if the loop was not exited via a ``break`` statement.

One best example of it would be to find if a list is sorted or not without using an in-built function.

For instance:

given the iterable `my_list = [0, 1, -10, 2]`, unsorted_index should take the value `2`.

given the iterable `my_list = [-1, 0, 3, 6]`, unsorted_index should be `None` and your code should print “sorted!”.

```
my_list = [0, 1, -10, 2]
unsorted_index = None

for index, current_num in enumerate(my_list):
    if index == 0:
        prev_num = current_num
    elif prev_num > current_num:
        unsorted_index = index
        break
    prev_num = current_num
else:
    print("sorted!")
```

> Befor knowing this, I used to take a flag=False and set it before break. I would check it after the for-loop end to see if the flag was set or not. Now, I know for-else :)

----
**ITERABLE**

An iterable is any Python object capable of returning its members one at a time, permitting it to be iterated over in a for-loop.

----
### GENERATORS

**range**

range is a built-in generator, which generates sequences of integers.

```
# A very common use case!
# start:  0  (default, included)
#  stop:  5  (excluded)
#  step:  1  (default)
for i in range(5):
    print(i, end=".. ")
# prints: 0.. 1.. 2.. 3.. 4
```

```
# print 10-1 using range
for i in range(10, 0, -1):
    print(i, end=" ")
```

> Defining generators does not perform any computation but just stores the object at some memory address (which can be seen when we print the generator object). This means that unlike array or other sequences we cannot perform operations like `len` or `indexing []`. The only exception to this is range which is a generator.

**consuming generators**

gen can be fed to any function that accepts iterables. For instance - 

```
>>> gen = (i**2 for i in range(100))
>>> sum(gen)  # computes the sum 0 + 1 + 4 + 9 + 25 + ... + 9801
328350
```

The beauty of the above example is that it _executes sum without storing full sequence of numbers in memory_. In fact, at any point it stores only the current value of the sume and the numbers being added to it.

**iterables vs iterators**

- Every iterator is an iterable but not all iterables are iterators (iterables are subsets of iterators)

- Sequences (e.g list, tuples, strings) and other containers (e.g sets, dictionaries) are iterables but not iterators. We cannot call `next()` on them.

- An iterable can be made iterator by passing it to `iter()` function.

- Python creates an iterator `behind the scenes` when we perform a for-loop. It feeds the iterable to iterator and calls next to it.


**itertools**

The module _itertools_ provides core set of fast, memory efficient tools for creating iterators. Some frequently used tools are -

`BUILT-INS`

- `range`  --> generator that generates sequence of integers in the specified 'range'
- `enumerate`  --> enumerates over an iterable yielding tuple containing (count, item)
- `zip`  --> zips together _corresponding_ elements of various iterables into tuple

`IMPORTS`

- `itertools.chain`  --> chains various iterables into one
- `itertools.combinations`  --> gives comibnation of items in an iterable

**keyword-argument**

If you provide a named input, all the inputs following it must also be named:

```python
# positional arguments cannot follow named arguments
>>> is_bounded(3, lower=2, 4)
SyntaxError: positional argument follows keyword argument
```

**VARIABLE SCOPE**

```python
# this demonstrates scope of variables in different contexts
# nothing meaningful is computed in this file

from itertools import combinations  # `combinations` has file scope

# `my_func` has file scope
# `in_arg1` has restricted scope
# `in_arg2` has restricted scope
# `func_block` has restricted scope
def my_func(in_arg1, in_arg2="cat"):
    func_block = 1
    return None

# `file_var` has file scope
# `comp_var` has restricted scope
file_var = [comp_var**2 for comp_var in [-1, -2]]

# `if_block` has file scope
if True:
    if_block = 2
else:
    if_block = 3

# `it_var` has file scope
# `for_block` has file scope
for it_var in [1, 2, 3]:
    for_block = 1

# `while_block` has file scope
while True:
    while_block = None
    break
```

> Takeaway: Variables defined within a function have a restricted scope such that they do not exist outside of that function. Most other contexts for defining variables in Python produce variables with file scope

**VARIABLE SHADOWING**

What happens when a file-scope variable and a function-scope variable share the same name? This type of circumstance is known as variable shadowing. Python resolves this by giving precedence to the variable with the most restricted scope, when inside that scope:

```python
x = 2
y = 3

def func(x):
    # input-arg `x` overrides file-scope version of `x`
    y = 5  # overrides file-scope version of `y`
    return x + y

# `x` is 2 here, once again
# `y` is 3 here, once again

print(func(-5))  # prints 0
print(x, y)      # prints 2  3
```
Extra Reference: [Python's execution model](https://docs.python.org/3/reference/executionmodel.html)

**DATA STRUCTURE**

_Key notes on Big-O notation:_

- We only care about the “highest-order” term in 𝑓(𝑛). That is, O(𝑛+𝑛<sup>2</sup>) should just be written as O(𝑛<sup>2</sup>).
- We never care about constant factors in our scaling. That is, even if an algorithm iterates over a sequence twice, its big-O complexity should be written as O(𝑛), rather than O(2𝑛).
- An algorithm whose run time does not depend on the size of its input is a O(1) algorithm.
    - Example: a function that returns the second element from a list.

_Big-O note on list:_

- operations that add-to or remove-from the end of the list are O(1)
- operations that add-to or remove-from the beginning of the list are O(𝑛)
    - my_list.pop()	        O(1)
    - my_list.pop(0)	    O(n)
    - my_list.append(obj)	O(1)
    - obj in seq	        O(n)
