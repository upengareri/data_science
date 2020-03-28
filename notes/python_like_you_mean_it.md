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



