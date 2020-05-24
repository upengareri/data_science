# NOTES from PLYMI - PART 3

## --------------- OOP --------------

### -------------- CLASS ATTRIBUTES --------------------

* An object can possess data, known as __attributes__, which summarizes information about that object.
* Functions bound to objects are known as __methods__.
* Another way of saying that is - Attributes that are functions are called methods.
So we can loosely say that everything inside a class is an attribute. The attribute that is function is called a method.
* Attempting to access an undefined attribute from an object will raise an `AttributeError`.

> hasattr, getattr, and setattr are built-in functions that allow us to, by the name of an attribute, check to see if it exists, access its value, and set its value, respectively. Python’s objects are shockingly flexible in that their attributes can be created outside of the formal space of the class definition. That being said, we should be civilized and treat the class definition as a formal contract/specification whenever possible.

Example:
```python

>>> import numpy as np
>>> array = np.array([[0, 1, 2],
...                   [3, 4, 5]])
>>> array.sum()  # use the array-method `sum`
15

# accessing an object's attributes
>>> array.ndim
2
>>> array.shape
(2, 3)

>>> MyGuy.apple
AttributeError: type object 'MyGuy' has no attribute 'apple'

# use `setattr` to bind the attribute `apple` to `MyGuy`
>>> hasattr(MyGuy, "apple")  # MyGuy.apple is not defined
False

# demonstrating `getattr`
>>> MyGuy.x
3
# In addition to using the dot-syntax for accessing attributes, the built-in function getattr can be used to the same effect:

>>> getattr(MyGuy, "x")
3

>>> setattr(MyGuy, "apple", "red")
>>> MyGuy.apple
'red'
```
---

**Type and Class mean the same thing**

In practice, people tend to reserve the word “type” to refer to built-in types (e.g. int and str) and “class” to refer to user-defined types. Again, in the modern versions of Python, these terms carry no practical distinction.

---
```python
class Dummy:
    x = 0
```

### Reading Comprehension: Class Initialization

Using the `Dummy` class defined above, create a list consisting of 10 distinct instances of this type. Write code to explicitly verify that each entry is distinct from the other, and that each entry is an instance of the `Dummy` class.

Then, create a tuple that contains a single instance of `Dummy` stored ten times. Write code to explicitly verify that the entries all reference the exact same object, and that each entry is an instance of the `Dummy` class.

### SOLUTION

```python
# will call `Dummy()` once for each iteration
>>> list_of_dummies = [Dummy() for i in range(10)]

>>> from itertools import combinations
# `combinations(list_of_dummies, 2)` loops over all pairs of entries
# in `list_of_dummies`
>>> all(a is not b for a,b in combinations(list_of_dummies, 2))
True

>>> all(isinstance(a, Dummy) for a in list_of_dummies)
True
```
```python
dummy = Dummy()
tuple_of_dummy = tuple(dummy for i in range(10))

>>> all(dummy is i for i in tuple_of_dummy)
True

>>> all(isinstance(a, Dummy) for a in tuple_of_dummy)
True
```

---

> You should now have a grasp of how the special __init__ method can be used to define and set instance-level attributes for your classes. Furthermore, the basic process by which invoking class instantiation produces an instance object which then automatically gets passed to __init__ as the self argument, should be salient. 

---

