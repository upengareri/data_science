## NOTES from PLYMT (Python Like You Mean It)

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


